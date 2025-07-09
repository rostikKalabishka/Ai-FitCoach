part of 'workout_bloc.dart';

sealed class WorkoutState extends Equatable {
  const WorkoutState();

  @override
  List<Object> get props => [];
}

final class WorkoutInitial extends WorkoutState {}

final class WorkoutLoading extends WorkoutState {}

final class WorkoutLoaded extends WorkoutState {
  final List<WorkoutItem> listWorkoutItem;

  const WorkoutLoaded({required this.listWorkoutItem});

  @override
  List<Object> get props => [listWorkoutItem];
}

final class WorkoutFailure extends WorkoutState {
  final Object error;

  const WorkoutFailure({required this.error});

  @override
  List<Object> get props => [error];
}
