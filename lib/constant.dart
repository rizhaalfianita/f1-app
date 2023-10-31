import 'package:flutter/material.dart';

Color f1RedColor = const Color(0xFFFF1801);
Color white = const Color(0xFFFFFFFF);
Color softBlack = const Color(0xFF313131);
Color border = const Color(0xFFD2D2D2);

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
  return TextStyle(
    fontFamily: "F1",
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: color,
  );
}

TextStyle bodyMedium(Color color, FontWeight fontWeight) {
  return TextStyle(
    fontFamily: "F1",
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: color,
  );
}

TextStyle bodyLarge(Color color, FontWeight fontWeight) {
  return TextStyle(
    fontFamily: "F1",
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: color,
  );
}
