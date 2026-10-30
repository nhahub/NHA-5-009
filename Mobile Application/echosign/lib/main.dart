import 'package:echosign/core/theme/app_teme.dart';
import 'package:echosign/core/theme/theme_controller.dart';
import 'package:echosign/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() async {                                    
  WidgetsFlutterBinding.ensureInitialized();           
  await ThemeController.loadSavedTheme();           

  runApp(const EchoSign());                             
}

class EchoSign extends StatelessWidget {
  const EchoSign({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(           
      valueListenable: ThemeController.themeMode,
      builder: (context, mode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: mode,                              
          home: SplashScreen(),
        );
      },
    );
  }
}