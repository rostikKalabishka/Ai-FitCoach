import 'package:ai_fit_coach/common/api/model/user_model.dart';
import 'package:ai_fit_coach/repositories/analytics_repository/abstract_analytics_repository.dart';

import 'package:ai_fit_coach/repositories/crashlytics_repository/crashlytics.dart';
import 'package:ai_fit_coach/repositories/user_repository/abstract_user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AbstractUserRepository _userRepository;
  final AbstractCrashlyticsRepository _crashlyticsRepository;
  final AbstractAnalyticsRepository _analyticsRepository;

  AuthBloc({
    required AbstractUserRepository userRepository,
    AbstractCrashlyticsRepository? crashlyticsRepository,
    AbstractAnalyticsRepository? analyticsRepository,
  })  : _userRepository = userRepository,
        _crashlyticsRepository = crashlyticsRepository ??
            GetIt.instance<AbstractCrashlyticsRepository>(),
        _analyticsRepository = analyticsRepository ??
            GetIt.instance<AbstractAnalyticsRepository>(),
        super(AuthInitial()) {
    on<AuthEvent>(
      (event, emit) async {
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
        } else if (event is SignOutEvent) {
          await _signOut(event, emit);
        }
      },
    );
  }

  Future<void> _registration(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthProcess());
    try {
      _crashlyticsRepository.log('Registering user with email: ${event.email}');
      UserModel userModel = UserModel.emptyUser
          .copyWith(email: event.email, username: event.userName);
      final newUser = await _userRepository.registration(
          password: event.password, userModel: userModel);
      await _userRepository.setUserData(newUser);

      emit(AuthSuccess());
      _analyticsRepository.logEvent(
        name: 'user_registered',
        parameters: {
          'screen_name': 'auth_screen',
          'email': event.email,
        },
      );
    } catch (e, stackTrace) {
      emit(AuthFailure(error: e));
      _crashlyticsRepository.recordError(e, stackTrace, fatal: false);
      _analyticsRepository.logEvent(
        name: 'user_registration_error',
        parameters: {
          'screen_name': 'auth_screen',
          'error_message': e.toString(),
          'email': event.email,
        },
      );
    }
  }

  Future<void> _login(SignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthProcess());
    try {
      _crashlyticsRepository.log('Logging in user with email: ${event.email}');
      await _userRepository.login(email: event.email, password: event.password);

      emit(AuthSuccess());
      _analyticsRepository.logEvent(
        name: 'user_logged_in',
        parameters: {
          'screen_name': 'auth_screen',
          'email': event.email,
        },
      );
    } catch (e, stackTrace) {
      emit(AuthFailure(error: e));
      _crashlyticsRepository.recordError(e, stackTrace, fatal: false);
      _analyticsRepository.logEvent(
        name: 'user_login_error',
        parameters: {
          'screen_name': 'auth_screen',
          'error_message': e.toString(),
          'email': event.email,
        },
      );
    }
  }

  Future<void> _signInWithGoogle(
      SignInWithGoogleEvent event, Emitter<AuthState> emit) async {
    emit(AuthProcess());
    try {
      _crashlyticsRepository.log('Signing in with Google');
      await _userRepository.singInWithGoogle();

      emit(AuthSuccess());
      _analyticsRepository.logEvent(
        name: 'user_signed_in_google',
        parameters: {
          'screen_name': 'auth_screen',
        },
      );
    } catch (e, stackTrace) {
      emit(AuthFailure(error: e));
      _crashlyticsRepository.recordError(e, stackTrace, fatal: false);
      _analyticsRepository.logEvent(
        name: 'user_sign_in_google_error',
        parameters: {
          'screen_name': 'auth_screen',
          'error_message': e.toString(),
        },
      );
    }
  }

  Future<void> _signInWithTwitter(
      SignInWithTwitterEvent event, Emitter<AuthState> emit) async {
    emit(AuthProcess());
    try {
      _crashlyticsRepository.log('Signing in with Twitter');
      await _userRepository.singInWithTwitter();

      emit(AuthSuccess());
      _analyticsRepository.logEvent(
        name: 'user_signed_in_twitter',
        parameters: {
          'screen_name': 'auth_screen',
        },
      );
    } catch (e, stackTrace) {
      emit(AuthFailure(error: e));
      _crashlyticsRepository.recordError(e, stackTrace, fatal: false);
      _analyticsRepository.logEvent(
        name: 'user_sign_in_twitter_error',
        parameters: {
          'screen_name': 'auth_screen',
          'error_message': e.toString(),
        },
      );
    }
  }

  Future<void> _signInWithFacebook(
      SignInWithFacebookEvent event, Emitter<AuthState> emit) async {
    emit(AuthProcess());
    try {
      _crashlyticsRepository.log('Signing in with Facebook');
      await _userRepository.singInWithFacebook();

      emit(AuthSuccess());
      _analyticsRepository.logEvent(
        name: 'user_signed_in_facebook',
        parameters: {'screen_name': 'auth_screen'},
      );
    } catch (e, stackTrace) {
      emit(AuthFailure(error: e));
      _crashlyticsRepository.recordError(e, stackTrace, fatal: false);
      _analyticsRepository.logEvent(
        name: 'user_sign_in_facebook_error',
        parameters: {
          'screen_name': 'auth_screen',
          'error_message': e.toString(),
        },
      );
    }
  }

  Future<void> _signOut(SignOutEvent event, Emitter<AuthState> emit) async {
    emit(AuthProcess());
    try {
      _crashlyticsRepository.log('Signing out user');
      await _userRepository.logOut();
      _crashlyticsRepository.setUserId('unknown');
      emit(AuthSuccess());
      _analyticsRepository.logEvent(
        name: 'user_signed_out',
        parameters: {
          'screen_name': 'auth_screen',
        },
      );
    } catch (e, stackTrace) {
      emit(AuthFailure(error: e));
      _crashlyticsRepository.recordError(e, stackTrace, fatal: false);
      _analyticsRepository.logEvent(
        name: 'user_sign_out_error',
        parameters: {
          'screen_name': 'auth_screen',
          'error_message': e.toString(),
        },
      );
    }
  }
}
