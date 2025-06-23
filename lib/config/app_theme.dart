// config/app_theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  // GitHub-like color palette
  static const Color _githubBlack = Color(0xFF0D1117);
  static const Color _githubDarkGray = Color(0xFF161B22);
  static const Color _githubGray = Color(0xFF21262D);
  static const Color _githubLightGray = Color(0xFF30363D);
  static const Color _githubBorder = Color(0xFF373E47);
  static const Color _githubText = Color(0xFFE6EDF3);
  static const Color _githubTextSecondary = Color(0xFF8D96A0);
  static const Color _githubBlue = Color(0xFF1F6FEB);
  static const Color _githubGreen = Color(0xFF238636);
  static const Color _githubYellow = Color(0xFFD29922);
  static const Color _githubRed = Color(0xFFDA3633);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: _githubBlue,
        secondary: _githubGreen,
        surface: Colors.white,
        background: Color(0xFFF6F8FA),
        error: _githubRed,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Color(0xFF24292F),
        onBackground: Color(0xFF24292F),
      ),

      // AppBar Theme
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        foregroundColor: Color(0xFF24292F),
        surfaceTintColor: Colors.transparent,
        titleTextStyle: TextStyle(
          color: Color(0xFF24292F),
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(color: Color(0xFF656D76)),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Color(0xFFD1D9E0), width: 1),
        ),
        color: Colors.white,
        surfaceTintColor: Colors.transparent,
      ),

      // Button Themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _githubGreen,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),

      // Text Theme
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: Color(0xFF24292F),
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(
          color: Color(0xFF24292F),
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(color: Color(0xFF24292F)),
        bodyMedium: TextStyle(color: Color(0xFF656D76)),
        bodySmall: TextStyle(color: Color(0xFF656D76)),
      ),

      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: const Color(0xFFDDF4FF),
        labelStyle: const TextStyle(color: _githubBlue, fontSize: 12),
        side: const BorderSide(color: Color(0xFFB6E3FF)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      // Icon Theme
      iconTheme: const IconThemeData(color: Color(0xFF656D76)),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: _githubBlue,
        secondary: _githubGreen,
        surface: _githubGray,
        background: _githubBlack,
        error: _githubRed,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: _githubText,
        onBackground: _githubText,
      ),

      // AppBar Theme
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: false,
        backgroundColor: _githubDarkGray,
        foregroundColor: _githubText,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: TextStyle(
          color: _githubText,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(color: _githubTextSecondary),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: _githubBorder, width: 1),
        ),
        color: _githubGray,
        surfaceTintColor: Colors.transparent,
      ),

      // Button Themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _githubGreen,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),

      // Text Theme
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: _githubText,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(
          color: _githubText,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(color: _githubText),
        bodyMedium: TextStyle(color: _githubTextSecondary),
        bodySmall: TextStyle(color: _githubTextSecondary),
      ),

      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: const Color(0xFF1C2128),
        labelStyle: const TextStyle(color: _githubBlue, fontSize: 12),
        side: const BorderSide(color: _githubBorder),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      // Icon Theme
      iconTheme: const IconThemeData(color: _githubTextSecondary),
    );
  }

  // Custom colors for specific use cases
  static const Color starColor = _githubYellow;
  static const Color languageColor = _githubBlue;
  static const Color successColor = _githubGreen;
  static const Color errorColor = _githubRed;
}
