import 'package:flutter/material.dart';

class AppColors {
  // =========================
  // DARK THEME
  // =========================

  static const Color darkBackground = Color(0xFF0A0E17);
  static const Color darkCardBackground = Color(0xFF0F172A);
  static const Color darkSurface = Color(0xFF131A28);
  static const Color darkSurfaceElevated = Color(0xFF1A2233);
  static const Color darkBorder = Color(0xFF232C40);

  // Text
  static const Color darkTextPrimary = Color(0xFFF3F6FA);
  static const Color darkTextSecondary = Color(0xFF9AA6BC);
  static const Color darkTextMuted = Color(0xFF6B7690);

  // Brand
  static const Color tealPrimary = Color(0xFF2DD4BF);
  static const Color tealDark = Color(0xFF14B8A6);
  static const Color cyan = Color(0xFF1DC8C0);
  static const Color goldPrimary = Color(0xFFF5B93D);
  static const Color goldDark = Color(0xFFE59A1F);

  // Status
  static const Color success = Color(0xFF2DD4BF);
  static const Color warning = Color(0xFFF5B93D);
  static const Color danger = Color(0xFFEF5A5A);

// Lab Colors
  static const Color darkLabPrimary = Color(0xFF3C4653);
  static const Color darkLabSecondary = Color(0xFF1B2431);
  static const Color darkLabDarkest = Color(0xFF101827);

  // =========================
  // LIGHT THEME
  // =========================

  static const Color lightBackground = Color.fromARGB(255, 214, 241, 245);
  static const Color lightCardBackground = Color(0xFFF7FCFD);
  static const Color lightSurface = Color(0xFFD0E8EC);
  static const Color lightSurfaceElevated = Color(0xFFB8DCE2);
  static const Color lightBorder = Color(0xFFEBF7F8);

  static const Color lightTextPrimary = Color(0xFF0F172A);
  static const Color lightTextSecondary = Color(0xFF64748B);
  static const Color lightTextMuted = Color(0xFF94A3B8);

  //Lab Colors
  static const Color lightLabPrimary = Color(0xFF8B98A9);
  static const Color lightLabSecondary = Color(0xFFCAD4E2);
  static const Color lightLabLightest = Color(0xFFE2E8F0);

  // =========================
  // EXTRA
  // =========================

  static const Color starYellow = Color(0xFFFAC815);

  static const List<Color> goldGradient = [
    Color(0xFFF6C453),
    Color(0xFFE9962A),
  ];

  static const List<Color> tealGradient = [
    Color(0xFF3FE0C7),
    Color(0xFF19B79E),
  ];

  static const List<Color> confidenceGradient = [tealPrimary, goldPrimary];
}
