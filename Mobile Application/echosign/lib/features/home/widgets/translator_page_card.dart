import 'package:echosign/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class TranslatorPageCard extends StatelessWidget {
  const TranslatorPageCard({
    super.key,
    required this.tag,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.iconColor,
    required this.onPressed,
    required this.imagePath,
  });
  final String tag, title, description, buttonText, imagePath;
  final Color iconColor;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,

        borderRadius: BorderRadius.circular(22),

        border: Border.all(color: iconColor.withOpacity(0.25)),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          // Visual area
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 170,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                debugPrint('Image error: $error');
                return SizedBox(
                  height: 170,
                  child: Center(
                    child: Icon(
                      Icons.broken_image,
                      color: Colors.grey,
                      size: 48,
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 25),

          // Tag
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.10),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: iconColor.withOpacity(0.35)),
            ),

            child: Text(
              tag,
              style: TextStyle(
                color: iconColor,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          SizedBox(height: 12),

          Text(
            title,
            style: TextStyle(
              color: isDark
                  ? AppColors.darkTextPrimary
                  : AppColors.lightTextPrimary,
              fontSize: 27,
              fontWeight: FontWeight.bold,
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
              height: 1.5,
            ),
          ),

          SizedBox(height: 25),

          SizedBox(
            width: double.infinity,
            height: 52,

            child: ElevatedButton(
              onPressed: onPressed,

              style: ElevatedButton.styleFrom(
                backgroundColor: iconColor,
                foregroundColor: isDark
                    ? AppColors.darkBackground
                    : AppColors.lightBackground,

                elevation: 8,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text(
                    buttonText,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(width: 8),

                  Icon(Icons.arrow_forward, size: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
