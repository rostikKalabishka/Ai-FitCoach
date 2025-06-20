import 'package:ai_fit_coach/common/api/model/user_model.dart';
import 'package:ai_fit_coach/repositories/user_repository/abstract_user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AbstractUserRepository userRepository;
  UserBloc({required AbstractUserRepository myUserRepository})
      : userRepository = myUserRepository,
        super(const UserState()) {
    on<UserEvent>((event, emit) async {
      if (event is GetUser) {
        await _getUser(event, emit);
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
      emit(state.copyWith(error: e));
    }
  }
}
