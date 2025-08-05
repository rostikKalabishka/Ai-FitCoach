import 'package:ai_fit_coach/blocs/health_bloc/health_bloc.dart';

import 'package:ai_fit_coach/blocs/bloc/workout_exercise_bloc.dart';

import 'package:ai_fit_coach/blocs/history_bloc/history_bloc.dart';
import 'package:ai_fit_coach/blocs/settings_cubit/settings_cubit.dart';
import 'package:ai_fit_coach/blocs/user_bloc/user_bloc.dart';
import 'package:ai_fit_coach/features/ai_chat/bloc/chat_bloc.dart';
import 'package:ai_fit_coach/features/auth/bloc/auth_bloc.dart';
import 'package:ai_fit_coach/features/challenges/bloc/challenge_bloc.dart';
import 'package:ai_fit_coach/features/loader/bloc/authentication_bloc.dart';
import 'package:ai_fit_coach/features/trending_screen/trending_details/bloc/trending_details_bloc.dart';
import 'package:ai_fit_coach/features/trending_screen/trending_screen/bloc/list_bloc.dart';
import 'package:ai_fit_coach/features/user_parameters/bloc/user_parameters_bloc.dart';
import 'package:ai_fit_coach/repositories/analytics_repository/abstract_analytics_repository.dart';
import 'package:ai_fit_coach/repositories/analytics_repository/analytics_repository.dart';

import 'package:ai_fit_coach/repositories/health_repository/health.dart';

import 'package:ai_fit_coach/features/workout/bloc/workout_bloc.dart';
import 'package:ai_fit_coach/repositories/recommendation_repository/abstract_recommendation_repository.dart';
import 'package:ai_fit_coach/repositories/recommendation_repository/recommendation_repository.dart';

import 'package:ai_fit_coach/repositories/user_repository/user.dart';
import 'package:ai_fit_coach/repositories/workout_repository/abstract_workout_repository.dart';
import 'package:ai_fit_coach/repositories/workout_repository/workout_repository.dart';
import 'package:get_it/get_it.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../repositories/challenge_repository/abstract_challenge_repository.dart';
import '../../repositories/challenge_repository/challenge_repository.dart';
import '../../repositories/chat_repository/chat.dart';
import '../../repositories/crashlytics_repository/crashlytics.dart';
import '../../repositories/settings_repository/settings.dart';

final getIt = GetIt.instance;

void initDI({required SharedPreferences sharedPreferences}) {
  getIt.registerLazySingleton<AbstractSettingsRepository>(
      () => SettingsRepository(sharedPreferences: sharedPreferences));

  getIt.registerLazySingleton<AbstractUserRepository>(() => UserRepository());

  getIt.registerLazySingleton<AbstractChatRepository>(() => ChatRepository());

  getIt.registerLazySingleton<AbstractAnalyticsRepository>(
      () => AnalyticsRepository());

  getIt.registerLazySingleton<AbstractCrashlyticsRepository>(
      () => CrashlyticsRepository());

  getIt.registerLazySingleton<AbstractHealthRepository>(
      () => HealthRepository());

  getIt.registerLazySingleton<AbstractWorkoutRepository>(
      () => WorkoutRepository());

  getIt.registerLazySingleton<AbstractChallengeRepository>(
      () => ChallengeRepository());

  getIt.registerLazySingleton<AbstractRecommendationRepository>(
      () => RecommendationRepository());

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
      userRepository: getIt<AbstractUserRepository>(),
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

  getIt.registerLazySingleton<ChatBloc>(
    () => ChatBloc(
      chatRepository: getIt<AbstractChatRepository>(),
    ),
  );

  getIt.registerLazySingleton<HistoryBloc>(
    () => HistoryBloc(
      chatRepository: getIt<AbstractChatRepository>(),
    ),
  );

  getIt.registerLazySingleton<HealthBloc>(
    () => HealthBloc(
      abstractHealthRepository: getIt<AbstractHealthRepository>(),
    ),
  );

  getIt.registerLazySingleton<WorkoutBloc>(
    () => WorkoutBloc(
      workoutRepository: getIt<AbstractWorkoutRepository>(),
    ),
  );

  getIt.registerLazySingleton<ChallengeBloc>(
    () => ChallengeBloc(
      challengeRepository: getIt<AbstractChallengeRepository>(),
    ),
  );

  getIt.registerLazySingleton<ListBloc>(
    () => ListBloc(
      recommendationRepository: getIt<AbstractRecommendationRepository>(),
    ),
  );

  getIt.registerLazySingleton<WorkoutExerciseBloc>(
    () => WorkoutExerciseBloc(
      workoutRepository: getIt<AbstractWorkoutRepository>(),
    ),
  );

  getIt.registerLazySingleton<TrendingDetailsBloc>(
    () => TrendingDetailsBloc(
      recommendationRepository: getIt<AbstractRecommendationRepository>(),
    ),
  );
}
