import 'package:f1_app/app/modules/detection/views/livecam_view.dart';
import 'package:f1_app/app/modules/detection/views/pickimage_view.dart';
import 'package:f1_app/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/detection_controller.dart';

class DetectionView extends GetView<DetectionController> {
  const DetectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelColor: white,
            labelStyle: GoogleFonts.titilliumWeb(fontSize: 16),
            indicatorColor: softBlack,
            unselectedLabelColor: white.withOpacity(0.7),
            tabs: const [
              Tab(
                text: "Pick Image",
              ),
              Tab(
                text: "Live Camera",
              )
            ],
          ),
          title: Text('F1 Car Team Detection',
              style: GoogleFonts.titilliumWeb(
                  fontSize: 20, fontWeight: FontWeight.bold, color: white)),
          backgroundColor: f1RedColor,
          centerTitle: true,
        ),
        body: const TabBarView(
          children: [PickImageView(), LivecamView()],
        ),
      ),
    ));
  }
}
