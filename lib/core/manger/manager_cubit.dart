import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart'; // Import Hive

import 'manager_state.dart';

class ManagerCubit extends Cubit<ManagerState> {
  ManagerCubit() : super(ManagerState.initial()) {
    _loadSettings(); // Load settings on initialization
  }

  // Box to store settings (e.g., theme and language)
  final Box settingsBox = Hive.box('settings');

  void toggleTheme() {
    final newTheme =
        state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    // Save the new theme in Hive
    settingsBox.put('themeMode', newTheme.toString());

    emit(state.copyWith(themeMode: newTheme));
  }

  // Function to change the language and save it to Hive
  changeLanguage({required Locale locale, required BuildContext context}) {
    // Save the selected language in Hive
    settingsBox.put('languageCode', locale.languageCode);
    settingsBox.put('countryCode', locale.countryCode);
    settingsBox.put('scriptCode', locale.scriptCode);
    EasyLocalization.of(context)!.setLocale(locale);

    emit(state.copyWith(languageCode: locale));
    // Apply the selected locale
  }

  // Load the current locale and theme from Hive
  void _loadSettings() {
    // Load language settings
    final String? languageCode =
        settingsBox.get('languageCode', defaultValue: 'en');
    final String? countryCode = settingsBox.get('countryCode');
    final String? scriptCode = settingsBox.get('scriptCode');

    // Load theme settings
    final String? savedTheme =
        settingsBox.get('themeMode', defaultValue: ThemeMode.light.toString());
    ThemeMode themeMode = savedTheme == ThemeMode.dark.toString()
        ? ThemeMode.dark
        : ThemeMode.light;

    // Create the locale object using stored values
    Locale locale;
    if (scriptCode != null) {
      locale = Locale.fromSubtags(
        languageCode: languageCode!,
        countryCode: countryCode,
        scriptCode: scriptCode,
      );
    } else {
      locale = Locale(languageCode!, countryCode);
    }

    emit(state.copyWith(
      languageCode: locale,
      themeMode: themeMode, // Emit the loaded theme mode
    ));
  }

  // Function to get the current locale
  Locale getCurrentLocale() {
    final String? languageCode =
        settingsBox.get('languageCode', defaultValue: 'en');
    final String? countryCode = settingsBox.get('countryCode');
    final String? scriptCode = settingsBox.get('scriptCode');

    if (scriptCode != null) {
      return Locale.fromSubtags(
        languageCode: languageCode!,
        countryCode: countryCode,
        scriptCode: scriptCode,
      );
    } else {
      return Locale(languageCode!, countryCode);
    }
  }
}
