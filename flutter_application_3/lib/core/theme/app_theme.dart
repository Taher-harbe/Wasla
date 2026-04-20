import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryBlue = Color(0xFF00236F);
  static const Color secondaryGreen = Color(0xFF006C49);

  // ثيم الوضع الفاتح (Light Mode)
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryBlue,
        primary: primaryBlue,
        secondary: secondaryGreen,
        surface: const Color(0xFFFAF8FF),
      ),
      fontFamily: 'Inter',
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Manrope',
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Manrope',
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: const CardThemeData(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
      ),
    );
  }

  // ثيم الوضع الداكن (Dark Mode)
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryBlue,
        brightness: Brightness.dark,
        primary: const Color(0xFF90CAF9), // أزرق أفتح للتباين في الدارك
        surface: const Color(0xFF121212), // أسود مطفي مريح للعين
      ),
      fontFamily: 'Inter',
      cardTheme: const CardThemeData(
        color: Color(0xFF1E1E1E),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
      ),
    );
  }
}
