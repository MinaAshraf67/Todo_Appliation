import 'package:flutter/material.dart';
import 'package:todo_app/shared/styles/colors.dart';
import 'package:todo_app/shared/styles/text_styles.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: MyColors.backgroundLight,
    textTheme: TextTheme(
        bodySmall: AppTextStyleLightTheme.bodySmall,
        bodyMedium: AppTextStyleLightTheme.bodyMedium,
        bodyLarge: AppTextStyleLightTheme.bodyLarage,
        labelSmall: AppTextStyleLightTheme.labelSmall),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: MyColors.whiteColor,
      selectedItemColor: MyColors.primaryColor,
      unselectedItemColor: MyColors.unselectedItem,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      type: BottomNavigationBarType.fixed,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: MyColors.backgroundDark,
    textTheme: TextTheme(
        bodySmall: AppTextStyleDarkTheme.bodySmall,
        bodyMedium: AppTextStyleDarkTheme.bodyMedium,
        bodyLarge: AppTextStyleDarkTheme.bodyLarage,
        labelSmall: AppTextStyleDarkTheme.labelSmall),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: MyColors.onbackgroundDark,
      selectedItemColor: MyColors.primaryColor,
      unselectedItemColor: MyColors.unselectedItem,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      type: BottomNavigationBarType.fixed,
    ),
  );
}
