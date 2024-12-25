import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';

ThemeData get enTheme => ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    primarySwatch: AppColors.whiteMaterialColor,
    textTheme: TextTheme(
        headlineLarge: GoogleFonts.inter(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 36
        ),
        headlineMedium: GoogleFonts.inter(
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontSize: 32
        ),
        headlineSmall: GoogleFonts.inter(
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontSize: 26
        ),
        titleLarge: GoogleFonts.inter(
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontSize: 22
        ),
        titleMedium: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 18
        ),
        titleSmall: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            color: AppColors.kGreyTextColor,
            fontSize: 14
        ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: AppColors.kPrimaryColor,
      cursorColor: AppColors.kPrimaryColor,
      selectionHandleColor: AppColors.kPrimaryColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleTextStyle: GoogleFonts.inter(
          fontWeight: FontWeight.w700,
          color: Colors.black,
          fontSize: 22
      ),
    ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: AppColors.kPrimaryColor,
    unselectedItemColor: AppColors.kGreyColor,
    showUnselectedLabels: true,
    backgroundColor: Colors.white,
    elevation: 0
  )
);