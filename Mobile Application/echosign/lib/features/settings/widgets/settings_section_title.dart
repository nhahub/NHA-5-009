import 'package:echosign/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class SettingsSectionTitle extends StatelessWidget {
  final String title;

  const SettingsSectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(
        left: 6,
        bottom: 14,
      ),
      child: Text(
        title.toUpperCase(),
        style:  TextStyle(
          color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
          fontSize: 14,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.6,
        ),
      ),
    );
  }
}