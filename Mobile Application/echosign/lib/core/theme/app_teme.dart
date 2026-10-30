import 'package:echosign/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // =========================
  // LIGHT THEME
  // =========================

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,

    colorScheme: const ColorScheme.light(
      primary: AppColors.tealPrimary,
      secondary: AppColors.goldPrimary,
      surface: AppColors.lightSurface,
      error: AppColors.danger,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightBackground,
      foregroundColor: AppColors.lightTextPrimary,
      elevation: 0,
      centerTitle: false,
    ),

    cardColor: AppColors.lightSurface,

    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.lightTextPrimary,
      ),
      bodyMedium: TextStyle(
        color: AppColors.lightTextSecondary,
      ),
      titleLarge: TextStyle(
        color: AppColors.lightTextPrimary,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  // =========================
  // DARK THEME
  // =========================

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,

    colorScheme: const ColorScheme.dark(
      primary: AppColors.tealPrimary,
      secondary: AppColors.goldPrimary,
      surface: AppColors.darkSurface,
      error: AppColors.danger,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      foregroundColor: AppColors.darkTextPrimary,
      elevation: 0,
      centerTitle: false,
    ),

    cardColor: AppColors.darkSurface,

    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.darkTextPrimary,
      ),
      bodyMedium: TextStyle(
        color: AppColors.darkTextSecondary,
      ),
      titleLarge: TextStyle(
        color: AppColors.darkTextPrimary,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}