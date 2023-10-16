import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/shared/styles/colors.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: MyColors.backgroundLight,
    textTheme: TextTheme(
      bodySmall: GoogleFonts.poppins(
        fontSize: 20.0,
        fontWeight: FontWeight.normal,
        color: MyColors.blackColor,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 25.0,
        fontWeight: FontWeight.normal,
        color: MyColors.blackColor,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: MyColors.blackColor,
      ),
      labelSmall: GoogleFonts.poppins(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: MyColors.blackColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: MyColors.whiteColor,
      selectedItemColor: MyColors.primaryColor,
      unselectedItemColor: MyColors.bottomNavUnselectedItem,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      type: BottomNavigationBarType.fixed,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: MyColors.backgroundDark,
    textTheme: TextTheme(
      bodySmall: GoogleFonts.poppins(
        fontSize: 20.0,
        fontWeight: FontWeight.normal,
        color: MyColors.whiteColor,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 25.0,
        fontWeight: FontWeight.normal,
        color: MyColors.whiteColor,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: MyColors.whiteColor,
      ),
      labelSmall: GoogleFonts.poppins(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: MyColors.whiteColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: MyColors.onbackgroundDark,
      selectedItemColor: MyColors.primaryColor,
      unselectedItemColor: MyColors.bottomNavUnselectedItem,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      type: BottomNavigationBarType.fixed,
    ),
  );
}
