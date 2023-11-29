import 'package:f1_app/app/modules/home/views/detection_view.dart';
import 'package:f1_app/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavbarController extends GetxController {
  final currentIndex = 0.obs;
  final List<Widget> screens = [
    HomeView(),
    DetectionView(),
    
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

  void getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      // convert to base64 string
      Image? img = null;
      final data = await pickedFile.readAsBytes();
      // await decodeImageFromList(data).then((value) => img = value as Image?);
      Get.toNamed('/waste-classification', arguments: data);
      print("Image: ${data.toString()}");
    }
  }
}
