import 'package:flutter/material.dart';

import 'color_utils.dart';


ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  accentColor: SlicingColors.colorAccent,
  primaryColorDark:  SlicingColors.colorAccent,

  brightness: Brightness.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor:  SlicingColors.colorPrimary,
  primaryColorBrightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
      actionsIconTheme: IconThemeData(color: Colors.black),
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      elevation: 0.0,
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.w800)),
  //focusColor: Color(0x1aF5E0C3),
);

