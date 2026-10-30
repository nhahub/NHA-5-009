import 'package:echosign/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class TranslatingButton extends StatelessWidget {
  final bool isTranslating;
  final VoidCallback? onTap;

  const TranslatingButton({super.key, this.isTranslating = true, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 74,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: AppColors.goldGradient),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isTranslating
                  ? Icons.pause_circle_outline
                  : Icons.play_circle_outline,
              color: AppColors.darkBackground,
              size: 28,
            ),
            SizedBox(width: 14),
            Text(
              isTranslating ? 'Translating Gestures...' : 'Start Translation',
              style:  TextStyle(
                color: AppColors.darkBackground,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
