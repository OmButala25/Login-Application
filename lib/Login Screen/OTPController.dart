import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Home Screen/Home_Screen.dart';
// import 'package:assign_task/Home Screen/Home_Screen.dart';
// import 'package:firebase_core/firebase_core.dart';

class OTPControllerScreen extends StatefulWidget {
  var phone;
  var codedigits;

  OTPControllerScreen(
      {super.key, required this.phone, required this.codedigits});

  @override
  State<OTPControllerScreen> createState() => _OTPControllerScreenState();
}

class _OTPControllerScreenState extends State<OTPControllerScreen> {
  final GlobalKey<ScaffoldState> _scaffolKey = GlobalKey<ScaffoldState>();
  final TextEditingController _pinOTPCodeController = TextEditingController();
  final FocusNode _pinCodeFocused = FocusNode();
  String verification = "";

  final defaultPinTheme = PinTheme(
    width: 60,
    height: 64,
    textStyle: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
    decoration: const BoxDecoration(color: Color.fromRGBO(159, 132, 193, 0.8)),
  );

  // final BoxDecoration _pinOTPCodeDecoration = BoxDecoration(
  //   color: Colors.blueAccent,
  //   borderRadius: BorderRadius.circular(10),
  //   border: Border.all(
  //     color: Colors.grey,
  //   ),
  // );

  @override
  void initState() {
    super.initState();
    verifyPhoneNumber();
  }

  verifyPhoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "${widget.codedigits + widget.phone}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) => {
                  if (value.user != null)
                    {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (c) => const HomeScreen()))
                    }
                });
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.message.toString()),
          duration: const Duration(seconds: 3),
        ));
      },
      codeSent: (String vID, int? resendToken) {
        setState(() {
          verification = vID;
        });
      },
      codeAutoRetrievalTimeout: (String vID) {
        setState(() {
          verification = vID;
        });
      },
      timeout: const Duration(seconds: 60),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffolKey,
      appBar: AppBar(
        title: const Text('OTP Verification'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/otp.png'),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  verifyPhoneNumber();
                },
                child: Text(
                  'Verifying ${widget.codedigits}- ${widget.phone}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Pinput(
              length: 6,
              defaultPinTheme: defaultPinTheme,
              focusNode: _pinCodeFocused,
              controller: _pinOTPCodeController,
              submittedPinTheme: defaultPinTheme,
              // selectionControls: defaultPinTheme,
              followingPinTheme: defaultPinTheme,
              pinAnimationType: PinAnimationType.rotation,
              onSubmitted: (pin) async {
                try {
                  await FirebaseAuth.instance
                      .signInWithCredential(PhoneAuthProvider.credential(
                          verificationId: verification, smsCode: pin))
                      .then((value) {
                    if (value.user != null) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                    }
                  });
                } catch (e) {
                  FocusScope.of(context).unfocus();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Invalid OTP"),
                    duration: Duration(seconds: 3),
                  ));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
