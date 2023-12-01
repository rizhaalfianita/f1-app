import 'package:f1_app/app/modules/detection/views/detection_view.dart';
import 'package:f1_app/app/modules/home/views/home_view.dart';
import 'package:f1_app/app/modules/track_map/views/track_map_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavbarController extends GetxController {
  final currentIndex = 0.obs;
  final List<Widget> screens = [
    HomeView(),
    DetectionView(),
    TrackMapView()
  ].obs;

  void changePage(int index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
