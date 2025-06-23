part of 'user_parameters_bloc.dart';

sealed class UserParametersState extends Equatable {
  const UserParametersState();

  @override
  List<Object> get props => [];
}

final class UserParametersInitial extends UserParametersState {}

final class UserParametersProcess extends UserParametersState {
  const UserParametersProcess();
}

final class UserParametersSuccess extends UserParametersState {
  const UserParametersSuccess();
}

final class UserParametersFailure extends UserParametersState {
  final Object error;

  const UserParametersFailure({required this.error});

  @override
  List<Object> get props => [error];
}
