import 'package:shared_preferences/shared_preferences.dart';

import 'abstract_settings_repository.dart';

class SettingsRepository implements AbstractSettingsRepository {
  final SharedPreferences sharedPreferences;
  static const _isDarkThemeSelectedKey = 'dark_theme_selected';
  static const _isOnboardingShownKey = 'onboarding_show';
  static const _isUserParametersScreenShownKey = 'user_parameters_screen_show';
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
  bool isOnboardingShown() {
    try {
      return sharedPreferences.getBool(_isOnboardingShownKey) ?? false;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> setOnboardingShown() async {
    try {
      await sharedPreferences.setBool(_isOnboardingShownKey, true);
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
  Future<void> setUserParametersScreenShown() async {
    try {
      await sharedPreferences.setBool(_isUserParametersScreenShownKey, true);
    } catch (e) {
      rethrow;
    }
  }
}
