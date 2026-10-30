import 'package:echosign/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const CircleButton({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 54,
        height: 54,
        decoration: BoxDecoration(
          color: isDark
              ? AppColors.darkBorder
              : AppColors.lightSurfaceElevated.withOpacity(.9),
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.darkBorder),
        ),
        child: Icon(
          icon,
          color: isDark
              ? AppColors.darkTextPrimary
              : AppColors.lightTextPrimary,
          size: 26,
        ),
      ),
    );
  }
}
