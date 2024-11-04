import 'package:eshop/core/constants/strings.dart';
import 'package:eshop/core/styles/colors.dart';
import 'package:flutter/material.dart';

ThemeData appTheme() => ThemeData(

  useMaterial3: false,
  primarySwatch: buildMaterialColor(AppColors.primary),
  primaryColor: AppColors.primary,
  // hintColor: AppColors.hint,
  brightness: Brightness.light,
  fontFamily: AppStrings.fontFamily,
  // scaffoldBackgroundColor: AppColors.background.withOpacity(0.2),
  scaffoldBackgroundColor: Colors.white,
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColors.primary,
    focusColor: AppColors.primary,
  ),

  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.primary, //thereby
  ),
);




ThemeData appDarkTheme() => ThemeData(
  useMaterial3: false,
  primarySwatch: buildMaterialColor(AppColors.primaryDarkTheme),
  primaryColor: AppColors.primaryDarkTheme,
  brightness: Brightness.dark,  // Set dark theme brightness
  fontFamily: AppStrings.fontFamily,
  scaffoldBackgroundColor: AppColors.backgroundDark,
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColors.primary,
    focusColor: AppColors.primary,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.primary,
  ),
);

MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
