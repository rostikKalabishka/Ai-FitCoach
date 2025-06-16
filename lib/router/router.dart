import 'package:ai_fit_coach/features/auth/auth_screen/view/auth_screen.dart';
import 'package:ai_fit_coach/features/auth/welcome/view/welcome_screen.dart';
import 'package:ai_fit_coach/features/home/home.dart';
import 'package:ai_fit_coach/features/loader/view/loader_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../features/onboarding/onboarding.dart';
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
        AutoRoute(
          page: HomeRoute.page,
          path: '/home',
        ),
      ];
}
