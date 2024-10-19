import 'package:flutter/material.dart';

class AppColors{
  static const Color kPrimaryColor = Color(0xFF008C8C);
  static const Color kRedColor = Color(0xFFE70847);
  static const Color kLightRedColor = Color(0xFFC34D33);
  static const Color kSnackBarColor = Color(0xFF49516F);
  // static const Color kGreyTextColor = Color(0xFF586473);
  static const Color kGreyColor = Color(0xFFB3B3B3);
  static Color kLightBlackColor = const Color(0xFF000000).withOpacity(0.71);
  static const Color kYellowColor = Color(0xFFF0C324);
  static const Color kLightGreyColor = Color(0xFFF3F1F1);
  static const Color kGreyTextColor = Color(0xFF6F6F6F);
  static const Color kDividerColor = Color(0xFFE9E9E9);
  static const Color kGreyIconColor = Color(0xFF66676E);
  static const MaterialColor whiteMaterialColor = MaterialColor(
    0xFFFFFFFF, // The primary color value (white)
    <int, Color>{
      50: Color(0xFFFFFFFF), // 10%
      100: Color(0xFFFFFFFF), // 20%
      200: Color(0xFFFFFFFF), // 30%
      300: Color(0xFFFFFFFF), // 40%
      400: Color(0xFFFFFFFF), // 50%
      500: Color(0xFFFFFFFF), // 60%
      600: Color(0xFFFFFFFF), // 70%
      700: Color(0xFFFFFFFF), // 80%
      800: Color(0xFFFFFFFF), // 90%
      900: Color(0xFFFFFFFF), // 100%
    },
  );
  static const double kDefaultPadding = 20;

}