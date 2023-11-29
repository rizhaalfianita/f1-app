import 'package:f1_app/app/modules/detection/views/detection_view.dart';
import 'package:f1_app/app/modules/home/controllers/home_controller.dart';
import 'package:f1_app/app/modules/home/views/home_view.dart';
import 'package:f1_app/app/modules/track_map/views/track_map_view.dart';
import 'package:f1_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class NavbarView extends GetView<HomeController> {
  const NavbarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: const [HomeView(), TrackMapView(), DetectionView()],
      controller: controller.navbarController,
      navBarStyle: NavBarStyle.style9,
      decoration: NavBarDecoration(
        //  rounded jus in top
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8), topRight: Radius.circular(8)),
        colorBehindNavBar: Colors.white,
      ),
      backgroundColor: f1BlackColor,
      navBarHeight: 60,
      items: [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: ("Home"),
          activeColorPrimary: f1RedColor,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.map),
          title: ("Track Map"),
          activeColorPrimary: f1RedColor,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.camera_alt),
          title: ("Detection"),
          activeColorPrimary: f1RedColor,
          inactiveColorPrimary: Colors.white,
        ),
      ],
    );
  }
}
