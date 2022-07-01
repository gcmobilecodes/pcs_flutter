import 'package:flutter/material.dart';

import 'color_utils.dart';

class TextStyleConstants {
  static TextStyle commonStyle =
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
  static TextStyle commonStylebold =
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
  static TextStyle commonStyle2 =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
  static TextStyle fonteventHead =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
  static TextStyle commonStyle2bold =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  static TextStyle forgotStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: SlicingColors.forgotPassColor);
  static TextStyle upStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: SlicingColors.buttonColor);
  static TextStyle headStyle = const TextStyle(
      fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black);
}
