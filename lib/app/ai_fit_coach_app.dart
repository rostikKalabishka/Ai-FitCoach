import 'package:ai_fit_coach/router/router.dart';
import 'package:ai_fit_coach/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class AiFitCoachApp extends StatefulWidget {
  const AiFitCoachApp({super.key});

  @override
  State<AiFitCoachApp> createState() => _AiFitCoachAppState();
}

class _AiFitCoachAppState extends State<AiFitCoachApp> {
  final _router = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: themeDark,
      routerConfig: _router.config(),
    );
  }
}
