import 'dart:async';

import 'package:flutter/material.dart';
import 'package:parcel_smart/screens/onboarding_screens/get_started.dart';

import 'onboarding_three.dart';

class OnboardingScreenTwo extends StatefulWidget {
  @override
  State<OnboardingScreenTwo> createState() => _OnboardingScreenTwoState();
}

class _OnboardingScreenTwoState extends State<OnboardingScreenTwo> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const GetStarted()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,  // White background for first screen
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/onboardingOne.png', height: 210, width: 210,), // Logo


          ],
        ),
      ),
    );
  }
}