import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class SplashView extends GetView {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Delay for 5 seconds and then navigate to the home screen
    Future.delayed(const Duration(seconds: 6), () {
      Get.offNamed(
          '/home'); // Navigate to the home screen using GetX navigation
    });

    return Scaffold(
      body: Center(
        child: Shimmer(
          duration: const Duration(seconds: 2),
          colorOpacity: 0.5,
          child: Image.asset(
            "assets/images/f1_logo.png",
            width: 200,
          ),
        ),
      ),
    );
  }
}
