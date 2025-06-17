import 'package:ai_fit_coach/app/app_initializer.dart';
import 'package:ai_fit_coach/blocs/settings_cubit/settings_cubit.dart';

// import 'package:ai_fit_coach/features/auth/auth.dart';
import 'package:ai_fit_coach/features/settings/settings_screen/view.dart';
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
    return MaterialApp(
        title: 'Flutter Demo',
        theme: themeDark,
        debugShowCheckedModeBanner: false,
        home: WelcomeScreen());
  }
}
