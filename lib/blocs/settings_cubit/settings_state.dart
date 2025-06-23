part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  const SettingsState(
      {this.brightness = Brightness.dark,
      this.isOnboardingShowing = true,
      this.isUserParametersScreenShown = false});
  final Brightness brightness;
  final bool isOnboardingShowing;
  final bool isUserParametersScreenShown;

  bool get isDark => brightness == Brightness.dark;
  @override
  List<Object> get props =>
      [brightness, isOnboardingShowing, isUserParametersScreenShown];

  SettingsState copyWith(
      {Brightness? brightness,
      bool? isOnboardingShowing,
      bool? isUserParametersScreenShown}) {
    return SettingsState(
      brightness: brightness ?? this.brightness,
      isOnboardingShowing: isOnboardingShowing ?? this.isOnboardingShowing,
      isUserParametersScreenShown:
          isUserParametersScreenShown ?? this.isUserParametersScreenShown,
    );
  }
}
