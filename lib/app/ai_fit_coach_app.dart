import 'package:ai_fit_coach/app/app_initializer.dart';
import 'package:ai_fit_coach/blocs/settings_cubit/settings_cubit.dart';
import 'package:ai_fit_coach/router/router.dart';
import 'package:ai_fit_coach/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AiFitCoachApp extends StatefulWidget {
  const AiFitCoachApp({super.key});

  @override
  State<AiFitCoachApp> createState() => _AiFitCoachAppState();
}

class _AiFitCoachAppState extends State<AiFitCoachApp> {
  final _router = AppRouter();
  @override
  Widget build(BuildContext context) {
    return AppInitializer(
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Flutter Demo',
            theme: state.isDark ? themeDark : themeLight,
            debugShowCheckedModeBanner: false,
            routerConfig: _router.config(),
          );
        },
      ),
    );
  }
}
