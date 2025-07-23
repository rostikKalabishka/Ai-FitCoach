part of 'health_bloc.dart';

sealed class HealthState extends Equatable {
  const HealthState();

  @override
  List<Object> get props => [];
}

final class HealthInitial extends HealthState {}

final class HealthLoading extends HealthState {}

final class HealthLoaded extends HealthState {
  final int steps;
  final DateTime date;

  const HealthLoaded({required this.steps, required this.date});

  @override
  List<Object> get props => [steps, date];
}

final class HealthFailure extends HealthState {
  final Object error;

  const HealthFailure({required this.error});

  @override
  List<Object> get props => [error];
}
