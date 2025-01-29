import 'dart:ui';

import 'package:flutter/material.dart';

class AppColor {
  static const primaryColor = Color(0xFFF7F7F7);
  static const primaryColorBackGroundColor = Color(0xFF1E1F21);
  static const primaryColorLight = Color(0xff7df8ff);
  static const primaryColorShadow = Color(0x88017073);
  static const primaryColorDark = Color(0xffab9382);
  static const primaryColorTrance = Color(0x344539);
  static const primaryColorBox = Color(0x5CFFFFFF);
  static const primaryColorBorder = Color(0x80707070);
  static const primaryColorBoxTrance = Color(0x16E5E5E5);
  static const activeColor = Color(0xFFDDC2AB);
  static const deActiveColor = Color(0x66DDC2AB);
  static const profileColor = Color(0xFFA5A5A5);
  static LinearGradient primaryColorGradientL =
      LinearGradient(colors: [Color(0xff0fc4cb), Color(0xFF17E79D)]);
  static LinearGradient primaryColorGradientMultiColor = LinearGradient(
    stops: [
      0.1,
      0.4,
      0.6,
      0.9,
    ],
    colors: [
      AppColor.primaryColor,
      AppColor.primaryColorDark,
      AppColor.secondaryColorDark,
      AppColor.secondaryColor,
    ],
  );
  static LinearGradient primaryColorGradientO =
      LinearGradient(colors: [Color(0xFFDDC2AB), Color(0x66DDC2AB)]);
  static LinearGradient primaryColorGradientLTrance = LinearGradient(colors: [
    Color.fromARGB(112, 221, 194, 171),
    Color.fromARGB(32, 221, 194, 171)
  ]);
  static const secondaryColor = Color(0xFF383939);
  static const secondaryColorShadow = Color(0x56383939);
  static const secondaryColorDark = Color(0xFF0B694D);
  static const white = Color(0xFFFFFFFF);
  static const gray = Color(0xFF646464);
  static const lightGrey = Color(0xFFE8E8E8);
  static const black = Color(0xFF000000);
  static const txtColor = Color(0xFF000000);
  static const dangerColor = Color(0xFFBE0000);
}
