import 'dart:developer';
import 'package:ai_fit_coach/common/api/model/workout/workout_item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repositories/workout_repository/abstract_workout_repository.dart';

part 'workout_event.dart';
part 'workout_state.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  final AbstractWorkoutRepository _workoutRepository;
  WorkoutBloc({required AbstractWorkoutRepository workoutRepository})
      : _workoutRepository = workoutRepository,
        super(WorkoutInitial()) {
    on<LoadListWorkoutItemEvent>(_loadListWorkoutItem);
  }
  Future<void> _loadListWorkoutItem(
      LoadListWorkoutItemEvent event, emit) async {
    if (state is! WorkoutLoaded) {
      emit(WorkoutLoading());
    }
    try {
      final listWorkoutItem = await _workoutRepository
          .getWorkoutItemsFromSubcollection('absAndCore');
      emit(WorkoutLoaded(listWorkoutItem: listWorkoutItem));
    } catch (e) {
      emit(WorkoutFailure(error: e));
      log(e.toString());
    }
  }
}
