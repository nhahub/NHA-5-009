import 'package:echosign/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navigation_bar_kit/bottom_navigation_bar_kit.dart';

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final backgroundColor = isDark ? AppColors.darkBackground : AppColors.lightBackground;
    final textMuted = isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted;
    final textPrimary = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;

    return NeonPulseBottomNav(
      items: [
        BottomNavItem(icon: Icon(Icons.home), activeIcon: Icon(Icons.home), label: 'Home'),
        BottomNavItem(icon: Icon(Icons.camera_alt_outlined), activeIcon: Icon(Icons.camera_alt_outlined), label: 'Sign to Text'),
        BottomNavItem(icon: Icon(Icons.translate), activeIcon: Icon(Icons.translate), label: 'Text to Sign'),
        BottomNavItem(icon: Icon(Icons.settings), activeIcon: Icon(Icons.settings), label: 'Settings'),
      ],
      currentIndex: currentIndex,
      onTap: onTap,
      neonColors: [AppColors.cyan],
      pulseSpeed: const Duration(milliseconds: 800),
      glowSpread: 12.0,
      backgroundColor: backgroundColor,

      theme: NavTheme(
        height: 72,
        backgroundColor: backgroundColor,
        activeColor: AppColors.cyan,
        inactiveColor: textMuted,
        iconSize: 25,
        labelStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textMuted),
        activeLabelStyle: TextStyle(
          color: textPrimary,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}