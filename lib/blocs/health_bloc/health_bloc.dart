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
    on<HealthEvent>((event, emit) async {
      if (event is HealthLoadInfoEvent) {
        await _loadHealthInfo(event, emit);
      }
    });
  }
  Future<void> _loadHealthInfo(HealthLoadInfoEvent event, emit) async {
    if (state is! HealthLoaded) {
      emit(HealthLoading());
    }
    try {
      final steps = await _abstractHealthRepository.getSteps();
      emit(HealthLoaded(steps: steps));
    } catch (e) {
      emit(HealthFailure(error: e));
    }
  }
}
