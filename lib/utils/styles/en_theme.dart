import 'package:flutter/material.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';

ThemeData get enTheme => ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        headlineMedium: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        headlineSmall: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        titleLarge: TextStyle(
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        titleMedium: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        titleSmall: TextStyle(
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.kPrimaryColor,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,

      )
    ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: AppColors.kPrimaryColor,
    unselectedItemColor: AppColors.kGreyColor,
    showUnselectedLabels: true,
    backgroundColor: Colors.white,
    elevation: 0
  )
);