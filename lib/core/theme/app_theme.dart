import 'package:flutter/material.dart';

class AppTheme {
  // Light ColorScheme
  static ColorScheme lightColorScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: Color.fromARGB(255, 128, 203, 196), // Soft Teal
    secondary: Color.fromARGB(255, 244, 236, 224), // Light Beige
    surface: Color.fromARGB(255, 255, 255, 240), // Light Cream
    error: Color.fromARGB(255, 255, 184, 186), // Soft Coral
    onPrimary: Colors.white, // Text color on primary
    onSecondary: Colors.black, // Text color on secondary
    onSurface: Colors.black,
    onError: Colors.white,
    shadow: Color.fromARGB(29, 0, 0, 0),
  );

  // Dark ColorScheme
  static ColorScheme darkColorScheme = const ColorScheme(
    brightness: Brightness.dark,
    primary: Color.fromARGB(255, 128, 203, 196), // Soft Teal
    secondary: Color.fromARGB(255, 60, 60, 60), // Dark Gray
    surface: Color.fromARGB(255, 30, 30, 30), // Dark surface color
    error: Color.fromARGB(255, 255, 184, 186), // Soft Coral
    onPrimary: Colors.white, // Text color on primary
    onSecondary: Color.fromARGB(255, 200, 200, 200), // Text color on secondary
    onSurface: Colors.white, // White text on dark surface
    onError: Colors.white,
    shadow: Color.fromARGB(255, 0, 0, 0),
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  // Light Theme Data
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: lightColorScheme,
      scaffoldBackgroundColor: lightColorScheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: lightColorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: lightColorScheme.primary,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: Colors.black),
        bodyLarge: TextStyle(color: Colors.black),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: buttonText,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return lightColorScheme.primary; // Teal when selected
          }
          return const Color.fromARGB(
              255, 244, 236, 224); // Default unchecked color
        }),
        checkColor:
            WidgetStateProperty.all(Colors.white), // White checkmark color
      ),
    );
  }

  // Dark Theme Data
  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: darkColorScheme,
      scaffoldBackgroundColor: darkColorScheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: darkColorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: darkColorScheme.primary,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: Colors.white),
        bodyLarge: TextStyle(color: Colors.white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: darkColorScheme.primary,
          textStyle: buttonText,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return darkColorScheme.primary; // Teal when selected
          }
          return Colors.grey; // Default unchecked color
        }),
        checkColor:
            WidgetStateProperty.all(Colors.white), // White checkmark color
      ),
    );
  }
}
