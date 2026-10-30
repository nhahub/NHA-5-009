import 'package:echosign/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class SettingsCard extends StatelessWidget {
  final Widget child;

  const SettingsCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Theme.of(context).dividerColor, width: 1),
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }
}
