import 'dart:async';

import 'package:flutter/material.dart';

import '../../components/app_theme.dart';
import 'onboarding_animation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    waitNow();
    super.initState();
  }

  waitNow() {
    return Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const OnBoardingScreenAnimation(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkBlue,
      body: Center(
        child: Image.asset(
          'Assets/logo.png',
          color: AppTheme.white,
        ),
      ),
    );
  }
}
