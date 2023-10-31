import 'package:f1_app/app/widgets/event_tracker.dart';
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
                  white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/f1_logo.png",
                      height: 20,
                      color: white,
                    ),
                    Icon(Icons.notifications, color: white),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                // widget black container with rounded corners
                eventTracker(),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "2023",
                      style: customTextStyle(40, softBlack, FontWeight.bold),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: f1RedColor,
                      size: 30,
                    )
                  ],
                ),
                
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
