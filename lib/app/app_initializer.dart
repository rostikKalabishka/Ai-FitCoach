import 'package:ai_fit_coach/blocs/bloc/workout_exercise_bloc.dart';
import 'package:ai_fit_coach/blocs/history_bloc/history_bloc.dart';
import 'package:ai_fit_coach/blocs/settings_cubit/settings_cubit.dart';
import 'package:ai_fit_coach/blocs/user_bloc/user_bloc.dart';
import 'package:ai_fit_coach/common/di/di.dart';
import 'package:ai_fit_coach/features/ai_chat/bloc/chat_bloc.dart';
import 'package:ai_fit_coach/features/auth/bloc/auth_bloc.dart';
import 'package:ai_fit_coach/features/challenges/bloc/challenge_bloc.dart';
import 'package:ai_fit_coach/features/loader/bloc/authentication_bloc.dart';
import 'package:ai_fit_coach/features/trending_screen/trending_screen/bloc/list_bloc.dart';
import 'package:ai_fit_coach/features/user_parameters/bloc/user_parameters_bloc.dart';
import 'package:ai_fit_coach/features/workout/bloc/workout_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppInitializer extends StatelessWidget {
  const AppInitializer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthenticationBloc>(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => getIt<UserBloc>()
              ..add(GetUser(
                  userId: context.read<AuthenticationBloc>().state.user!.id)),
          ),
          BlocProvider(
            create: (_) => getIt<SettingsCubit>(),
          ),
          BlocProvider(
            create: (_) => getIt<AuthBloc>(),
          ),
          BlocProvider(
            create: (_) => getIt<UserParametersBloc>(),
          ),
          BlocProvider(
            create: (_) => getIt<ChatBloc>(),
          ),
          BlocProvider(
            create: (_) => getIt<HistoryBloc>(),
          ),
          BlocProvider(
            create: (_) => getIt<WorkoutBloc>(),
          ),
          BlocProvider(
            create: (_) => getIt<ChallengeBloc>(),
          ),
          BlocProvider(
            create: (_) => getIt<ListBloc>(),
          ),
          BlocProvider(
            create: (_) => getIt<WorkoutExerciseBloc>(),
          )

        ],
        child: child,
      ),
    );
  }
}
