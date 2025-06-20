import 'package:ai_fit_coach/features/auth/auth_screen/auth_screen.dart';
import 'package:ai_fit_coach/features/challenges/challenges.dart';

import 'package:ai_fit_coach/features/home/home.dart';
import 'package:ai_fit_coach/features/loader/view/loader_screen.dart';
import 'package:ai_fit_coach/features/settings/settings_screen/settings_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../features/auth/welcome/welcome_screen.dart';
import '../features/onboarding/onboarding.dart';
import '../features/user_parameters/user_parameters.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: LoaderRoute.page,
          path: '/',
        ),
        AutoRoute(
          page: OnboardingRoute.page,
          path: '/onboarding',
        ),
        AutoRoute(
          page: WelcomeRoute.page,
          path: '/welcome',
        ),
        AutoRoute(
          page: AuthRoute.page,
          path: '/welcome/auth',
        ),
        AutoRoute(page: HomeRoute.page, path: '/home', children: [
          AutoRoute(
            page: SettingsRoute.page,
            path: 'settings',
          ),
          AutoRoute(
            page: ChallengesRoute.page,
            path: 'challenges',
          ),
          // AutoRoute(
          //   page: UserParametersRoute.page,
          //   path: 'user_parameters',
          // ),
        ]),
        AutoRoute(
          page: UserParametersRoute.page,
          path: '/welcome/auth/user_parameters',
        ),
      ];
}
