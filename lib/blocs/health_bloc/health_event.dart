part of 'health_bloc.dart';

sealed class HealthEvent extends Equatable {
  const HealthEvent();

  @override
  List<Object> get props => [];
}

class HealthLoadInfoEvent extends HealthEvent {}

class HealthUpdateInfoEvent extends HealthEvent {}

class FetchStepsForDate extends HealthEvent {
  final DateTime date;

  const FetchStepsForDate(this.date);

  @override
  List<Object> get props => [date];
}
