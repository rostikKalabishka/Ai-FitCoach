import 'package:ai_fit_coach/common/api/model/user_model.dart';
import 'package:ai_fit_coach/repositories/user_repository/user.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AbstractUserRepository _userRepository;
  AuthBloc({required AbstractUserRepository userRepository})
      : _userRepository = userRepository,
        super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is SignUpEvent) {
        await _registration(event, emit);
      } else if (event is SignInEvent) {
        await _login(event, emit);
      } else if (event is SignInWithGoogleEvent) {
        await _signInWithGoogle(event, emit);
      } else if (event is SignInWithTwitterEvent) {
        await _signInWithTwitter(event, emit);
      } else if (event is SignInWithFacebookEvent) {
        await _signInWithFacebook(event, emit);
      }
    });
  }

  Future<void> _registration(SignUpEvent event, emit) async {
    emit(AuthProcess());
    try {
      UserModel userModel = UserModel.emptyUser
          .copyWith(email: event.email, username: event.userName);
      final newUser = await _userRepository.registration(
          password: event.password, userModel: userModel);

      await _userRepository.setUserData(newUser);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(error: e));
    }
  }

  Future<void> _login(SignInEvent event, emit) async {
    emit(AuthProcess());
    try {
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(error: e));
    }
  }

  Future<void> _signInWithGoogle(SignInWithGoogleEvent event, emit) async {
    emit(AuthProcess());
    try {
      await _userRepository.singInWithGoogle();
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(error: e));
    }
  }

  Future<void> _signInWithTwitter(SignInWithTwitterEvent event, emit) async {
    emit(AuthProcess());
    try {
      await _userRepository.singInWithTwitter();
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(error: e));
    }
  }

  Future<void> _signInWithFacebook(SignInWithFacebookEvent event, emit) async {
    emit(AuthProcess());
    try {
      await _userRepository.singInWithFacebook();
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(error: e));
    }
  }
}
