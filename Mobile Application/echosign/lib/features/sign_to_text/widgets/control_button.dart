import 'package:echosign/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class ControlButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const ControlButton({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkBorder : AppColors.lightSurfaceElevated,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isDark
                  ? AppColors.darkTextSecondary
                  : AppColors.lightTextSecondary,
              size: 23,
            ),
            SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(
                color: isDark
                    ? AppColors.darkTextPrimary
                    : AppColors.lightTextPrimary,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
