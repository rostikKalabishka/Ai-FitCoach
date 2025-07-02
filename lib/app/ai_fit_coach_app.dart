import 'package:ai_fit_coach/app/app_initializer.dart';
import 'package:ai_fit_coach/blocs/settings_cubit/settings_cubit.dart';
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:ai_fit_coach/router/router.dart';
import 'package:ai_fit_coach/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            title: 'AI FitCoach',
            theme: state.isDark ? themeDark : themeLight,
            debugShowCheckedModeBanner: false,
            routerConfig: _router.config(),
          );
        },
      ),
    );
  }
}
