part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  const SettingsState(
      {this.brightness = Brightness.dark,
      this.isOnboardingShowing = false,
      this.isUserParametersScreenShown = false,
      this.locale = const Locale('en')});
  final Brightness brightness;
  final bool isOnboardingShowing;
  final bool isUserParametersScreenShown;
  final Locale locale;

  @override
  List<Object> get props =>
      [brightness, isOnboardingShowing, isUserParametersScreenShown, locale];
  bool get isDark => brightness == Brightness.dark;
  SettingsState copyWith(
      {Brightness? brightness,
      bool? isOnboardingShowing,
      Locale? locale,
      bool? isUserParametersScreenShown}) {
    return SettingsState(
        brightness: brightness ?? this.brightness,
        isOnboardingShowing: isOnboardingShowing ?? this.isOnboardingShowing,
        isUserParametersScreenShown:
            isUserParametersScreenShown ?? this.isUserParametersScreenShown,
        locale: locale ?? this.locale);
  }
}
