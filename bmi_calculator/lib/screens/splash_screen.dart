import 'dart:async';

import 'package:bmi_calculator/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // bool isLargeScreen = screenWidth >= 400;
    return Scaffold(
      backgroundColor: const Color(0xFF0c1135),
      body: SafeArea(
        child: Column(
          children: [
            Spacer(),
            Center(
              child: Image.asset(
                "images/bmi.png",
                width: screenWidth / 5,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "BMI Calculator",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Text(
              "Created by",
              style: TextStyle(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
              ),
              child: Text(
                "Brinsi Mohamed Taki Allah",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
