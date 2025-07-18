part of 'workout_exercise_bloc.dart';

sealed class WorkoutExerciseState extends Equatable {
  const WorkoutExerciseState();

  @override
  List<Object> get props => [];
}

final class WorkoutExerciseInitial extends WorkoutExerciseState {}

final class WorkoutExerciseLoading extends WorkoutExerciseState {}

final class WorkoutExerciseLoaded extends WorkoutExerciseState {
  final List<WorkoutSubitem> workoutExercise;

  const WorkoutExerciseLoaded({required this.workoutExercise});

  @override
  List<Object> get props => [workoutExercise];
}

final class WorkoutExerciseFailure extends WorkoutExerciseState {
  final Object error;

  const WorkoutExerciseFailure({required this.error});

  @override
  List<Object> get props => [error];
}
