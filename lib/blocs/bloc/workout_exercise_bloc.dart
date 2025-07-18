import 'package:ai_fit_coach/common/api/model/workout/workout_subitem.dart';
import 'package:ai_fit_coach/repositories/workout_repository/abstract_workout_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'workout_exercise_event.dart';
part 'workout_exercise_state.dart';

enum WorkoutCategoryType { all, newbie, medium, advanced }

class WorkoutExerciseBloc
    extends Bloc<WorkoutExerciseEvent, WorkoutExerciseState> {
  final AbstractWorkoutRepository _workoutRepository;

  WorkoutExerciseBloc({required AbstractWorkoutRepository workoutRepository})
      : _workoutRepository = workoutRepository,
        super(WorkoutExerciseInitial()) {
    on<WorkoutExerciseEvent>((event, emit) async {
      if (event is WorkoutExerciseItemEvent) {
        await _waitLoadExercise(event, emit);
      }
    });
  }

  Future<void> _waitLoadExercise(WorkoutExerciseItemEvent event, emit) async {
    if (state is! WorkoutExerciseLoaded) {
      emit(WorkoutExerciseLoading());
    }
    try {
      final workoutExeciseList =
          await _workoutRepository.getWorkoutExerciseItemInCollection(
              _workoutCategoryType(event.workoutCategoryType), event.workoutId);
      emit(WorkoutExerciseLoaded(workoutExercise: workoutExeciseList));
    } catch (e) {
      emit(WorkoutExerciseFailure(error: e));
    }
  }

  String _workoutCategoryType(WorkoutCategoryType workoutCategoryType) {
    switch (workoutCategoryType) {
      case WorkoutCategoryType.all:
        return 'all';
      case WorkoutCategoryType.newbie:
        return 'newbie';
      case WorkoutCategoryType.medium:
        return 'medium';
      case WorkoutCategoryType.advanced:
        return 'advanced';
    }
  }
}
