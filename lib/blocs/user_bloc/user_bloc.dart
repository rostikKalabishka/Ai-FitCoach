// user_bloc.dart
import 'package:ai_fit_coach/common/api/model/user_model.dart';
import 'package:ai_fit_coach/repositories/user_repository/abstract_user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AbstractUserRepository userRepository;

  UserBloc({required this.userRepository}) : super(const UserState()) {
    on<UserEvent>((event, emit) async {
      if (event is GetUser) {
        await _getUser(event, emit);
      } else if (event is UpdateUserInfo) {
        await _updateUserInfo(event, emit);
      } else if (event is UpdateUserField) {
        _updateUserField(event, emit);
      }
    });
  }

  Future<void> _getUser(GetUser event, emit) async {
    if (state.userStatus != UserStatus.loaded) {
      emit(state.copyWith(userStatus: UserStatus.loading));
    }
    try {
      final UserModel userModel = await userRepository.getMyUser(event.userId);
      emit(state.copyWith(userModel: userModel, userStatus: UserStatus.loaded));
    } catch (e) {
      emit(state.copyWith(error: e, userStatus: UserStatus.error));
    }
  }

  Future<void> _updateUserInfo(UpdateUserInfo event, emit) async {
    if (state.userStatus != UserStatus.loaded) {
      emit(state.copyWith(userStatus: UserStatus.loading));
    }
    try {
      await userRepository.updateUserInfo(userModel: event.userModel);
      emit(state.copyWith(
        userModel: event.userModel,
        userStatus: UserStatus.loaded,
        hasChanges: false,
      ));
    } catch (e) {
      emit(state.copyWith(error: e, userStatus: UserStatus.error));
    }
  }

  void _updateUserField(UpdateUserField event, emit) {
    emit(state.copyWith(
      userModel: event.userModel,
      hasChanges: true, // Mark as changed
    ));
  }
}
