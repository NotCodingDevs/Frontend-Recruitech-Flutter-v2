import 'package:flutter/material.dart';

class CustomTextStyle {
  static const fontFamily = 'Gilroy';

  static const buttonText = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
    color: Colors.white,
  );

  static const titleLarge = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 36.0,
    color: Color(0xFF0C1E38),
  );

  static const inputPlaceHolder = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
    color: Color(0xFF8D8D8D),
  );

  static const titleSmall = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 18.0,
    color: Color(0xFF0C1E38),
  );

  static const titleMedium = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 20.0,
    color: Color(0xFF0C1E38),
  );

  static const bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 18.0,
    color: Color(0xFF504848),
    height: 1.2,
  );
}
