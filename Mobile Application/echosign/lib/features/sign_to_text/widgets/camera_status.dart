import 'package:echosign/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class CameraStatus extends StatelessWidget {
  final bool active;
  const CameraStatus({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 11),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkBorder
            : AppColors.lightSurfaceElevated.withOpacity(.92),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: active ? AppColors.goldPrimary : AppColors.danger,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 12),
          Text(
            active ? 'Camera Active' : 'Camera Inactive',
            style: TextStyle(
              color: isDark
                  ? AppColors.darkTextPrimary
                  : AppColors.lightTextPrimary,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
