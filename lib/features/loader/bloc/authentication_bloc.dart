import 'dart:async';
import 'dart:developer';

import 'package:ai_fit_coach/common/api/model/user_model.dart';
import 'package:ai_fit_coach/repositories/user_repository/abstract_user_repository.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AbstractUserRepository _userRepository;
  late final StreamSubscription<UserModel> _userSubscription;
  AuthenticationBloc({required AbstractUserRepository userRepository})
      : _userRepository = userRepository,
        super(const AuthenticationState.unknown()) {
    _userSubscription = _userRepository.user.listen((user) {
      log('User subscription received: $user');
      add(AuthenticationUserChanged(user));
    });
    on<AuthenticationUserChanged>(
      (event, emit) {
        final UserModel user = event.user;
        try {
          if (user != UserModel.emptyUser) {
            print('User authenticated: $user');
            emit(AuthenticationState.authenticated(user));
          } else {
            emit(const AuthenticationState.unauthenticated());
          }
        } catch (e) {
          log(e.toString());
          rethrow;
        }
      },
    );
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
