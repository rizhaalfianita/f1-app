import 'package:camera/camera.dart';
import 'package:f1_app/app/modules/detection/controllers/detection_controller.dart';
import 'package:f1_app/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LivecamView extends GetView<DetectionController>
    with WidgetsBindingObserver {
  const LivecamView({Key? key}) : super(key: key);

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.paused:
        controller.cameraController.value!.stopImageStream();
        break;
      case AppLifecycleState.resumed:
        if (!controller.cameraController.value!.value.isStreamingImages) {
          await controller.cameraController.value!
              .startImageStream(controller.imageAnalysis);
        }
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            cameraWidget(context),
            Align(
              alignment: Alignment.bottomCenter,
              child: Obx(
                () => Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (controller.classification.value.isNotEmpty)
                        ...(controller.classification.value.entries.toList()
                              ..sort(
                                (a, b) => a.value.compareTo(b.value),
                              ))
                            .reversed
                            .take(3)
                            .map(
                              (e) => Card(
                                child: cardClassification(e.key, e.value),
                              ),
                            ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }

  Widget cameraWidget(context) {
    var camera = controller.cameraController.value!.value;
    // fetch screen size
    final size = MediaQuery.of(context).size;

    // calculate scale depending on screen and camera ratios
    // this is actually size.aspectRatio / (1 / camera.aspectRatio)
    // because camera preview size is received as landscape
    // but we're calculating for portrait orientation
    var scale = size.aspectRatio * camera.aspectRatio;

    // to prevent scaling down, invert the value
    if (scale < 1) scale = 1 / scale;

    return Transform.scale(
      scale: scale,
      child: Center(
        child: CameraPreview(controller.cameraController.value!),
      ),
    );
  }

  Widget cardClassification(String key, double value) {
    String img = key;
    String team = key;

    // alfaromeo
// alpha tauri
// alpine
// aston martin
// ferrari
// haas
// mclaren
// mercedes
// red bull
// williams
    if (key.isCaseInsensitiveContains("alfaromeo")) {
      img = "assets/images/alfaromeo.png";
      team = "Alfa Romeo";
    } else if (key.isCaseInsensitiveContains("alpha tauri")) {
      img = "assets/images/alphatauri.png";
      team = "Alpha Tauri";
    } else if (key.isCaseInsensitiveContains("alpine")) {
      img = "assets/images/alpine.png";
      team = "Alpine";
    } else if (key.isCaseInsensitiveContains("aston martin")) {
      img = "assets/images/astonmartin.jpg";
      team = "Aston Martin";
    } else if (key.isCaseInsensitiveContains("ferrari")) {
      img = "assets/images/ferrari.png";
      team = "Ferrari";
    } else if (key.isCaseInsensitiveContains("haas")) {
      img = "assets/images/haas.png";
      team = "Haas";
    } else if (key.isCaseInsensitiveContains("mclaren")) {
      img = "assets/images/mclaren.png";
      team = "McLaren";
    } else if (key.isCaseInsensitiveContains("mercedes")) {
      img = "assets/images/mercedes.png";
      team = "Mercedes";
    } else if (key.isCaseInsensitiveContains("red bull")) {
      img = "assets/images/redbull.png";
      team = "Red Bull";
    } else if (key.isCaseInsensitiveContains("williams")) {
      img = "assets/images/william.png";
      team = "Williams";
    }

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, 2), blurRadius: 6.0)
          ]),
      child: Row(
        children: [
          Image.asset(
            img,
            width: 70,
            height: 70,
          ),
          const SizedBox(
            width: 10,
          ),
          // titilium web fornt
          Text(
            team,
            style: GoogleFonts.titilliumWeb(
                fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Text(
            "${(value * 100).toStringAsFixed(2)}%",
            style: GoogleFonts.titilliumWeb(
                fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
