import 'package:ai_fit_coach/repositories/health_repository/health.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'health_event.dart';
part 'health_state.dart';

class HealthBloc extends Bloc<HealthEvent, HealthState> {
  final AbstractHealthRepository _abstractHealthRepository;

  HealthBloc({required AbstractHealthRepository abstractHealthRepository})
      : _abstractHealthRepository = abstractHealthRepository,
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
      final steps = await _abstractHealthRepository.getSteps();
      emit(HealthLoaded(steps: steps, date: DateTime.now()));
    } catch (e) {
      emit(HealthFailure(error: e));
    }
  }

  Future<void> _updateHealthInfo(
      HealthUpdateInfoEvent event, Emitter<HealthState> emit) async {
    if (state is! HealthLoaded) {
      emit(HealthLoading());
    }
    try {
      // Placeholder: Update health info (e.g., sync with health platform)
      final steps = await _abstractHealthRepository.getSteps();
      emit(HealthLoaded(steps: steps, date: DateTime.now()));
    } catch (e) {
      emit(HealthFailure(error: e));
    }
  }

  Future<void> _fetchStepsForDate(
      FetchStepsForDate event, Emitter<HealthState> emit) async {
    if (state is! HealthLoaded) {
      emit(HealthLoading());
    }
    try {
      final steps = await _abstractHealthRepository.getStepsForDate(event.date);
      emit(HealthLoaded(steps: steps, date: event.date));
    } catch (e) {
      emit(HealthFailure(error: e));
    }
  }
}
