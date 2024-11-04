import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manager_state.freezed.dart';

@freezed
class ManagerState with _$ManagerState {
  const factory ManagerState({
    required ThemeMode themeMode,
    required Locale languageCode,
  }) = _ManagerState;

  factory ManagerState.initial() => const ManagerState(
        themeMode: ThemeMode.light,
        languageCode: Locale('en', "US"), 
      );
}
