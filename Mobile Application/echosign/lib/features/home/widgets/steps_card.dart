import 'package:echosign/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class StepsCard extends StatelessWidget {
  const StepsCard({
    super.key,
    required this.number,
    required this.title,
    required this.description,
    required this.icon,
  });

  final String number, title, description;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.all(22),

      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,

        borderRadius: BorderRadius.circular(16),

        border: Border.all(color: AppColors.cyan.withOpacity(0.25)),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.darkSurfaceElevated
                      : AppColors.lightSurfaceElevated,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.cyan.withOpacity(0.25)),
                ),

                child: Icon(
                  icon,
                  color: isDark
                      ? AppColors.goldPrimary
                      : AppColors.lightTextPrimary,
                  size: 28,
                ),
              ),

              Text(
                number,
                style: TextStyle(
                  color: AppColors.lightTextSecondary,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          SizedBox(height: 20),

          Text(
            title,
            style: TextStyle(
              color: isDark
                  ? AppColors.darkTextPrimary
                  : AppColors.lightTextPrimary,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 8),

          Text(
            description,
            style: TextStyle(
              color: isDark
                  ? AppColors.darkTextSecondary
                  : AppColors.lightTextSecondary,
              fontSize: 15,
              height: 1.55,
            ),
          ),
        ],
      ),
    );
  }
}
