part of 'workout_exercise_bloc.dart';

sealed class WorkoutExerciseEvent extends Equatable {
  const WorkoutExerciseEvent();

  @override
  List<Object> get props => [];
}

class WorkoutExerciseItemEvent extends WorkoutExerciseEvent {
  final String workoutId;
  final WorkoutCategoryType workoutCategoryType;

  const WorkoutExerciseItemEvent(
      {required this.workoutId, required this.workoutCategoryType});

  @override
  List<Object> get props => [workoutId, workoutCategoryType];
}
