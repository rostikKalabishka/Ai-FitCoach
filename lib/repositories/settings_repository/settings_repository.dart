// settings_repository.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'abstract_settings_repository.dart';

class SettingsRepository implements AbstractSettingsRepository {
  final SharedPreferences sharedPreferences;
  static const _isDarkThemeSelectedKey = 'dark_theme_selected';
  static const _isOnboardingShownKey = 'onboarding_show';
  static const _isUserParametersScreenShownKey = 'user_parameters_screen_show';
  static const _languagePrefsKey = 'languagePrefs';

  const SettingsRepository({required this.sharedPreferences});

  @override
  bool isDarkThemeSelected() {
    try {
      return sharedPreferences.getBool(_isDarkThemeSelectedKey) ?? false;
    } catch (e) {
      rethrow;
    }
  }

  @override
  // FIX: Додано параметр 'shown'
  Future<void> setOnboardingShown() async {
    try {
      await sharedPreferences.setBool(_isOnboardingShownKey, true);
    } catch (e) {
      rethrow;
    }
  }

  @override
  bool isOnboardingShown() {
    try {
      return sharedPreferences.getBool(_isOnboardingShownKey) ?? false;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> setDarkThemeSelected(bool selected) async {
    try {
      await sharedPreferences.setBool(_isDarkThemeSelectedKey, selected);
    } catch (e) {
      rethrow;
    }
  }

  @override
  bool isUserParametersScreenShown() {
    try {
      return sharedPreferences.getBool(_isUserParametersScreenShownKey) ??
          false;
    } catch (e) {
      rethrow;
    }
  }

  @override
  // FIX: Додано параметр 'shown'
  Future<void> setUserParametersScreenShown({required bool shown}) async {
    try {
      await sharedPreferences.setBool(_isUserParametersScreenShownKey, shown);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Locale getLocale() {
    final savedLanguageCode = sharedPreferences.getString(_languagePrefsKey);
    if (savedLanguageCode != null && savedLanguageCode.isNotEmpty) {
      return Locale(savedLanguageCode);
    }

    final deviceLocale = PlatformDispatcher.instance.locale;
    return deviceLocale;
  }

  @override
  Future<void> setLocale(Locale locale) async {
    await sharedPreferences.setString(_languagePrefsKey, locale.languageCode);
  }
}
