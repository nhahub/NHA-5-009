import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:echosign/features/settings/widgets/social_button.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  Future<void> openUrl(String url) async {
  final Uri uri = Uri.parse(url);

  if (await canLaunchUrl(uri)) {
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  } else {
    debugPrint('Could not launch $url');
  }
}

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double buttonSize = (constraints.maxWidth * 0.16).clamp(
          56.0,
          72.0,
        );

        final double iconSize = buttonSize * 0.50;
        final double spacing = constraints.maxWidth * 0.06;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // GitHub
            SocialButton(
              assetPath: 'assets/images/github.svg',
              size: buttonSize,
              iconSize: iconSize,
              onTap: () {
                openUrl('https://github.com/salmakandill');
              },
            ),

            SizedBox(width: spacing),

            // LinkedIn
            SocialButton(
              assetPath: 'assets/images/linkedin.svg',
              size: buttonSize,
              iconSize: iconSize,
              onTap: () {
                openUrl('https://www.linkedin.com/in/salmakandill/');
              },
            ),

            SizedBox(width: spacing),

            // X
            SocialButton(
              assetPath: 'assets/images/x.svg',
              size: buttonSize,
              iconSize: iconSize,
              onTap: () {
                openUrl('https://x.com/salomah_1');
              },
            ),
          ],
        );
      },
    );
  }
}
