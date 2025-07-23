// user_event.dart
part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUser extends UserEvent {
  final String userId;

  const GetUser({required this.userId});
}

class UpdateUserInfo extends UserEvent {
  final UserModel userModel;

  const UpdateUserInfo({
    required this.userModel,
  });

  @override
  List<Object> get props => [userModel];
}

class UpdateUserField extends UserEvent {
  final UserModel userModel;

  const UpdateUserField({
    required this.userModel,
  });

  @override
  List<Object> get props => [userModel];
}
