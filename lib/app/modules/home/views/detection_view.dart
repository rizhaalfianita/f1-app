import 'package:dotted_border/dotted_border.dart';
import 'package:f1_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetectionView extends StatelessWidget {
  const DetectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(mediumPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            RichText(
                text: TextSpan(
                    text: "F1 Car",
                    style: GoogleFonts.titilliumWeb(
                        fontSize: 26,
                        color: f1RedColor,
                        fontWeight: FontWeight.w600),
                    children: [
                  TextSpan(
                    text: " Detection",
                    style: GoogleFonts.titilliumWeb(
                        fontSize: 26,
                        color: softBlack,
                        fontWeight: FontWeight.w600),
                  )
                ])),
            const SizedBox(height: 40),
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
            DottedBorder(
              borderType: BorderType.RRect,
              color: f1RedColor,
              strokeWidth: 1,
              radius: const Radius.circular(12),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
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
          ],
        ),
      ),
    );
  }
}
