import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color f1RedColor = const Color(0xFFFF1801);
Color white = const Color(0xFFFFFFFF);
Color softBlack = const Color(0xFF313131);
Color lightGrey = const Color(0xFF888888);
Color extraLightF1Red = const Color.fromARGB(255, 141, 104, 104);

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
  return TextStyle(
    fontFamily: "F1",
    fontSize: 16,
    fontWeight: fontWeight,
    color: color,
  );
}
