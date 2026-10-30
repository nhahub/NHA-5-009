import 'package:echosign/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class SettingIcons extends StatelessWidget {
  const SettingIcons({super.key, required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: 62,
      height: 62,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkBorder : AppColors.lightSurfaceElevated,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Icon(
        icon,
        color: isDark ? AppColors.goldPrimary : AppColors.lightTextPrimary,
        size: 29,
      ),
    );
  }
}
