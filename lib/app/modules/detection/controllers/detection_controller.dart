import 'dart:io';

import 'package:camera/camera.dart';
import 'package:f1_app/helper/image_classification_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DetectionController extends GetxController with WidgetsBindingObserver {
  var cameraController = Rx<CameraController?>(null);

  var imageClassificationHelper = Rx<ImageClassificationHelper?>(null);
  RxMap<String, double> classification = <String, double>{}.obs;
  RxBool isProcessing = false.obs;

  bool cameraIsAvailable = Platform.isAndroid || Platform.isIOS;
  final ImagePicker picker = ImagePicker();
  // var pickedFile = Rx<File?>(null);
  Rx<File?> pickedImage = Rx<File?>(null);

  initCamera() async {
    if (cameraIsAvailable) {
      // get list available camera
      var cameraDescription = (await availableCameras()).first;
      // init camera controller
      cameraController.value = CameraController(
        cameraDescription,
        ResolutionPreset.medium,
      );
      cameraController.value!.initialize().then((value) {
        cameraController.value!.startImageStream(imageAnalysis);
        update();
      });
      print("CAMERA : " + cameraController.value.toString());
      print("INIT CAMERA DONE");
    }
  }

  Future<void> imageAnalysis(CameraImage cameraImage) async {
    // if image is still analyze, skip this frame
    if (isProcessing.value) {
      return;
    }
    isProcessing.value = true;
    classification.value = (await imageClassificationHelper.value!
        .inferenceCameraFrame(cameraImage));
    isProcessing.value = false;
    print("CLASSIFICATION : " + classification.value.toString());
    update();
  }

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    initCamera();
    imageClassificationHelper.value = ImageClassificationHelper();
    imageClassificationHelper.value!.initHelper();
    super.onInit();
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    cameraController.value!.dispose();
    imageClassificationHelper.value!.close();
    super.onClose();
  }

  Future getFromGallery() async {
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      pickedImage.value = File(image.path);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future getFromCamera() async {
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.camera);
      if (image == null) return;
      pickedImage.value = File(image.path);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
