import 'package:echosign/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class SettingsAboutTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  const SettingsAboutTile({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 18),
        child: Row(
          children: [
            Container(
              width: 62,
              height: 62,
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.darkBorder
                    : AppColors.lightSurfaceElevated,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(
                icon,
                color: isDark
                    ? AppColors.goldPrimary
                    : AppColors.lightTextPrimary,
                size: 29,
              ),
            ),

            SizedBox(width: 20),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  if (subtitle != null) ...[
                    SizedBox(height: 4),
                    Text(
                      subtitle!,
                      style: TextStyle(
                        color: isDark
                            ? AppColors.darkTextPrimary
                            : AppColors.lightTextSecondary,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ],
              ),
            ),

            if (trailing != null)
              trailing!
            else
              Icon(
                Icons.chevron_right_rounded,
                color: isDark
                    ? AppColors.darkTextPrimary
                    : AppColors.lightTextSecondary,
                size: 28,
              ),
          ],
        ),
      ),
    );
  }
}
