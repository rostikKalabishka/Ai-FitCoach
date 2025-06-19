part of 'user_parameters_bloc.dart';

sealed class UserParametersState extends Equatable {
  const UserParametersState();
  
  @override
  List<Object> get props => [];
}

final class UserParametersInitial extends UserParametersState {}
