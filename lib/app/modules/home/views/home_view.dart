import 'package:f1_app/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(children: [
          // gradient background
          Container(
            height: Get.height * 0.5,
            width: Get.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: const [0.15, 1],
                colors: [
                  f1RedColor,
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    "assets/images/f1_logo.png",
                    height: 25,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                // widget black container with rounded corners
                eventTracker(),
                const SizedBox(
                  height: 30,
                ),
                const Column(
                  children: [],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Container eventTracker() {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: const Color(0xFF171717),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(flex: 1, child: Container()),
          Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1F754C),
                  borderRadius: BorderRadius.circular(8),
                ),
              ))
        ],
      ),
    );
  }
}
