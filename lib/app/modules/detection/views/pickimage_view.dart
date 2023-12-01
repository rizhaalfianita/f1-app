import 'package:dotted_border/dotted_border.dart';
import 'package:f1_app/app/modules/detection/controllers/detection_controller.dart';
import 'package:f1_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PickImageView extends GetView<DetectionController> {
  const PickImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(mediumPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Upload car images",
              style: GoogleFonts.titilliumWeb(
                  color: softBlack, fontWeight: FontWeight.w500, fontSize: 18),
            ),
            const SizedBox(
              height: extraSmallPadding,
            ),
            Text(
              "image should be .png, .jpeg, .jpg",
              style: GoogleFonts.titilliumWeb(
                  color: lightGrey, fontWeight: FontWeight.w400, fontSize: 16),
            ),
            const SizedBox(
              height: mediumPadding,
            ),
            Obx(() => controller.pickedImage.value != null
                ? Image.file(controller.pickedImage.value!)
                : InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: SizedBox(
                                height: 120,
                                child: Column(
                                  children: [
                                    Text(
                                      "Choose from:",
                                      style: GoogleFonts.titilliumWeb(
                                          color: softBlack,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18),
                                    ),
                                    const SizedBox(
                                      height: smallPadding,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            controller.getFromGallery();
                                            Get.back();
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: mediumPadding),
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                  "assets/images/image.png",
                                                  height: 50,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Gallery",
                                                  style:
                                                      GoogleFonts.titilliumWeb(
                                                          color: softBlack,
                                                          fontSize: 14),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            controller.getFromCamera();
                                            Get.back();
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: mediumPadding),
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                  "assets/images/camera.png",
                                                  height: 50,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Camera",
                                                  style:
                                                      GoogleFonts.titilliumWeb(
                                                          color: softBlack,
                                                          fontSize: 14),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      color: f1RedColor,
                      strokeWidth: 1,
                      radius: const Radius.circular(12),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        child: Container(
                          height: 300,
                          width: 300,
                          color: extraLightF1Red,
                          child: Image.asset(
                            "assets/images/image_logo.png",
                          ),
                        ),
                      ),
                    ),
                  )),
            const SizedBox(height: smallPadding),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 2,
                  backgroundColor: f1RedColor,
                  fixedSize: const Size.fromWidth(120),
                ),
                child: Text(
                  "Detect",
                  style: GoogleFonts.titilliumWeb(
                      color: white, fontSize: 14, fontWeight: FontWeight.w600),
                )),
            const SizedBox(
              height: mediumPadding,
            ),
            Text(
              "Result",
              style: GoogleFonts.titilliumWeb(
                  color: softBlack, fontSize: 15, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: extraSmallPadding),
            Text(
              "NO RESULT",
              style: GoogleFonts.titilliumWeb(
                  color: f1RedColor, fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: largePadding),
          ],
        ),
      ),
    ));
  }
}
