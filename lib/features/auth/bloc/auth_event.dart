part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String userName;

  const SignUpEvent(
      {required this.email, required this.password, required this.userName});

  @override
  List<Object> get props => super.props..addAll([password, email, userName]);
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  const SignInEvent({required this.email, required this.password});

  @override
  List<Object> get props => super.props..addAll([email, password]);
}

class SignOutEvent extends AuthEvent {}

class SignInWithGoogleEvent extends AuthEvent {}

class SignInWithTwitterEvent extends AuthEvent {}

class SignInWithFacebookEvent extends AuthEvent {}
