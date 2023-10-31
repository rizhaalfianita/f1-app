import 'package:f1_app/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scrollable_list_tab_scroller/scrollable_list_tab_scroller.dart';
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
                raceResults()
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

  Widget raceResults() {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: f1RedColor,
            strokeWidth: 5,
          ),
        );
      } else {
        return Column(
          children: [
            Row(
              children: [
                Text(controller.allSeasons.value[0].year!),
              ],
            ),
            controller.season.value[controller.selectedSeason.value] == null
                ? CircularProgressIndicator(
                    color: f1RedColor,
                    strokeWidth: 5,
                  )
                : ScrollableListTabScroller(
                    itemCount: controller
                        .season.value[controller.selectedSeason.value]!.length,
                    tabBuilder: (context, int index, bool active) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        controller
                            .season
                            .value[controller.selectedSeason.value]![index]
                            .country!,
                        style: !active
                            ? null
                            : TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                      ),
                    ),
                    itemBuilder: (BuildContext context, int index) => Column(
                      children: [
                        Text(controller
                            .season
                            .value[controller.selectedSeason.value]![index]
                            .country!),
                      ],
                    ),
                  )
          ],
        );
      }
    });
  }
}
