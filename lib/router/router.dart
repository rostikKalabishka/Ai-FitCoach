import 'package:ai_fit_coach/common/api/model/challenges/challenge_item.dart';
import 'package:ai_fit_coach/features/ai_chat/view/ai_chat_screen.dart';
import 'package:ai_fit_coach/features/auth/auth_screen/auth_screen.dart';
import 'package:ai_fit_coach/features/challenges/challenges.dart';
import 'package:ai_fit_coach/features/home/home.dart';
import 'package:ai_fit_coach/features/loader/view/loader_screen.dart';
import 'package:ai_fit_coach/features/settings/settings_screen/settings_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../features/auth/welcome/welcome_screen.dart';

import '../features/trending_screen/main_screen.dart';
import '../features/onboarding/onboarding.dart';

import '../features/settings/settings.dart';
import '../features/user_parameters/user_parameters.dart';

import '../features/workout/workout.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoaderRoute.page, path: '/', initial: true),
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
          page: UserParametersRoute.page,
          path: '/welcome/auth/user_parameters',
        ),
        AutoRoute(page: HomeRoute.page, path: '/home', children: [
          AutoRoute(
            page: SettingsRoute.page,
            path: 'settings',
          ),
          AutoRoute(
            page: TrendingRoute.page,
            path: 'trending_screen',
          ),
          AutoRoute(
              page: ChallengesRoute.page,
              path: 'challenges_screen',
              children: [
                AutoRoute(
                  page: ExerciseChallengesRoute.page,
                  path: 'exercise_challenges_screen',
                ),
                AutoRoute(
                  page: FoodChallengesRoute.page,
                  path: 'food_challenges_screen',
                ),
                AutoRoute(
                  page: HydrationChallengesRoute.page,
                  path: 'hydration_challenges_screen',
                ),
                AutoRoute(
                  page: MentalChallengesRoute.page,
                  path: 'mental_challenges_screen',
                ),
                AutoRoute(
                  page: SleepAndRelaxChallengesRoute.page,
                  path: 'sleep_and_relax_challenges_screen',
                ),
              ]),
          AutoRoute(
            page: WorkoutRoute.page,
            path: 'workout_screen',
          ),
          AutoRoute(
            page: AiChatRoute.page,
            path: 'ai_chat_screen',
          ),
        ]),
        AutoRoute(
          page: AccountManagementRoute.page,
          path: '/home/settings/account_management_screen',
        ),
        AutoRoute(
          page: AutomaticActivityTrackingRoute.page,
          path: '/home/settings/automatic_activity_tracking_screen',
        ),
        AutoRoute(
          page: CalorieGoalRoute.page,
          path: '/home/settings/calorie_goal_screen',
        ),
        AutoRoute(
          page: DeleteYourAccountRoute.page,
          path: '/home/settings/delete_your_account_screen',
        ),
        AutoRoute(
          page: DifficultyLevelRoute.page,
          path: '/home/settings/difficulty_level_screen',
        ),
        AutoRoute(
          page: DoNotDisturbModeRoute.page,
          path: '/home/settings/do_not_disturb_mode_screen',
        ),
        AutoRoute(
          page: FitnessGoalRoute.page,
          path: '/home/settings/fitness_goal_screen',
        ),
        AutoRoute(
          page: LanguageLocalizationRoute.page,
          path: '/home/settings/language_localization_screen',
        ),
        AutoRoute(
          page: PrivacyPolicyRoute.page,
          path: '/home/settings/privacy_policy_screen',
        ),
        AutoRoute(
          page: PrivacyRoute.page,
          path: '/home/settings/privacy_screen',
        ),
        AutoRoute(
          page: RateUsRoute.page,
          path: '/home/settings/rate_us_screen',
        ),
        AutoRoute(
          page: UserProfileRoute.page,
          path: '/home/settings/user_profile_screen',
        ),
        AutoRoute(
          page: WaterBalanceRoute.page,
          path: '/home/settings/water_balance_screen',
        ),
        AutoRoute(
          page: WorkoutTypesRoute.page,
          path: '/home/settings/workout_types_screen',
        ),
        
      ];
}
