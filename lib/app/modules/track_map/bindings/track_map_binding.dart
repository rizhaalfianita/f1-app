import 'package:get/get.dart';

import '../controllers/track_map_controller.dart';

class TrackMapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrackMapController>(
      () => TrackMapController(),
    );
  }
}
