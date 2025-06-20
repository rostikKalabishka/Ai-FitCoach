// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_parameters_bloc.dart';

class UserParametersEvent extends Equatable {
  const UserParametersEvent();

  @override
  List<Object?> get props => [];
}

class GoalSelected extends UserParametersEvent {
  final String goal;

  const GoalSelected(this.goal);

  @override
  List<Object?> get props => [goal];
}

class FitnessLevelChanged extends UserParametersEvent {
  final String level;

  const FitnessLevelChanged(this.level);

  @override
  List<Object?> get props => [level];
}

class BodyParametersChanged extends UserParametersEvent {
  final int weight;
  final int height;
  final int age;

  const BodyParametersChanged({
    required this.weight,
    required this.height,
    required this.age,
  });

  @override
  List<Object?> get props => [weight, height, age];
}

class MotivationChanged extends UserParametersEvent {
  final UserMotivation motivation;

  const MotivationChanged(this.motivation);

  @override
  List<Object?> get props => [motivation];
}

class DietSelected extends UserParametersEvent {
  final String? diet;

  const DietSelected(this.diet);

  @override
  List<Object?> get props => [diet];
}

class ActivitiesSelected extends UserParametersEvent {
  final List<String> activities;

  const ActivitiesSelected(this.activities);

  @override
  List<Object?> get props => [activities];
}

class BadHabitsSelected extends UserParametersEvent {
  final List<String> badHabits;

  const BadHabitsSelected(this.badHabits);

  @override
  List<Object?> get props => [badHabits];
}

class TrainingDaysSelected extends UserParametersEvent {
  final List<String> trainingDays;

  const TrainingDaysSelected(this.trainingDays);

  @override
  List<Object?> get props => [trainingDays];
}

class TermsChanged extends UserParametersEvent {
  final bool accepted;

  const TermsChanged(this.accepted);

  @override
  List<Object?> get props => [accepted];
}

class SubmitParameters extends UserParametersEvent {
  final String userId;
  const SubmitParameters(
    this.userId,
  );

  @override
  List<Object?> get props => [userId];
}
