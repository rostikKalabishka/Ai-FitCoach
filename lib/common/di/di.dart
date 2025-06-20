import 'package:ai_fit_coach/blocs/settings_cubit/settings_cubit.dart';
import 'package:ai_fit_coach/blocs/user_bloc/user_bloc.dart';
import 'package:ai_fit_coach/features/auth/bloc/auth_bloc.dart';
import 'package:ai_fit_coach/features/loader/bloc/authentication_bloc.dart';
import 'package:ai_fit_coach/features/user_parameters/bloc/user_parameters_bloc.dart';
import 'package:ai_fit_coach/repositories/user_repository/user.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../repositories/settings_repository/settings.dart';

final getIt = GetIt.instance;

void initDI({required SharedPreferences sharedPreferences}) {
  getIt.registerLazySingleton<AbstractSettingsRepository>(
      () => SettingsRepository(sharedPreferences: sharedPreferences));

  getIt.registerLazySingleton<AbstractUserRepository>(() => UserRepository());

  getIt.registerLazySingleton<SettingsCubit>(
    () => SettingsCubit(
      settingsRepository: getIt<AbstractSettingsRepository>(),
    ),
  );

  getIt.registerLazySingleton<AuthenticationBloc>(
    () => AuthenticationBloc(
      userRepository: getIt<AbstractUserRepository>(),
    ),
  );

  getIt.registerLazySingleton<UserBloc>(
    () => UserBloc(
      myUserRepository: getIt<AbstractUserRepository>(),
    ),
  );

  getIt.registerLazySingleton<UserParametersBloc>(
    () => UserParametersBloc(
      userRepository: getIt<AbstractUserRepository>(),
    ),
  );

  getIt.registerLazySingleton<AuthBloc>(
    () => AuthBloc(
      userRepository: getIt<AbstractUserRepository>(),
    ),
  );
}
