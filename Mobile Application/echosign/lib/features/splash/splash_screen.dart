import 'dart:async';
import 'package:echosign/core/theme/app_color.dart';
import 'package:echosign/features/home/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: Duration(milliseconds: 500),
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Container(
              width: 270,
              height: 270,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.tealPrimary.withOpacity(0.25),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Container(
                margin: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDark
                      ? AppColors.darkBackground
                      : AppColors.lightBackground,
                  border: Border.all(
                    color: isDark
                        ? AppColors.darkBackground
                        : AppColors.lightBackground,
                    width: 8,
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 270,
                    height: 270,
                  ),
                ),
              ),
            ),

            SizedBox(height: 35),

            // App Name
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'EchoSign',
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w600,
                    color: isDark
                        ? AppColors.darkTextPrimary
                        : AppColors.lightTextPrimary,
                    letterSpacing: -2,
                  ),
                ),

                SizedBox(width: 5),

                // Yellow dot
                Container(
                  width: 15,
                  height: 13,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFCA45),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
