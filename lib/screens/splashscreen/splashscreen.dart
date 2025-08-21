import 'package:animate_do/animate_do.dart';
import 'package:event_app/cores/appcolors/appcolors.dart';
import 'package:event_app/cores/appimages/appimages.dart';
import 'package:event_app/screens/intropage/intropage.dart';
import 'package:event_app/screens/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';

import '../Authentication/Login/loginscreen.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();

    // Set a delay before navigating to the main screen
    Future.delayed(Duration(seconds: 3), () {
      // Navigate to the main screen after the delay
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => IntroPage(),
        ), // Replace with your main screen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(child: ZoomIn(
        delay: Duration(milliseconds: 400),
          animate: true,
          curve: Curves.easeOutQuart,
          child: Image.asset(AppImages.splashLogo))),
    );
  }
}
