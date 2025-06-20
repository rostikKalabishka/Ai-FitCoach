import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../repositories/settings_repository/settings.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({required AbstractSettingsRepository settingsRepository})
      : _settingsRepository = settingsRepository,
        super(SettingsState(
            brightness: Brightness.dark,
            isOnboardingShowing: false,
            isUserParametersScreenShown: false)) {
    _checkSelectedTheme();
    _checkShowOnboarding();
    _checkUserParametersScreen();
  }

  final AbstractSettingsRepository _settingsRepository;

  void _checkShowOnboarding() {
    try {
      final isShowOnboarding = _settingsRepository.isOnboardingShown();
      emit(SettingsState(isOnboardingShowing: isShowOnboarding));
    } catch (e) {
      log(e.toString());
    }
  }

  void _checkUserParametersScreen() {
    try {
      final isUserParametersScreenShown =
          _settingsRepository.isUserParametersScreenShown();
      emit(SettingsState(
          isUserParametersScreenShown: isUserParametersScreenShown));
    } catch (e) {
      log(e.toString());
    }
  }

  void _checkSelectedTheme() {
    try {
      final brightness = _settingsRepository.isDarkThemeSelected()
          ? Brightness.dark
          : Brightness.light;

      emit(SettingsState(brightness: brightness));
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> setOnboardingShown() async {
    try {
      await _settingsRepository.setOnboardingShown();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> setUserParametersScreen() async {
    try {
      await _settingsRepository.setUserParametersScreenShown();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> setThemeBrightness(Brightness brightness) async {
    try {
      emit(SettingsState(brightness: brightness));
      await _settingsRepository
          .setDarkThemeSelected(brightness == Brightness.dark);
    } catch (e) {
      log(e.toString());
    }
  }
}
