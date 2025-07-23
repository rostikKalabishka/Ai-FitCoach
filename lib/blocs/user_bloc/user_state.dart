// user_state.dart
part of 'user_bloc.dart';

enum UserStatus { initial, loading, loaded, error }

class UserState extends Equatable {
  const UserState({
    this.userModel = UserModel.emptyUser,
    this.userStatus = UserStatus.initial,
    this.error,
    this.hasChanges = false, // Track changes
  });

  final UserModel userModel;
  final UserStatus userStatus;
  final Object? error;
  final bool hasChanges;

  UserState copyWith({
    UserModel? userModel,
    UserStatus? userStatus,
    Object? error,
    bool? hasChanges,
  }) {
    return UserState(
      userModel: userModel ?? this.userModel,
      userStatus: userStatus ?? this.userStatus,
      error: error ?? this.error,
      hasChanges: hasChanges ?? this.hasChanges,
    );
  }

  @override
  List<Object?> get props => [userModel, userStatus, error, hasChanges];
}
