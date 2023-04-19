import 'dart:async';
import 'package:flutter/material.dart';
import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(milliseconds: 1200),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) =>  LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: 
              Image.network(
                'https://www.laumcrh.com/images/logo.png',
                fit: BoxFit.fitWidth,
              ),
          ),
        ),
      );
  
  }
}
