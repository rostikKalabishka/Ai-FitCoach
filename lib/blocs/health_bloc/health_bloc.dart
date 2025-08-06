import 'package:ai_fit_coach/features/loader/bloc/authentication_bloc.dart';
import 'package:ai_fit_coach/repositories/analytics_repository/abstract_analytics_repository.dart';

import 'package:ai_fit_coach/repositories/health_repository/health.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../repositories/crashlytics_repository/crashlytics.dart';

part 'health_event.dart';
part 'health_state.dart';

class HealthBloc extends Bloc<HealthEvent, HealthState> {
  final AbstractHealthRepository _abstractHealthRepository;
  final AbstractCrashlyticsRepository _crashlyticsRepository;
  final AbstractAnalyticsRepository _analyticsRepository;

  HealthBloc({
    required AbstractHealthRepository abstractHealthRepository,
    AbstractCrashlyticsRepository? crashlyticsRepository,
    AbstractAnalyticsRepository? analyticsRepository,
  })  : _abstractHealthRepository = abstractHealthRepository,
        _crashlyticsRepository = crashlyticsRepository ??
            GetIt.instance<AbstractCrashlyticsRepository>(),
        _analyticsRepository = analyticsRepository ??
            GetIt.instance<AbstractAnalyticsRepository>(),
        super(HealthInitial()) {
    on<HealthLoadInfoEvent>(_loadHealthInfo);
    on<HealthUpdateInfoEvent>(_updateHealthInfo);
    on<FetchStepsForDate>(_fetchStepsForDate);
  }

  Future<void> _loadHealthInfo(
      HealthLoadInfoEvent event, Emitter<HealthState> emit) async {
    if (state is! HealthLoaded) {
      emit(HealthLoading());
    }
    try {
      _crashlyticsRepository.log('Loading health info');
      final steps = await _abstractHealthRepository.getSteps();
      emit(HealthLoaded(steps: steps, date: DateTime.now()));
      _analyticsRepository.logEvent(
        name: 'health_info_loaded',
        parameters: {
          'screen_name': 'health_screen',
          'steps': steps.toString(),
          'user_id': _getUserId(),
        },
      );
    } catch (e, stackTrace) {
      emit(HealthFailure(error: e));
      _crashlyticsRepository.recordError(e, stackTrace, fatal: false);
      _analyticsRepository.logEvent(
        name: 'health_info_load_error',
        parameters: {
          'screen_name': 'health_screen',
          'error_message': e.toString(),
          'user_id': _getUserId(),
        },
      );
    }
  }

  Future<void> _updateHealthInfo(
      HealthUpdateInfoEvent event, Emitter<HealthState> emit) async {
    if (state is! HealthLoaded) {
      emit(HealthLoading());
    }
    try {
      _crashlyticsRepository.log('Updating health info');
      final steps = await _abstractHealthRepository.getSteps();
      emit(HealthLoaded(steps: steps, date: DateTime.now()));
      _analyticsRepository.logEvent(
        name: 'health_info_updated',
        parameters: {
          'screen_name': 'health_screen',
          'steps': steps.toString(),
          'user_id': _getUserId(),
        },
      );
    } catch (e, stackTrace) {
      emit(HealthFailure(error: e));
      _crashlyticsRepository.recordError(e, stackTrace, fatal: false);
      _analyticsRepository.logEvent(
        name: 'health_info_update_error',
        parameters: {
          'screen_name': 'health_screen',
          'error_message': e.toString(),
          'user_id': _getUserId(),
        },
      );
    }
  }

  Future<void> _fetchStepsForDate(
      FetchStepsForDate event, Emitter<HealthState> emit) async {
    if (state is! HealthLoaded) {
      emit(HealthLoading());
    }
    try {
      _crashlyticsRepository.log('Fetching steps for date: ${event.date}');
      final steps = await _abstractHealthRepository.getStepsForDate(event.date);
      emit(HealthLoaded(steps: steps, date: event.date));
      _analyticsRepository.logEvent(
        name: 'steps_fetched',
        parameters: {
          'screen_name': 'health_screen',
          'date': event.date.toIso8601String(),
          'steps': steps.toString(),
          'user_id': _getUserId(),
        },
      );
    } catch (e, stackTrace) {
      emit(HealthFailure(error: e));
      _crashlyticsRepository.recordError(e, stackTrace, fatal: false);
      _analyticsRepository.logEvent(
        name: 'steps_fetch_error',
        parameters: {
          'screen_name': 'health_screen',
          'date': event.date.toIso8601String(),
          'error_message': e.toString(),
          'user_id': _getUserId(),
        },
      );
    }
  }

  String _getUserId() {
    return GetIt.instance<AuthenticationBloc>().state.user?.id ?? 'unknown';
  }
}
