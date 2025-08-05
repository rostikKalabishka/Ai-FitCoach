import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:ai_fit_coach/repositories/analytics_repository/abstract_analytics_repository.dart';
import 'package:ai_fit_coach/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SettingsCard6 extends StatelessWidget {
  const SettingsCard6({
    super.key,
    required this.theme,
    required this.router,
    this.onTap,
  });

  final ThemeData theme;
  final StackRouter router;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final analyticsRepository = GetIt.instance<AbstractAnalyticsRepository>();
    return Container(
      height: MediaQuery.of(context).size.height * 0.18,
      width: MediaQuery.of(context).size.width * 0.95,
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        borderRadius: BorderRadiusDirectional.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 2, left: 10, bottom: 2, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                onTap?.call();
                analyticsRepository.logEvent(
                  name: 'settings_card_click',
                  parameters: {
                    'screen_name': 'settings_screen',
                    'card_name': 'settings_card_6',
                    'item_name': 'privacy_policy',
                  },
                );
                try {
                  router.push(PrivacyPolicyRoute());
                  analyticsRepository.logEvent(
                    name: 'navigate_to',
                    parameters: {
                      'screen_name': 'settings_screen',
                      'destination': 'privacy_policy_screen',
                    },
                  );
                } catch (e) {
                  analyticsRepository.logEvent(
                    name: 'navigation_error',
                    parameters: {
                      'screen_name': 'settings_screen',
                      'destination': 'privacy_policy_screen',
                      'error_message': e.toString(),
                    },
                  );
                }
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(6),
                            shape: BoxShape.rectangle,
                            color: const Color.fromARGB(255, 92, 40, 1),
                          ),
                          child: Icon(
                            Icons.privacy_tip,
                            size: 20,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        S.of(context).privacyPolicy,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.displaySmall
                            ?.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            CustomDivider(),
            InkWell(
              onTap: () {
                onTap?.call();
                analyticsRepository.logEvent(
                  name: 'settings_card_click',
                  parameters: {
                    'screen_name': 'settings_screen',
                    'card_name': 'settings_card_6',
                    'item_name': 'rate_us',
                  },
                );
                try {
                  router.push(RateUsRoute());
                  analyticsRepository.logEvent(
                    name: 'navigate_to',
                    parameters: {
                      'screen_name': 'settings_screen',
                      'destination': 'rate_us_screen',
                    },
                  );
                } catch (e) {
                  analyticsRepository.logEvent(
                    name: 'navigation_error',
                    parameters: {
                      'screen_name': 'settings_screen',
                      'destination': 'rate_us_screen',
                      'error_message': e.toString(),
                    },
                  );
                }
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(6),
                            shape: BoxShape.rectangle,
                            color: const Color.fromARGB(255, 206, 101, 101),
                          ),
                          child: Icon(
                            Icons.thumb_up,
                            size: 20,
                            color: theme.iconTheme.color,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        S.of(context).rateUs,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.displaySmall
                            ?.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            CustomDivider(),
            InkWell(
              onTap: () {
                onTap?.call();
                analyticsRepository.logEvent(
                  name: 'settings_card_click',
                  parameters: {
                    'screen_name': 'settings_screen',
                    'card_name': 'settings_card_6',
                    'item_name': 'delete_account',
                  },
                );
                try {
                  router.push(DeleteYourAccountRoute());
                  analyticsRepository.logEvent(
                    name: 'navigate_to',
                    parameters: {
                      'screen_name': 'settings_screen',
                      'destination': 'delete_account_screen',
                    },
                  );
                } catch (e) {
                  analyticsRepository.logEvent(
                    name: 'navigation_error',
                    parameters: {
                      'screen_name': 'settings_screen',
                      'destination': 'delete_account_screen',
                      'error_message': e.toString(),
                    },
                  );
                }
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(6),
                            shape: BoxShape.rectangle,
                            color: const Color.fromARGB(255, 176, 201, 88),
                          ),
                          child: Icon(
                            Icons.delete_forever,
                            size: 20,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        S.of(context).deleteYourAccount,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.displaySmall
                            ?.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsCard5 extends StatelessWidget {
  const SettingsCard5({
    super.key,
    required this.theme,
    required this.router,
    this.onTap,
  });

  final ThemeData theme;
  final StackRouter router;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final analyticsRepository = GetIt.instance<AbstractAnalyticsRepository>();
    return Container(
      height: MediaQuery.of(context).size.height * 0.18,
      width: MediaQuery.of(context).size.width * 0.95,
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        borderRadius: BorderRadiusDirectional.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 2, left: 10, bottom: 2, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                onTap?.call();
                analyticsRepository.logEvent(
                  name: 'settings_card_click',
                  parameters: {
                    'screen_name': 'settings_screen',
                    'card_name': 'settings_card_5',
                    'item_name': 'account_management',
                  },
                );
                try {
                  router.push(AccountManagementRoute());
                  analyticsRepository.logEvent(
                    name: 'navigate_to',
                    parameters: {
                      'screen_name': 'settings_screen',
                      'destination': 'account_management_screen',
                    },
                  );
                } catch (e) {
                  analyticsRepository.logEvent(
                    name: 'navigation_error',
                    parameters: {
                      'screen_name': 'settings_screen',
                      'destination': 'account_management_screen',
                      'error_message': e.toString(),
                    },
                  );
                }
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(6),
                            shape: BoxShape.rectangle,
                            color: const Color.fromARGB(255, 116, 84, 59),
                          ),
                          child: Icon(
                            Icons.manage_accounts,
                            size: 20,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        S.of(context).accountManagement,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.displaySmall
                            ?.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            CustomDivider(),
            InkWell(
              onTap: () {
                onTap?.call();
                analyticsRepository.logEvent(
                  name: 'settings_card_click',
                  parameters: {
                    'screen_name': 'settings_screen',
                    'card_name': 'settings_card_5',
                    'item_name': 'privacy',
                  },
                );
                try {
                  router.push(PrivacyRoute());
                  analyticsRepository.logEvent(
                    name: 'navigate_to',
                    parameters: {
                      'screen_name': 'settings_screen',
                      'destination': 'privacy_screen',
                    },
                  );
                } catch (e) {
                  analyticsRepository.logEvent(
                    name: 'navigation_error',
                    parameters: {
                      'screen_name': 'settings_screen',
                      'destination': 'privacy_screen',
                      'error_message': e.toString(),
                    },
                  );
                }
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(6),
                            shape: BoxShape.rectangle,
                            color: const Color.fromARGB(255, 63, 84, 131),
                          ),
                          child: Icon(
                            Icons.security,
                            size: 20,
                            color: theme.iconTheme.color,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        S.of(context).privacy,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.displaySmall
                            ?.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            CustomDivider(),
            InkWell(
              onTap: () {
                onTap?.call();
                analyticsRepository.logEvent(
                  name: 'settings_card_click',
                  parameters: {
                    'screen_name': 'settings_screen',
                    'card_name': 'settings_card_5',
                    'item_name': 'language_localization',
                  },
                );
                try {
                  router.push(LanguageLocalizationRoute());
                  analyticsRepository.logEvent(
                    name: 'navigate_to',
                    parameters: {
                      'screen_name': 'settings_screen',
                      'destination': 'language_localization_screen',
                    },
                  );
                } catch (e) {
                  analyticsRepository.logEvent(
                    name: 'navigation_error',
                    parameters: {
                      'screen_name': 'settings_screen',
                      'destination': 'language_localization_screen',
                      'error_message': e.toString(),
                    },
                  );
                }
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(6),
                            shape: BoxShape.rectangle,
                            color: const Color.fromARGB(255, 88, 201, 112),
                          ),
                          child: Icon(
                            Icons.language,
                            size: 20,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        S.of(context).languageLocalization,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.displaySmall
                            ?.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsCard4 extends StatelessWidget {
  const SettingsCard4({
    super.key,
    required this.theme,
    required this.router,
    this.onTap,
  });

  final ThemeData theme;
  final StackRouter router;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final analyticsRepository = GetIt.instance<AbstractAnalyticsRepository>();
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.95,
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        borderRadius: BorderRadiusDirectional.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 2, left: 10, bottom: 2, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                onTap?.call();
                analyticsRepository.logEvent(
                  name: 'settings_card_click',
                  parameters: {
                    'screen_name': 'settings_screen',
                    'card_name': 'settings_card_4',
                    'item_name': 'do_not_disturb_mode',
                  },
                );
                try {
                  router.push(DoNotDisturbModeRoute());
                  analyticsRepository.logEvent(
                    name: 'navigate_to',
                    parameters: {
                      'screen_name': 'settings_screen',
                      'destination': 'do_not_disturb_mode_screen',
                    },
                  );
                } catch (e) {
                  analyticsRepository.logEvent(
                    name: 'navigation_error',
                    parameters: {
                      'screen_name': 'settings_screen',
                      'destination': 'do_not_disturb_mode_screen',
                      'error_message': e.toString(),
                    },
                  );
                }
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(6),
                            shape: BoxShape.rectangle,
                            color: const Color.fromARGB(255, 252, 1, 1),
                          ),
                          child: Icon(
                            Icons.do_not_disturb_on,
                            size: 20,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        S.of(context).doNotDisturbMode,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.displaySmall
                            ?.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsCard3 extends StatelessWidget {
  const SettingsCard3({
    super.key,
    required this.theme,
    required this.router,
    this.onTap,
  });

  final ThemeData theme;
  final StackRouter router;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final analyticsRepository = GetIt.instance<AbstractAnalyticsRepository>();
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      width: MediaQuery.of(context).size.width * 0.95,
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        borderRadius: BorderRadiusDirectional.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 2, left: 10, bottom: 2, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                onTap?.call();
                analyticsRepository.logEvent(
                  name: 'settings_card_click',
                  parameters: {
                    'screen_name': 'settings_screen',
                    'card_name': 'settings_card_3',
                    'item_name': 'calorie_goal',
                  },
                );
                try {
                  router.push(CalorieGoalRoute());
                  analyticsRepository.logEvent(
                    name: 'navigate_to',
                    parameters: {
                      'screen_name': 'settings_screen',
                      'destination': 'calorie_goal_screen',
                    },
                  );
                } catch (e) {
                  analyticsRepository.logEvent(
                    name: 'navigation_error',
                    parameters: {
                      'screen_name': 'settings_screen',
                      'destination': 'calorie_goal_screen',
                      'error_message': e.toString(),
                    },
                  );
                }
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(6),
                            shape: BoxShape.rectangle,
                            color: const Color.fromARGB(255, 181, 1, 252),
                          ),
                          child: Icon(
                            Icons.local_fire_department,
                            size: 20,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        S.of(context).calorieGoal,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.displaySmall
                            ?.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            CustomDivider(),
            InkWell(
              onTap: () {
                onTap?.call();
                analyticsRepository.logEvent(
                  name: 'settings_card_click',
                  parameters: {
                    'screen_name': 'settings_screen',
                    'card_name': 'settings_card_3',
                    'item_name': 'water_balance',
                  },
                );
                try {
                  router.push(WaterBalanceRoute());
                  analyticsRepository.logEvent(
                    name: 'navigate_to',
                    parameters: {
                      'screen_name': 'settings_screen',
                      'destination': 'water_balance_screen',
                    },
                  );
                } catch (e) {
                  analyticsRepository.logEvent(
                    name: 'navigation_error',
                    parameters: {
                      'screen_name': 'settings_screen',
                      'destination': 'water_balance_screen',
                      'error_message': e.toString(),
                    },
                  );
                }
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(6),
                            shape: BoxShape.rectangle,
                            color: const Color.fromARGB(255, 236, 4, 54),
                          ),
                          child: Icon(
                            Icons.water_drop,
                            size: 20,
                            color: theme.iconTheme.color,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        S.of(context).waterBalance,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.displaySmall
                            ?.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsCard2 extends StatelessWidget {
  const SettingsCard2({
    super.key,
    required this.theme,
    required this.router,
    this.onTap,
  });

  final ThemeData theme;
  final StackRouter router;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final analyticsRepository = GetIt.instance<AbstractAnalyticsRepository>();
    return Container(
      height: MediaQuery.of(context).size.height * 0.18,
      width: MediaQuery.of(context).size.width * 0.95,
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        borderRadius: BorderRadiusDirectional.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 2, left: 10, bottom: 2, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                onTap?.call();
                analyticsRepository.logEvent(
                  name: 'settings_card_click',
                  parameters: {
                    'screen_name': 'settings_screen',
                    'card_name': 'settings_card_2',
                    'item_name': 'difficulty_level',
                  },
                );
                try {
                  router.push(DifficultyLevelRoute());
                  analyticsRepository.logEvent(
                    name: 'navigate_to',
                    parameters: {
                      'screen_name': 'settings_screen',
                      'destination': 'difficulty_level_screen',
                    },
                  );
                } catch (e) {
                  analyticsRepository.logEvent(
                    name: 'navigation_error',
                    parameters: {
                      'screen_name': 'settings_screen',
                      'destination': 'difficulty_level_screen',
                      'error_message': e.toString(),
                    },
                  );
                }
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(6),
                            shape: BoxShape.rectangle,
                            color: const Color.fromARGB(255, 252, 114, 1),
                          ),
                          child: Icon(
                            Icons.stairs,
                            size: 20,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        S.of(context).difficultyLevel,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.displaySmall
                            ?.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            CustomDivider(),
            InkWell(
              onTap: () {
                onTap?.call();
                analyticsRepository.logEvent(
                  name: 'settings_card_click',
                  parameters: {
                    'screen_name': 'settings_screen',
                    'card_name': 'settings_card_2',
                    'item_name': 'workout_types',
                  },
                );
                try {
                  router.push(WorkoutTypesRoute());
                  analyticsRepository.logEvent(
                    name: 'navigate_to',
                    parameters: {
                      'screen_name': 'settings_screen',
                      'destination': 'workout_types_screen',
                    },
                  );
                } catch (e) {
                  analyticsRepository.logEvent(
                    name: 'navigation_error',
                    parameters: {
                      'screen_name': 'settings_screen',
                      'destination': 'workout_types_screen',
                      'error_message': e.toString(),
                    },
                  );
                }
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(6),
                            shape: BoxShape.rectangle,
                            color: const Color.fromARGB(255, 4, 77, 236),
                          ),
                          child: Icon(
                            Icons.accessibility_new,
                            size: 20,
                            color: theme.iconTheme.color,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        S.of(context).workoutTypes,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.displaySmall
                            ?.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            CustomDivider(),
            InkWell(
              onTap: () {
                onTap?.call();
                analyticsRepository.logEvent(
                  name: 'settings_card_click',
                  parameters: {
                    'screen_name': 'settings_screen',
                    'card_name': 'settings_card_2',
                    'item_name': 'automatic_activity_tracking',
                  },
                );
                try {
                  router.push(AutomaticActivityTrackingRoute());
                  analyticsRepository.logEvent(
                    name: 'navigate_to',
                    parameters: {
                      'screen_name': 'settings_screen',
                      'destination': 'automatic_activity_tracking_screen',
                    },
                  );
                } catch (e) {
                  analyticsRepository.logEvent(
                    name: 'navigation_error',
                    parameters: {
                      'screen_name': 'settings_screen',
                      'destination': 'automatic_activity_tracking_screen',
                      'error_message': e.toString(),
                    },
                  );
                }
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(6),
                              shape: BoxShape.rectangle,
                              color: const Color.fromARGB(255, 8, 232, 240),
                            ),
                            child: Icon(
                              Icons.directions_run,
                              size: 20,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            S.of(context).automaticActivityTracking,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.displaySmall
                                ?.copyWith(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsCard1 extends StatelessWidget {
  const SettingsCard1({
    super.key,
    required this.theme,
    required this.router,
    this.onTap,
  });

  final ThemeData theme;
  final StackRouter router;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final analyticsRepository = GetIt.instance<AbstractAnalyticsRepository>();
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      width: MediaQuery.of(context).size.width * 0.95,
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        borderRadius: BorderRadiusDirectional.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 2, left: 10, bottom: 2, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                onTap?.call();
                analyticsRepository.logEvent(
                  name: 'settings_card_click',
                  parameters: {
                    'screen_name': 'settings_screen',
                    'card_name': 'settings_card_1',
                    'item_name': 'user_profile',
                  },
                );
                try {
                  router.push(UserProfileRoute());
                  analyticsRepository.logEvent(
                    name: 'navigate_to',
                    parameters: {
                      'screen_name': 'settings_screen',
                      'destination': 'user_profile_screen',
                    },
                  );
                } catch (e) {
                  analyticsRepository.logEvent(
                    name: 'navigation_error',
                    parameters: {
                      'screen_name': 'settings_screen',
                      'destination': 'user_profile_screen',
                      'error_message': e.toString(),
                    },
                  );
                }
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(6),
                            shape: BoxShape.rectangle,
                            color: const Color.fromARGB(255, 233, 236, 4),
                          ),
                          child: Icon(
                            Icons.person_2,
                            size: 20,
                            color: theme.iconTheme.color,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        S.of(context).userProfile,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.displaySmall
                            ?.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            CustomDivider(),
            InkWell(
              onTap: () {
                onTap?.call();
                analyticsRepository.logEvent(
                  name: 'settings_card_click',
                  parameters: {
                    'screen_name': 'settings_screen',
                    'card_name': 'settings_card_1',
                    'item_name': 'fitness_goal',
                  },
                );
                try {
                  router.push(FitnessGoalRoute());
                  analyticsRepository.logEvent(
                    name: 'navigate_to',
                    parameters: {
                      'screen_name': 'settings_screen',
                      'destination': 'fitness_goal_screen',
                    },
                  );
                } catch (e) {
                  analyticsRepository.logEvent(
                    name: 'navigation_error',
                    parameters: {
                      'screen_name': 'settings_screen',
                      'destination': 'fitness_goal_screen',
                      'error_message': e.toString(),
                    },
                  );
                }
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(6),
                            shape: BoxShape.rectangle,
                            color: const Color.fromARGB(255, 33, 243, 103),
                          ),
                          child: Icon(
                            Icons.star_outline_sharp,
                            size: 20,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        S.of(context).fitnessGoal,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.displaySmall
                            ?.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 44),
      child: Divider(
        thickness: 1,
      ),
    );
  }
}
