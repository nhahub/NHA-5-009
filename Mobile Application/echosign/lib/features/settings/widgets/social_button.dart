import 'package:echosign/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButton extends StatelessWidget {
  final String assetPath;
  final double size;
  final double iconSize;
  final VoidCallback onTap;

  const SocialButton({
    super.key,
    required this.assetPath,
    required this.size,
    required this.iconSize,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(100),

        child: Container(
          width: size,
          height: size,

          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isDark
                ? AppColors.darkBorder
                : AppColors.lightSurfaceElevated,
            border: Border.all(
              color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
            ),
          ),

          alignment: Alignment.center,

          child: SvgPicture.asset(
            assetPath,
            width: iconSize,
            height: iconSize,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
