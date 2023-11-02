import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
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
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
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
                    controller.isLoading.value
                        ? Center(
                            child: CircularProgressIndicator(
                            color: f1RedColor,
                          ))
                        : dropdownSeason(),
                    const SizedBox(height: 10),
                    controller.isLoadingSeason.value
                        ? Center(
                            child: CircularProgressIndicator(
                              color: f1RedColor,
                            ),
                          )
                        : raceResult(size)
                  ],
                ),
              )),
        ]),
      ),
    );
  }

  DefaultTabController raceResult(Size size) {
    return DefaultTabController(
        length: controller.season[controller.selectedSeason.value]!.length,
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
              labelPadding: const EdgeInsets.only(right: 30.0),
              labelColor: f1RedColor,
              unselectedLabelColor: extraLightF1Red,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: f1RedColor,
              tabs:
                  controller.season[controller.selectedSeason.value]!.map((f1) {
                return Tab(
                  text: f1.country,
                );
              }).toList(),
            ),
            SizedBox(
              height: size.height * 2.9,
              child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: controller
                      .season.value[controller.selectedSeason.value]!
                      .map((f1) {
                    return raceResultItem(f1);
                  }).toList()),
            )
          ],
        ));
  }

  Obx dropdownSeason() {
    return Obx(() => CoolDropdown(
          dropdownList: controller.allSeasons
              .map((e) => CoolDropdownItem(label: e.year!, value: e.year!))
              .toList(),
          controller: controller.dropdownController.value,
          onChange: (value) {
            controller.fetchF1Season(value);
            controller.selectedSeason.value = value;
          },
          defaultItem: CoolDropdownItem(
            label: controller.selectedSeason.value,
            value: controller.selectedSeason.value,
          ),
          dropdownOptions: DropdownOptions(
            padding: const EdgeInsets.all(10.0),
            color: white,
          ),
          dropdownItemOptions: DropdownItemOptions(
            render: DropdownItemRender.label,
            selectedPadding: EdgeInsets.zero,
            mainAxisAlignment: MainAxisAlignment.center,
            selectedBoxDecoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: f1RedColor.withOpacity(0.7),
                  width: 3,
                ),
              ),
            ),
            selectedTextStyle: TextStyle(
                color: f1RedColor, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ));
  }
}
