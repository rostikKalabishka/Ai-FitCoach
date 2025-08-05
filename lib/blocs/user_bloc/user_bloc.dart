import 'package:ai_fit_coach/common/api/model/user_model.dart';
import 'package:ai_fit_coach/features/loader/bloc/authentication_bloc.dart';
import 'package:ai_fit_coach/repositories/analytics_repository/abstract_analytics_repository.dart';

import 'package:ai_fit_coach/repositories/user_repository/abstract_user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/crashlytics_repository/crashlytics.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AbstractUserRepository _userRepository;
  final AbstractCrashlyticsRepository _crashlyticsRepository;
  final AbstractAnalyticsRepository _analyticsRepository;

  UserBloc({
    required AbstractUserRepository userRepository,
    AbstractCrashlyticsRepository? crashlyticsRepository,
    AbstractAnalyticsRepository? analyticsRepository,
  })  : _userRepository = userRepository,
        _crashlyticsRepository = crashlyticsRepository ??
            GetIt.instance<AbstractCrashlyticsRepository>(),
        _analyticsRepository = analyticsRepository ??
            GetIt.instance<AbstractAnalyticsRepository>(),
        super(const UserState()) {
    _crashlyticsRepository.setUserId(_getUserId());
    on<UserEvent>((event, emit) async {
      if (event is GetUser) {
        await _getUser(event, emit);
      } else if (event is UpdateUserInfo) {
        await _updateUserInfo(event, emit);
      } else if (event is UpdateUserField) {
        _updateUserField(event, emit);
      } else if (event is DeleteUserAccount) {
        await _deleteUserAccount(event, emit);
      }
    });
  }

  Future<void> _getUser(GetUser event, Emitter<UserState> emit) async {
    if (state.userStatus != UserStatus.loaded) {
      emit(state.copyWith(userStatus: UserStatus.loading));
    }
    try {
      _crashlyticsRepository
          .log('Fetching user info for userId: ${event.userId}');
      final UserModel userModel = await _userRepository.getMyUser(event.userId);
      emit(state.copyWith(userModel: userModel, userStatus: UserStatus.loaded));
      _analyticsRepository.logEvent(
        name: 'user_info_fetched',
        parameters: {
          'screen_name': 'user_screen',
          'user_id': event.userId,
        },
      );
    } catch (e, stackTrace) {
      emit(state.copyWith(error: e, userStatus: UserStatus.error));
      _crashlyticsRepository.recordError(e, stackTrace, fatal: false);
      _analyticsRepository.logEvent(
        name: 'user_info_fetch_error',
        parameters: {
          'screen_name': 'user_screen',
          'error_message': e.toString(),
          'user_id': event.userId,
        },
      );
    }
  }

  Future<void> _updateUserInfo(
      UpdateUserInfo event, Emitter<UserState> emit) async {
    if (state.userStatus != UserStatus.loaded) {
      emit(state.copyWith(userStatus: UserStatus.loading));
    }
    try {
      _crashlyticsRepository
          .log('Updating user info for userId: ${event.userModel.id}');
      await _userRepository.updateUserInfo(userModel: event.userModel);
      emit(state.copyWith(
        userModel: event.userModel,
        userStatus: UserStatus.loaded,
        hasChanges: false,
      ));
      _analyticsRepository.logEvent(
        name: 'user_info_updated',
        parameters: {
          'screen_name': 'user_screen',
          'user_id': event.userModel.id,
        },
      );
    } catch (e, stackTrace) {
      emit(state.copyWith(error: e, userStatus: UserStatus.error));
      _crashlyticsRepository.recordError(e, stackTrace, fatal: false);
      _analyticsRepository.logEvent(
        name: 'user_info_update_error',
        parameters: {
          'screen_name': 'user_screen',
          'error_message': e.toString(),
          'user_id': event.userModel.id,
        },
      );
    }
  }

  void _updateUserField(UpdateUserField event, Emitter<UserState> emit) {
    try {
      _crashlyticsRepository
          .log('Updating user field for userId: ${event.userModel.id}');
      emit(state.copyWith(
        userModel: event.userModel,
        hasChanges: true,
      ));
      _analyticsRepository.logEvent(
        name: 'user_field_updated',
        parameters: {
          'screen_name': 'user_screen',
          'user_id': event.userModel.id,
        },
      );
    } catch (e, stackTrace) {
      _crashlyticsRepository.recordError(e, stackTrace, fatal: false);
      _analyticsRepository.logEvent(
        name: 'user_field_update_error',
        parameters: {
          'screen_name': 'user_screen',
          'error_message': e.toString(),
          'user_id': event.userModel.id,
        },
      );
    }
  }

  Future<void> _deleteUserAccount(
      DeleteUserAccount event, Emitter<UserState> emit) async {
    try {
      _crashlyticsRepository
          .log('Deleting user account for userId: ${state.userModel.id}');
      await _userRepository.deleteAccount(state.userModel.id);
      emit(state.copyWith(
        userStatus: UserStatus.delete,
        userModel: UserModel.emptyUser,
      ));
      _analyticsRepository.logEvent(
        name: 'user_account_deleted',
        parameters: {
          'screen_name': 'user_screen',
          'user_id': state.userModel.id,
        },
      );
    } catch (e, stackTrace) {
      emit(state.copyWith(error: e, userStatus: UserStatus.error));
      _crashlyticsRepository.recordError(e, stackTrace, fatal: false);
      _analyticsRepository.logEvent(
        name: 'user_account_delete_error',
        parameters: {
          'screen_name': 'user_screen',
          'error_message': e.toString(),
          'user_id': state.userModel.id,
        },
      );
    }
  }

  String _getUserId() {
    return GetIt.instance<AuthenticationBloc>().state.user?.id ?? 'unknown';
  }
}
