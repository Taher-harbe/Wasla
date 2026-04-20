import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends ChangeNotifier {
  static const String _themeKey = 'theme_mode';
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  ThemeController() {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedTheme = prefs.getString(_themeKey);

      switch (savedTheme) {
        case 'light':
          _themeMode = ThemeMode.light;
          break;
        case 'dark':
          _themeMode = ThemeMode.dark;
          break;
        default:
          _themeMode = ThemeMode.system;
      }
      notifyListeners();
    } catch (e) {
      // في حالة فشل تحميل الإعدادات، استخدم الوضع الافتراضي
      _themeMode = ThemeMode.system;
      notifyListeners();
    }
  }

  Future<void> toggleTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      switch (_themeMode) {
        case ThemeMode.system:
        case ThemeMode.light:
          _themeMode = ThemeMode.dark;
          await prefs.setString(_themeKey, 'dark');
          break;
        case ThemeMode.dark:
          _themeMode = ThemeMode.light;
          await prefs.setString(_themeKey, 'light');
          break;
      }
      notifyListeners();
    } catch (e) {
      // في حالة فشل الحفظ، قم بالتبديل فقط بدون حفظ
      switch (_themeMode) {
        case ThemeMode.system:
        case ThemeMode.light:
          _themeMode = ThemeMode.dark;
          break;
        case ThemeMode.dark:
          _themeMode = ThemeMode.light;
          break;
      }
      notifyListeners();
    }
  }

  IconData get themeIcon {
    switch (_themeMode) {
      case ThemeMode.light:
        return Icons.wb_sunny;
      case ThemeMode.dark:
        return Icons.nightlight_round;
      case ThemeMode.system:
        return Icons.brightness_auto;
    }
  }
}
