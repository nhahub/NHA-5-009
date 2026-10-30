import 'package:echosign/core/theme/app_color.dart';
import 'package:echosign/features/home/widgets/custom_boxs.dart';
import 'package:echosign/features/home/widgets/translator_page_card.dart';
import 'package:echosign/features/home/widgets/steps_card.dart';
import 'package:echosign/features/settings/setting_screen.dart';
import 'package:echosign/features/sign_to_text/sign_to_text_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return SettingScreen();
                  },
                ),
              );
            },
            icon: Icon(Icons.settings),
            iconSize: 25,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(24, 25, 24, 110),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              SizedBox(height: 35),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: "Welcome to ",
                        style: TextStyle(
                          color: isDark
                              ? AppColors.darkTextPrimary
                              : AppColors.lightTextPrimary,
                        ),
                      ),

                      WidgetSpan(
                        child: ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [
                              AppColors.tealPrimary,
                              AppColors.goldPrimary,
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ).createShader(bounds),
                          child: const Text(
                            "EchoSign",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10),

              Center(
                child: Text(
                  'Communication without limits.',
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    color: isDark ? AppColors.tealDark : AppColors.tealPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              SizedBox(height: 70),

              Center(
                child: Text(
                  'Translate between Arabic Sign Language and text easily using AI.',
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    color: isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.lightTextSecondary,
                    fontSize: 18,
                    height: 1.5,
                  ),
                ),
              ),

              SizedBox(height: 45),

              // =========================================================
              // GESTURE -> TEXT
              // =========================================================
              Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 15,
                    ),

                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.darkCardBackground
                          : AppColors.lightSurface,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: AppColors.cyan.withOpacity(0.25),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.cyan.withOpacity(0.15),
                          blurRadius: 35,
                          spreadRadius: 8,
                        ),
                      ],
                    ),

                    child: Row(
                      mainAxisSize: MainAxisSize.min,

                      children: [
                        CustomBoxs(
                          icon: Icons.front_hand,
                          title: 'GESTURE',
                          subtitle: 'أهلاً وسهلاً',
                          color: AppColors.cyan,
                        ),

                        SizedBox(width: 18),

                        Icon(Icons.east, color: AppColors.cyan, size: 28),

                        SizedBox(width: 18),

                        CustomBoxs(
                          icon: Icons.chat_bubble_outline,
                          title: 'ARABIC TEXT',
                          subtitle: 'Welcome',
                          color: AppColors.goldDark,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 75),

              // =========================================================
              // Translator Page Card
              // =========================================================
              TranslatorPageCard(
                imagePath: isDark
                    ? 'assets/images/SigntoText_dark.jpg'
                    : 'assets/images/SigntoText_light.png',
                tag: 'Live Camera Detection',
                title: 'Sign → Text',
                description:
                    'Use your camera to translate Arabic Sign Language into text.',
                buttonText: 'Start Translating',
                iconColor: AppColors.cyan,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SignToTextScreen()),
                  );
                },
              ),

              SizedBox(height: 55),

              // =========================================================
              // HOW ECHOSIGN WORKS
              // =========================================================
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'How ',
                        style: TextStyle(
                          color: isDark
                              ? AppColors.darkTextPrimary
                              : AppColors.lightTextPrimary,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      TextSpan(
                        text: 'EchoSign',
                        style: TextStyle(
                          color: isDark ? AppColors.cyan : AppColors.tealDark,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      TextSpan(
                        text: ' Works',
                        style: TextStyle(
                          color: isDark
                              ? AppColors.darkTextPrimary
                              : AppColors.lightTextPrimary,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30),

              // =========================================================
              // STEPS
              // =========================================================
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StepsCard(
                    number: '01',
                    icon: Icons.front_hand_rounded,
                    title: 'Show the Sign',
                    description:
                        'Position yourself naturally in front of your camera and perform standard Arabic Sign Language gestures.',
                  ),

                  SizedBox(height: 16),

                  StepsCard(
                    number: '02',
                    icon: Icons.center_focus_strong_outlined,
                    title: 'AI Recognizes It',
                    description:
                        'Intelligent neural vision instantly tracks hand joints, finger positions, and facial spatial landmarks in real-time.',
                  ),

                  SizedBox(height: 16),

                  StepsCard(
                    number: '03',
                    icon: Icons.mark_chat_read_outlined,
                    title: 'Get the Translation',
                    description:
                        'Clear, grammatically synthesized Arabic text and audio translation stream immediately for seamless conversation.',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
