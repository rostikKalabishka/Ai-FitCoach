import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:ai_fit_coach/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SettingsCard6 extends StatelessWidget {
  const SettingsCard6({
    super.key,
    required this.theme,
    required this.router,
  });

  final ThemeData theme;
  final StackRouter router;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.18,
      width: MediaQuery.of(context).size.width * 0.95,
      decoration: BoxDecoration(
          color: theme.cardTheme.color,
          borderRadius: BorderRadiusDirectional.circular(16)),
      child: Padding(
        padding: const EdgeInsets.only(top: 2, left: 10, bottom: 2, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                router.push(PrivacyPolicyRoute());
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
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
                            )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        S.of(context).privacyPolicy,
                        maxLines: 2, 
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
                  )
                ],
              ),
            ),
            CustomDivider(),
            InkWell(
              onTap: () {
                router.push(RateUsRoute());
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
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        S.of(context).rateUs,
                        maxLines: 2, 
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
                  )
                ],
              ),
            ),
            CustomDivider(),
            InkWell(
              onTap: () {
                router.push(DeleteYourAccountRoute());
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
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        S.of(context).deleteYourAccount,
                        maxLines: 2, 
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
                  )
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
  });

  final ThemeData theme;
  final StackRouter router;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.18,
      width: MediaQuery.of(context).size.width * 0.95,
      decoration: BoxDecoration(
          color: theme.cardTheme.color,
          borderRadius: BorderRadiusDirectional.circular(16)),
      child: Padding(
        padding: const EdgeInsets.only(top: 2, left: 10, bottom: 2, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                router.push(AccountManagementRoute());
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
                            )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        S.of(context).accountManagement,
                        maxLines: 2, 
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
                  )
                ],
              ),
            ),
            CustomDivider(),
            InkWell(
              onTap: () {
                router.push(PrivacyRoute());
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
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        S.of(context).privacy,
                        maxLines: 2, 
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
                  )
                ],
              ),
            ),
            CustomDivider(),
            InkWell(
              onTap: () {
                router.push(LanguageLocalizationRoute());
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
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        S.of(context).languageLocalization,
                        maxLines: 2, 
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
                  )
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
  });

  final ThemeData theme;
  final StackRouter router;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.95,
      decoration: BoxDecoration(
          color: theme.cardTheme.color,
          borderRadius: BorderRadiusDirectional.circular(16)),
      child: Padding(
        padding: const EdgeInsets.only(top: 2, left: 10, bottom: 2, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                router.push(DoNotDisturbModeRoute());
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
                            )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        S.of(context).doNotDisturbMode,
                        maxLines: 2, 
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
                  )
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
  });

  final ThemeData theme;
  final StackRouter router;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      width: MediaQuery.of(context).size.width * 0.95,
      decoration: BoxDecoration(
          color: theme.cardTheme.color,
          borderRadius: BorderRadiusDirectional.circular(16)),
      child: Padding(
        padding: const EdgeInsets.only(top: 2, left: 10, bottom: 2, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                router.push(CalorieGoalRoute());
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
                            )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        S.of(context).calorieGoal,
                        maxLines: 2, 
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
                  )
                ],
              ),
            ),
            CustomDivider(),
            InkWell(
              onTap: () {
                router.push(WaterBalanceRoute());
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
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        S.of(context).waterBalance,
                        maxLines: 2, 
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
                  )
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
  });

  final ThemeData theme;
  final StackRouter router;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.18,
      width: MediaQuery.of(context).size.width * 0.95,
      decoration: BoxDecoration(
          color: theme.cardTheme.color,
          borderRadius: BorderRadiusDirectional.circular(16)),
      child: Padding(
        padding: const EdgeInsets.only(top: 2, left: 10, bottom: 2, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                router.push(DifficultyLevelRoute());
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
                            )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        S.of(context).difficultyLevel,
                        maxLines: 2, 
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
                  )
                ],
              ),
            ),
            CustomDivider(),
            InkWell(
              onTap: () {
                router.push(WorkoutTypesRoute());
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
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        S.of(context).workoutTypes,
                        maxLines: 2, 
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
                  )
                ],
              ),
            ),
            CustomDivider(),
            InkWell(
              onTap: () {
                router.push(AutomaticActivityTrackingRoute());
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
                            color: const Color.fromARGB(255, 8, 232, 240),
                          ),
                          child: Icon(
                            Icons.directions_run,
                            size: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        S.of(context).automaticActivityTracking,
                        maxLines: 2, 
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
                  )
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
  });

  final ThemeData theme;
  final StackRouter router;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      width: MediaQuery.of(context).size.width * 0.95,
      decoration: BoxDecoration(
          color: theme.cardTheme.color,
          borderRadius: BorderRadiusDirectional.circular(16)),
      child: Padding(
        padding: const EdgeInsets.only(top: 2, left: 10, bottom: 2, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                router.push(UserProfileRoute());
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
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        S.of(context).userProfile,
                        maxLines: 2, 
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
                  )
                ],
              ),
            ),
            CustomDivider(),
            InkWell(
              onTap: () {
                router.push(FitnessGoalRoute());
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
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        S.of(context).fitnessGoal,
                        maxLines: 2, 
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
                  )
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
  const CustomDivider({
    super.key,
  });

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
