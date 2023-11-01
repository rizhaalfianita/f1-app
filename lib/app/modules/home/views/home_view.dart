import 'package:f1_app/app/widgets/event_tracker.dart';
import 'package:f1_app/app/widgets/race_result_item.dart';
import 'package:f1_app/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                const EventTracker(),
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
                const SizedBox(height: 10),
                DefaultTabController(
                    length: controller.dummyF1Season.length,
                    child: Column(
                      children: [
                        TabBar(
                          isScrollable: true,
                          labelPadding: const EdgeInsets.only(right: 30.0),
                          labelColor: f1RedColor,
                          unselectedLabelColor: extraLightF1Red,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: f1RedColor,
                          tabs: controller.dummyF1Season.map((f1) {
                            return Tab(
                              text: f1.country,
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          height: size.height * 2.7,
                          child: TabBarView(
                              physics: const NeverScrollableScrollPhysics(),
                              children: controller.dummyF1Season.map((f1) {
                                return raceResultItem(f1);
                              }).toList()),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  // Widget raceResults() {
  //   return Obx(() {
  //     if (controller.isLoading.value) {
  //       return Center(
  //         child: CircularProgressIndicator(
  //           color: f1RedColor,
  //           strokeWidth: 5,
  //         ),
  //       );
  //     } else {
  //       return Column(
  //         children: [
  //           Row(
  //             children: [
  //               Text(controller.allSeasons.value[0].year!),
  //             ],
  //           ),
  //           controller.season.value[controller.selectedSeason.value] == null
  //               ? CircularProgressIndicator(
  //                   color: f1RedColor,
  //                   strokeWidth: 5,
  //                 )
  //               : ScrollableListTabScroller(
  //                   itemCount: controller
  //                       .season.value[controller.selectedSeason.value]!.length,
  //                   tabBuilder: (context, int index, bool active) => Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: Text(
  //                       controller
  //                           .season
  //                           .value[controller.selectedSeason.value]![index]
  //                           .country!,
  //                       style: !active
  //                           ? null
  //                           : TextStyle(
  //                               color: Colors.white,
  //                               fontSize: 18,
  //                               fontWeight: FontWeight.bold),
  //                     ),
  //                   ),
  //                   itemBuilder: (BuildContext context, int index) => Column(
  //                     children: [
  //                       Text(controller
  //                           .season
  //                           .value[controller.selectedSeason.value]![index]
  //                           .country!),
  //                     ],
  //                   ),
  //                 )
  //         ],
  //       );
  //     }
  //   });
  // }
}
