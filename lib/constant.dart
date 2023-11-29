import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color f1RedColor = const Color(0xFFFF1801);
Color f1BlackColor = const Color(0xFF171717);
Color white = const Color(0xFFFFFFFF);
Color softBlack = const Color(0xFF313131);
Color lightGrey = const Color(0xFF888888);
Color darkF1Red = const Color.fromARGB(255, 141, 104, 104);
Color extraLightF1Red = const Color.fromARGB(255, 255, 242, 241);

const extraSmallPadding = 8.0;
const smallPadding = 12.0;
const regularPadding = 16.0;
const mediumPadding = 20.0;
const largePadding = 24.0;
const extraLargePadding = 32.0;

const smallRounded = 12.0;
const regularRounded = 16.0;
const mediumRounded = 20.0;
const largeRounded = 28.0;

var buttonShadow = BoxShadow(
  color: lightGrey.withOpacity(0.1),
  blurRadius: 8,
  offset: const Offset(0, 2),
);

TextStyle customTextStyle(double size, Color color, FontWeight fontWeight) {
  return TextStyle(
    fontFamily: "F1",
    fontSize: size,
    fontWeight: fontWeight,
    color: color,
  );
}

TextStyle subtitle(Color color) {
  return TextStyle(
    fontFamily: "F1",
    fontSize: 10,
    fontWeight: FontWeight.normal,
    color: color,
  );
}

TextStyle bodySmall(Color color, FontWeight fontWeight) {
  return GoogleFonts.titilliumWeb(
    textStyle: TextStyle(
      fontSize: 12,
      fontWeight: fontWeight,
      color: color,
    ),
  );
}

TextStyle bodyMedium(Color color, FontWeight fontWeight) {
  return GoogleFonts.titilliumWeb(
    textStyle: TextStyle(
      fontSize: 14,
      fontWeight: fontWeight,
      color: color,
    ),
  );
}

TextStyle bodyLarge(Color color, FontWeight fontWeight) {
  return GoogleFonts.titilliumWeb(
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: fontWeight,
      color: color,
    ),
  );
}
