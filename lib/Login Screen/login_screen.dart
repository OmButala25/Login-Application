// import 'package:assign_task/Login%20Screen/OTPController.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import 'OTPController.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String dialcodedigits = '+91';
  final TextEditingController _controller = TextEditingController();
  // static Map<String, TextEditingController> textMap = {
  //   '_controller': _controller
  // };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28.0, right: 28.0),
              child: Image.asset('images/login.jpg'),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: const Center(
                child: Text(
                  "Phone Login",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            SizedBox(
              width: 400,
              height: 60,
              child: CountryCodePicker(
                onChanged: (country) {
                  setState(() {
                    dialcodedigits = country.dialCode!;
                  });
                },
                initialSelection: "IN",
                showCountryOnly: false,
                showOnlyCountryWhenClosed: false,
                favorite: const ["+1", "US", "+91", "IN"],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Phone Number",
                  prefix: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(dialcodedigits),
                  ),
                ),
                maxLength: 12,
                keyboardType: TextInputType.number,
                controller: _controller,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (c) => OTPControllerScreen(
                              phone: _controller,
                              codedigits: dialcodedigits,
                            )));
                  },
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
