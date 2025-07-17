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

  const HealthLoaded({this.steps = 0});

  HealthLoaded copyWith({
    int? steps,
  }) {
    return HealthLoaded(
      steps: steps ?? this.steps,
    );
  }

  @override
  List<Object> get props => [steps];
}

final class HealthFailure extends HealthState {
  final Object error;

  const HealthFailure({required this.error});

  @override
  List<Object> get props => [error];
}
