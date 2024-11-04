import 'package:flutter/material.dart';

class AppTheme {
  // Light ColorScheme
  static ColorScheme lightColorScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF009688), // Teal
    secondary: Color(0xFFE0F7FA), // Light Cyan
    surface: Color(0xFFFFFFFF), // White
    error: Color(0xFFD32F2F), // Red
    onPrimary: Colors.white, // Text color on primary
    onSecondary: Colors.black, // Text color on secondary
    onSurface: Colors.black,
    onError: Colors.white,
    shadow: Color(0x29000000), // Shadow color
  );

  // Dark ColorScheme
  static ColorScheme darkColorScheme = const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF00796B), // Darker Teal
    secondary: Color(0xFF1DE9B6), // Bright Cyan
    surface: Color(0xFF212121), // Dark surface color
    error: Color(0xFFD32F2F), // Red
    onPrimary: Colors.white, // Text color on primary
    onSecondary: Colors.black, // Text color on secondary
    onSurface: Colors.white, // White text on dark surface
    onError: Colors.white,
    shadow: Color(0xFF000000), // Shadow color
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  // Light Theme Data
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: lightColorScheme,
      scaffoldBackgroundColor: lightColorScheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: lightColorScheme.primary,
        iconTheme: IconThemeData(color: lightColorScheme.primary),
        elevation: 4,
      ),
      iconTheme: IconThemeData(color: lightColorScheme.primary), // Icon color
      buttonTheme: ButtonThemeData(
        buttonColor: lightColorScheme.primary,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        bodyLarge: TextStyle(fontSize: 14, color: Colors.black),
        bodyMedium: TextStyle(fontSize: 12, color: Colors.black54),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: buttonText,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          return states.contains(WidgetState.selected)
              ? lightColorScheme.primary
              : Colors.grey.shade300;
        }),
        checkColor: WidgetStateProperty.all(Colors.white),
      ),
      dividerColor: Colors.grey.shade300,
      cardColor: Colors.white,
    );
  }

  // Dark Theme Data
  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: darkColorScheme,
      scaffoldBackgroundColor: darkColorScheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: darkColorScheme.primary,
        iconTheme: IconThemeData(color: darkColorScheme.primary),
        elevation: 4,
      ),
      iconTheme: IconThemeData(color: darkColorScheme.primary), // Icon color
      buttonTheme: ButtonThemeData(
        buttonColor: darkColorScheme.primary,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        bodyLarge: TextStyle(fontSize: 14, color: Colors.white),
        bodyMedium: TextStyle(fontSize: 12, color: Colors.white70),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: darkColorScheme.primary,
          textStyle: buttonText,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          return states.contains(WidgetState.selected)
              ? darkColorScheme.primary
              : Colors.grey.shade700;
        }),
        checkColor: WidgetStateProperty.all(Colors.white),
      ),
      dividerColor: Colors.grey.shade600,
      cardColor: const Color(0xFF424242),
    );
  }
}
