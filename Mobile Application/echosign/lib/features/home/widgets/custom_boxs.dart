import 'package:echosign/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class CustomBoxs extends StatelessWidget {
  const CustomBoxs({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });
  final IconData icon;
  final String title, subtitle;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,

          decoration: BoxDecoration(
            color: color.withOpacity(0.10),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.withOpacity(0.35)),
          ),

          child: Icon(icon, color: color, size: 27),
        ),

        SizedBox(width: 9),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              title,
              style: TextStyle(
                color: isDark
                    ? AppColors.darkTextPrimary
                    : AppColors.lightTextPrimary,
                fontSize: 11,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),

            SizedBox(height: 2),

            Text(
              subtitle,
              style: TextStyle(
                color: isDark
                    ? AppColors.darkTextSecondary
                    : AppColors.lightTextSecondary,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
