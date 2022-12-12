import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:assign_task/Login Screen/login_screen.dart';
import 'package:assign_task/Home Screen/Home_Screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SignIn with Phone Number',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
      // home: const HomeScreen(),
    );
  }
}
