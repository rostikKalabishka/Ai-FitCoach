// abstract_settings_repository.dart
import 'package:flutter/material.dart'; // Для Locale

abstract class AbstractSettingsRepository {
  bool isDarkThemeSelected();
  Future<void> setDarkThemeSelected(bool selected);

  bool isOnboardingShown();
  Future<void> setOnboardingShown();

  bool isUserParametersScreenShown();
  Future<void> setUserParametersScreenShown({required bool shown});

  Locale getLocale();
  Future<void> setLocale(Locale locale);
}
