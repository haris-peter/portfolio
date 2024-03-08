// Created by: Haris Josin Peter, Created at: 08-03-2024 02:43 pm
import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/ui/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the main screen after a delay
    Future.delayed(const Duration(seconds: 11), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset('assets/images/coding.gif'),
      ),
    );
  }
}
