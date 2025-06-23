abstract interface class AbstractSettingsRepository {
  bool isDarkThemeSelected();
  Future<void> setDarkThemeSelected(bool selected);

  bool isOnboardingShown();
  Future<void> setOnboardingShown();

  bool isUserParametersScreenShown();
  Future<void> setUserParametersScreenShown();
}
