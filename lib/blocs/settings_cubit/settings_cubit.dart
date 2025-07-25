// settings_cubit.dart
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../repositories/settings_repository/settings.dart'; // Переконайтеся, що шлях правильний

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({required AbstractSettingsRepository settingsRepository})
      : _settingsRepository = settingsRepository,
        super(const SettingsState()) {
    _initialize();
  }

  final AbstractSettingsRepository _settingsRepository;

  Future<void> _initialize() async {
    try {
      final isShowOnboarding = _settingsRepository.isOnboardingShown();
      final isUserParametersScreenShown =
          _settingsRepository.isUserParametersScreenShown();
      final brightness = _settingsRepository.isDarkThemeSelected()
          ? Brightness.dark
          : Brightness.light;
      final savedLocale = await _settingsRepository.getLocale();

      emit(state.copyWith(
        isOnboardingShowing: isShowOnboarding,
        isUserParametersScreenShown: isUserParametersScreenShown,
        brightness: brightness,
        locale: savedLocale,
      ));
    } catch (e) {
      log('Initialization error: $e');
    }
  }

  Future<void> setOnboardingShown() async {
    try {
      await _settingsRepository.setOnboardingShown();
      emit(state.copyWith(isOnboardingShowing: true));
    } catch (e) {
      log('setOnboardingShown error: $e');
    }
  }

  Future<void> setUserParametersScreen() async {
    try {
      await _settingsRepository.setUserParametersScreenShown(shown: true);
      emit(state.copyWith(isUserParametersScreenShown: true));
    } catch (e) {
      log('setUserParametersScreen error: $e');
    }
  }

  Future<void> changeLocale(Locale locale) async {
    try {
      await _settingsRepository.setLocale(locale);
      emit(state.copyWith(locale: locale));
    } catch (e) {
      log('changeLocale error: $e');
    }
  }

  Future<void> resetSettings() async {
    debugPrint(
        'SettingsCubit: Resetting settings to initial state after logout.');
    try {
      await _settingsRepository.setUserParametersScreenShown(shown: false);

      emit(state.copyWith(isUserParametersScreenShown: false));
    } catch (e) {
      log('resetSettings error: $e');
    }
  }

  Future<void> setThemeBrightness(Brightness brightness) async {
    try {
      emit(state.copyWith(brightness: brightness));
      await _settingsRepository
          .setDarkThemeSelected(brightness == Brightness.dark);
    } catch (e) {
      log('setThemeBrightness error: $e');
    }
  }
}
