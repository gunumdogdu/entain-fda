import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/module_opacity.dart';

class AppTheme {
  // Colors
  static const _primaryLight = Color(0xFF2962FF);
  static const _primaryDark = Color(0xFF82B1FF);

  static const _backgroundLight = Color(0xFFFAFAFA);
  static const _backgroundDark = Color(0xFF121212);

  static const _surfaceLight = Color(0xFFFFFFFF);
  static const _surfaceDark = Color(0xFF1E1E1E);

  static const _textPrimaryLight = Color(0xFF1D1D1D);
  static const _textPrimaryDark = Color(0xFFF5F5F5);

  static const _textSecondaryLight = Color(0xFF757575);
  static const _textSecondaryDark = Color(0xFFB3B3B3);

  static TextTheme _buildTextTheme(Color textColor, Color secondaryColor) {
    return TextTheme(
      headlineLarge: GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        color: textColor,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        color: secondaryColor,
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: secondaryColor,
      ),
    );
  }

  static final light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: _primaryLight,
      onPrimary: Colors.white,
      secondary: _primaryLight.withOpacity(ModuleOpacity.o08),
      surface: _surfaceLight,
      onSurface: _textPrimaryLight,
    ),
    scaffoldBackgroundColor: _backgroundLight,
    cardTheme: CardTheme(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.withOpacity(0.1)),
      ),
      color: _surfaceLight,
    ),
    textTheme: _buildTextTheme(_textPrimaryLight, _textSecondaryLight),
    appBarTheme: AppBarTheme(
      backgroundColor: _surfaceLight,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: _textPrimaryLight,
      ),
    ),
  );

  static final dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: _primaryDark,
      onPrimary: Colors.black,
      secondary: _primaryDark.withOpacity(ModuleOpacity.o08),
      surface: _surfaceDark,
      onSurface: _textPrimaryDark,
    ),
    scaffoldBackgroundColor: _backgroundDark,
    cardTheme: CardTheme(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.white.withOpacity(0.1)),
      ),
      color: _surfaceDark,
    ),
    textTheme: _buildTextTheme(_textPrimaryDark, _textSecondaryDark),
    appBarTheme: AppBarTheme(
      backgroundColor: _surfaceDark,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: _textPrimaryDark,
      ),
    ),
  );
}
