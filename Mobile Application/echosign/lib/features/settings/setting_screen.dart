import 'package:echosign/core/theme/app_color.dart';
import 'package:echosign/core/theme/theme_controller.dart';
import 'package:echosign/features/settings/widgets/settings_cards.dart';
import 'package:echosign/features/settings/widgets/divider.dart';
import 'package:echosign/features/settings/widgets/settings_about_tile.dart';
import 'package:echosign/features/settings/widgets/settings_section_title.dart';
import 'package:echosign/features/settings/widgets/settings_tile.dart';
import 'package:echosign/features/settings/widgets/social_buttons.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool notificationsEnabled = true;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.west),
        ),
        title: Row(
          children: [
            Image.asset('assets/images/logo.png', width: 60, height: 60),
            SizedBox(width: 10),
            Text(
              'EchoSign',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: isDark ? AppColors.cyan : AppColors.tealDark,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(28, 24, 28, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // =========================
              // LANGUAGE EXCHANGE
              // =========================
              SettingsSectionTitle(title: 'Language Exchange'),

              SettingsCard(
                child: SettingsTile(
                  icon: Icons.translate_rounded,
                  title: 'Language',
                  subtitle: 'ARSL Dialect',
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Arabic',
                        style: TextStyle(
                          color: AppColors.tealPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.chevron_right_rounded,
                        color: isDark
                            ? AppColors.darkTextSecondary
                            : AppColors.lightTextSecondary,
                        size: 27,
                      ),
                    ],
                  ),
                  onTap: () {
                    // Open language selection
                  },
                ),
              ),

              SizedBox(height: 28),

              // =========================
              // THEME & APPEARANCE
              // =========================
              SettingsSectionTitle(title: 'Theme & Appearance'),

              ValueListenableBuilder<ThemeMode>(
                valueListenable: ThemeController.themeMode,
                builder: (context, currentMode, child) {
                  final isDark = currentMode == ThemeMode.dark;

                  return SettingsCard(
                    child: SettingsTile(
                      icon: isDark
                          ? Icons.nightlight_round
                          : Icons.wb_sunny_rounded,
                      title: 'Theme',
                      subtitle: isDark ? 'Dark Mode' : 'Light Mode',
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              isDark
                                  ? Icons.nightlight_round
                                  : Icons.wb_sunny_rounded,
                              color: isDark
                                  ? AppColors.tealDark
                                  : AppColors.tealPrimary,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        ThemeController.changeTheme(
                          isDark ? ThemeMode.light : ThemeMode.dark,
                        );
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 28),

              // =========================
              // SHARE APP
              // =========================
              SettingsSectionTitle(title: 'Share App'),

              SettingsCard(
                child: SettingsTile(
                  icon: Icons.share_rounded,
                  title: 'Invite & Share',
                  subtitle: 'Share EchoSign with deaf & hearing peers',
                  onTap: () {
                    // Share app
                  },
                ),
              ),

              SizedBox(height: 28),

              // =========================
              // ABOUT
              // =========================
              SettingsSectionTitle(title: 'About'),

              SettingsCard(
                child: Column(
                  children: [
                    SettingsAboutTile(
                      icon: Icons.info_outline_rounded,
                      title: 'About EchoSign',
                      trailing: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 9,
                        ),
                        decoration: BoxDecoration(
                          color: isDark
                              ? AppColors.darkSurfaceElevated
                              : AppColors.lightSurfaceElevated,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: isDark
                                ? AppColors.darkBorder
                                : AppColors.lightBorder,
                          ),
                        ),
                        child: Text(
                          'v1.0.0',
                          style: TextStyle(
                            color: isDark
                                ? AppColors.darkTextSecondary
                                : AppColors.lightTextSecondary,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      onTap: () {
                        // About EchoSign
                      },
                    ),

                    CustomDivider(),

                    SettingsAboutTile(
                      icon: Icons.description_outlined,
                      title: 'Privacy Policy',
                      onTap: () {
                        // Open privacy policy
                      },
                    ),

                    CustomDivider(),

                    SettingsAboutTile(
                      icon: Icons.shield_outlined,
                      title: 'Terms of Service',
                      onTap: () {
                        // Open terms
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 48),

              // =========================
              // SOCIAL
              // =========================
              Center(
                child: Text(
                  'Follow us on',
                  style: TextStyle(
                    color: isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.lightTextSecondary,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              SizedBox(height: 20),

              SocialButtons(),

              SizedBox(height: 30),

              Center(
                child: Text(
                  '© 2026 EchoSign. All rights reserved.',
                  style: TextStyle(
                    color: isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.lightTextSecondary,
                    fontSize: 15,
                  ),
                ),
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
