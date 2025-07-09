import 'package:ai_fit_coach/blocs/health/health_bloc.dart';
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:ai_fit_coach/router/router.dart';
import 'package:ai_fit_coach/ui/widgets/custom_calendar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/user_repository/user.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: ListView(children: [
        Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  S.of(context).settings,
                  style: theme.textTheme.labelMedium,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 15, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).welcomeUser("User"),
                            style: theme.textTheme.labelSmall,
                          ),
                          Text(S.of(context).appNameAccount('AI FitCoach'),
                              style: theme.textTheme.headlineSmall),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.local_fire_department,
                          size: 35,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).numberDaysStreak(0),
                              style: theme.textTheme.headlineMedium,
                            ),
                            Text(
                              S.of(context).personalBestNumber(0),
                              style: theme.textTheme.headlineSmall,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    )
                  ],
                ),
                CustomCalendar(),
                Container(
                  height: 120,
                  width: 400,
                  decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadiusDirectional.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 5, left: 10, bottom: 5, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            router.push(UserProfileRoute());
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color.fromARGB(255, 233, 236, 4),
                                ),
                                child: Icon(
                                  Icons.person_2,
                                  size: 20,
                                  color: theme.iconTheme.color,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                S.of(context).userProfile,
                                style: theme.textTheme.displaySmall
                                    ?.copyWith(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        InkWell(
                          onTap: () {
                            router.push(FitnessGoalRoute());
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      const Color.fromARGB(255, 33, 243, 103),
                                ),
                                child: Icon(
                                  Icons.star_outline_sharp,
                                  size: 20,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                S.of(context).fitnessGoal,
                                style: theme.textTheme.displaySmall
                                    ?.copyWith(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 180,
                  width: 400,
                  decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadiusDirectional.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 5, left: 10, bottom: 5, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            router.push(DifficultyLevelRoute());
                          },
                          child: Row(
                            children: [
                              Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        const Color.fromARGB(255, 252, 114, 1),
                                  ),
                                  child: Icon(
                                    Icons.stairs,
                                    size: 20,
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                S.of(context).difficultyLevel,
                                style: theme.textTheme.displaySmall
                                    ?.copyWith(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        InkWell(
                          onTap: () {
                            router.push(WorkoutTypesRoute());
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color.fromARGB(255, 4, 77, 236),
                                ),
                                child: Icon(
                                  Icons.accessibility_new,
                                  size: 20,
                                  color: theme.iconTheme.color,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                S.of(context).workoutTypes,
                                style: theme.textTheme.displaySmall
                                    ?.copyWith(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        InkWell(
                          onTap: () {
                            router.push(AutomaticActivityTrackingRoute());
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color.fromARGB(255, 8, 232, 240),
                                ),
                                child: Icon(
                                  Icons.directions_run,
                                  size: 20,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                S.of(context).automaticActivityTracking,
                                style: theme.textTheme.displaySmall
                                    ?.copyWith(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 120,
                  width: 400,
                  decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadiusDirectional.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 5, left: 10, bottom: 5, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            router.push(CalorieGoalRoute());
                          },
                          child: Row(
                            children: [
                              Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        const Color.fromARGB(255, 181, 1, 252),
                                  ),
                                  child: Icon(
                                    Icons.local_fire_department,
                                    size: 20,
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                S.of(context).calorieGoal,
                                style: theme.textTheme.displaySmall
                                    ?.copyWith(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        InkWell(
                          onTap: () {
                            router.push(WaterBalanceRoute());
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color.fromARGB(255, 236, 4, 54),
                                ),
                                child: Icon(
                                  Icons.water_drop,
                                  size: 20,
                                  color: theme.iconTheme.color,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                S.of(context).waterBalance,
                                style: theme.textTheme.displaySmall
                                    ?.copyWith(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 60,
                  width: 400,
                  decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadiusDirectional.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 5, left: 10, bottom: 5, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            router.push(DoNotDisturbModeRoute());
                          },
                          child: Row(
                            children: [
                              Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: const Color.fromARGB(255, 252, 1, 1),
                                  ),
                                  child: Icon(
                                    Icons.do_not_disturb_on,
                                    size: 20,
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                S.of(context).doNotDisturbMode,
                                style: theme.textTheme.displaySmall
                                    ?.copyWith(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 180,
                  width: 400,
                  decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadiusDirectional.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 5, left: 10, bottom: 5, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            router.push(AccountManagementRoute());
                          },
                          child: Row(
                            children: [
                              Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        const Color.fromARGB(255, 116, 84, 59),
                                  ),
                                  child: Icon(
                                    Icons.manage_accounts,
                                    size: 20,
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                S.of(context).accountManagement,
                                style: theme.textTheme.displaySmall
                                    ?.copyWith(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        InkWell(
                          onTap: () {
                            router.push(PrivacyRoute());
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color.fromARGB(255, 63, 84, 131),
                                ),
                                child: Icon(
                                  Icons.security,
                                  size: 20,
                                  color: theme.iconTheme.color,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                S.of(context).privacy,
                                style: theme.textTheme.displaySmall
                                    ?.copyWith(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        InkWell(
                          onTap: () {
                            router.push(LanguageLocalizationRoute());
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      const Color.fromARGB(255, 88, 201, 112),
                                ),
                                child: Icon(
                                  Icons.language,
                                  size: 20,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                S.of(context).languageLocalization,
                                style: theme.textTheme.displaySmall
                                    ?.copyWith(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 180,
                  width: 400,
                  decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadiusDirectional.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 5, left: 10, bottom: 5, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            router.push(PrivacyPolicyRoute());
                          },
                          child: Row(
                            children: [
                              Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: const Color.fromARGB(255, 92, 40, 1),
                                  ),
                                  child: Icon(
                                    Icons.privacy_tip,
                                    size: 20,
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                S.of(context).privacyPolicy,
                                style: theme.textTheme.displaySmall
                                    ?.copyWith(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        InkWell(
                          onTap: () {
                            router.push(RateUsRoute());
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      const Color.fromARGB(255, 206, 101, 101),
                                ),
                                child: Icon(
                                  Icons.thumb_up,
                                  size: 20,
                                  color: theme.iconTheme.color,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                S.of(context).rateUs,
                                style: theme.textTheme.displaySmall
                                    ?.copyWith(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        InkWell(
                          onTap: () {
                            router.push(DeleteYourAccountRoute());
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      const Color.fromARGB(255, 176, 201, 88),
                                ),
                                child: Icon(
                                  Icons.delete_forever,
                                  size: 20,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                S.of(context).deleteYourAccount,
                                style: theme.textTheme.displaySmall
                                    ?.copyWith(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        BlocBuilder<HealthBloc, HealthState>(builder: (context, state) {
          if (state is HealthLoaded) {
            return Text(state.steps.toString());
          } else {
            return SizedBox.shrink();
          }
        }),
        TextButton(
            onPressed: () async {
              await UserRepository().logOut();
            },
            child: Text(
              S.of(context).logOut,
              style: theme.textTheme.displaySmall?.copyWith(
                  fontSize: 18, color: const Color.fromARGB(255, 109, 7, 0)),
            )),
        SizedBox(
          height: 20,
        ),
      ]),
    );
  }
}
