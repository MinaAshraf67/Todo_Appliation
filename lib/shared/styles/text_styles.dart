import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/shared/styles/colors.dart';

class AppTextStyleLightTheme {
  static final TextStyle bodySmall = GoogleFonts.poppins(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: MyColors.blackColor,
  );
  static final TextStyle bodyMedium = GoogleFonts.poppins(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: MyColors.blackColor,
  );
  static final TextStyle bodyLarage = GoogleFonts.poppins(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: MyColors.blackColor,
  );
  static final TextStyle labelSmall = GoogleFonts.poppins(
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    color: MyColors.blackColor,
  );
}

class AppTextStyleDarkTheme {
  static final TextStyle bodySmall = GoogleFonts.poppins(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: MyColors.whiteColor,
  );
  static final TextStyle bodyMedium = GoogleFonts.poppins(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: MyColors.whiteColor,
  );
  static final TextStyle bodyLarage = GoogleFonts.poppins(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: MyColors.whiteColor,
  );
  static final TextStyle labelSmall = GoogleFonts.poppins(
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    color: MyColors.whiteColor,
  );
}
