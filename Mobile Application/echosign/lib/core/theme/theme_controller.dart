import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; 

class ThemeController {
  static final ValueNotifier<ThemeMode> themeMode =
      ValueNotifier(ThemeMode.dark); 

  static const String _prefsKey = 'theme_mode'; 

  static Future<void> changeTheme(ThemeMode mode) async { 
    themeMode.value = mode; 

    final prefs = await SharedPreferences.getInstance(); 
    await prefs.setString(_prefsKey, mode == ThemeMode.dark ? 'dark' : 'light'); 
  }

  static Future<void> loadSavedTheme() async { 
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_prefsKey);

    if (saved == 'light') {
      themeMode.value = ThemeMode.light;
    } else if (saved == 'dark') {
      themeMode.value = ThemeMode.dark;
    }
    
  }
}