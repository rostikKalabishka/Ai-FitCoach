import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../repositories/settings_repository/settings.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({required AbstractSettingsRepository settingsRepository})
      : _settingsRepository = settingsRepository,
        super(const SettingsState()) {
    _checkSelectedTheme();
    _checkShowOnboarding();
    _checkUserParametersScreen();
  }

  final AbstractSettingsRepository _settingsRepository;

  void _checkShowOnboarding() {
    try {
      final isShowOnboarding = _settingsRepository.isOnboardingShown();
      emit(state.copyWith(isOnboardingShowing: isShowOnboarding));
    } catch (e) {
      log(e.toString());
    }
  }

  void _checkUserParametersScreen() {
    try {
      final isUserParametersScreenShown =
          _settingsRepository.isUserParametersScreenShown();
      emit(state.copyWith(
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

      emit(state.copyWith(brightness: brightness));
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> setOnboardingShown() async {
    try {
      await _settingsRepository.setOnboardingShown();
      emit(state.copyWith(isOnboardingShowing: true));
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> setUserParametersScreen() async {
    try {
      await _settingsRepository.setUserParametersScreenShown();
      emit(state.copyWith(isUserParametersScreenShown: true));
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> setThemeBrightness(Brightness brightness) async {
    try {
      emit(state.copyWith(brightness: brightness));
      await _settingsRepository
          .setDarkThemeSelected(brightness == Brightness.dark);
    } catch (e) {
      log(e.toString());
    }
  }
}
