import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';


const Color bluishClr = Color(0xFF4e5ae8);
const Color greenClr = Color(0xFF689F38);
const Color greenClr1 = Color(0xFFDCEDC8);
const Color greenClr2 = Color(0xFFC5E1A5);
const Color yellowClr1 = Color(0xFFEEFF41);
const Color yellowClr = Color(0xFFFFB746);
const Color pinksClr = Color(0xFFff4667);
const Color whiteClr = Colors.white;
const primaryClr  = bluishClr;
const Color darkGreyClr = Color(0xFF121212);
const Color darkHeaderClr = Color(0xFF424242);

class ThemesColor {

  static final light =  ThemeData(
      backgroundColor: Colors.white,
      brightness: Brightness.light
  );

  static final dark =  ThemeData(
    backgroundColor: darkGreyClr,
    brightness: Brightness.dark,
  );




}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato (
      textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Get.isDarkMode?Colors.grey[400]:Colors.grey
      )
  );
}


TextStyle get headingStyle {
  return GoogleFonts.lato (
      textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Get.isDarkMode?Colors.white:Colors.black
      )
  );
}


TextStyle get titleStyle {
  return GoogleFonts.lato (
      textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Get.isDarkMode?Colors.white:Colors.black
      )
  );
}

