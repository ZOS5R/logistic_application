import 'package:flutter/material.dart';

class AppTheme {
  // Light ColorScheme
  static ColorScheme lightColorScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: Color.fromARGB(255, 255, 217, 0), // Darker Yellow
    secondary: Color.fromARGB(255, 230, 230, 230),
    surface: Colors.white, // Light Gray
    error: Colors.red,
    onPrimary: Colors.black, // Text color on primary
    onSecondary: Colors.white, // Text color on secondary
    onSurface: Colors.black,
    onError: Colors.white,
    shadow: Color.fromARGB(29, 57, 57, 57),
  );

  // Dark ColorScheme
  static ColorScheme darkColorScheme = const ColorScheme(
    brightness: Brightness.dark,
    // primary: Color.fromARGB(255, 255, 217, 0), // Darker Yellow
    primary: Color.fromARGB(255, 255, 217, 0), // Darker Yellow
    secondary: Color.fromARGB(255, 45, 45, 45), // Dark Gray for secondary
    surface: Color.fromARGB(255, 23, 23, 23), // Dark surface color
    error: Colors.red,
    onPrimary: Colors.black, // Text color on primary
    onSecondary: Color.fromARGB(255, 65, 65, 65), // Text color on secondary
    onSurface: Colors.white, // White text on dark surface
    onError: Colors.white,
    shadow: Color.fromARGB(255, 57, 57, 57),
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
        iconTheme: const IconThemeData(
            color: Colors.black), // Dark icon for light theme
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
            return lightColorScheme.primary; // Yellow when selected
          }
          return const Color.fromARGB(
              255, 236, 236, 236); // Default unchecked color
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
            return darkColorScheme.primary; // Yellow when selected
          }
          return Colors.grey; // Default unchecked color
        }),
        checkColor:
            WidgetStateProperty.all(Colors.white), // White checkmark color
      ),
    );
  }
}
