import 'package:flutter/material.dart';
import 'package:echosign/core/theme/app_color.dart';

class TranslationResultCard extends StatelessWidget {
  final String englishText;
  final String arabicText;
  final double confidence;

  const TranslationResultCard({
    super.key,
    this.englishText = '',
    this.arabicText = '',
    this.confidence = 0,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor =
        isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final isEmpty = englishText.isEmpty;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurfaceElevated,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.goldPrimary.withOpacity(.12)
                      : AppColors.lightSurface,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  Icons.chat_rounded,
                  color: isDark ? AppColors.goldPrimary : AppColors.darkBorder,
                  size: 27,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  'TRANSLATION',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: .5,
                  ),
                ),
              ),
              if (!isEmpty && confidence > 0)
                Text(
                  '${(confidence * 100).toStringAsFixed(1)}%',
                  style: TextStyle(
                    color: isDark ? AppColors.goldPrimary : AppColors.goldDark,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 28),
          Text(
            isEmpty ? 'Waiting for gestures...' : '"$englishText"',
            style: TextStyle(
              color: textColor.withOpacity(isEmpty ? .5 : 1),
              fontSize: 23,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (arabicText.isNotEmpty) ...[
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                arabicText,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: isDark ? AppColors.goldPrimary : AppColors.goldDark,
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}