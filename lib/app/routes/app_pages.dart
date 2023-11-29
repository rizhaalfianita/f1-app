import 'package:f1_app/app/modules/home/views/navbar_view.dart';
import 'package:get/get.dart';

import '../modules/detection/bindings/detection_binding.dart';
import '../modules/detection/views/detection_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/splash_view.dart';
import '../modules/track_map/bindings/track_map_binding.dart';
import '../modules/track_map/views/track_map_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DETECTION;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(), // Set SplashView as the splash screen
      binding: HomeBinding(), // Set splash binding
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.NAVBAR,
      page: () => const NavbarView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TRACK_MAP,
      page: () => const TrackMapView(),
      binding: TrackMapBinding(),
    ),
    GetPage(
      name: _Paths.DETECTION,
      page: () => const DetectionView(),
      binding: DetectionBinding(),
    ),
  ];
}
