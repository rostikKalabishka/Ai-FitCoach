import 'package:ai_fit_coach/router/router.dart';
import 'package:ai_fit_coach/ui/widgets/custom_calendar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);
    final themeDark = Theme.of(context);
    return Scaffold(
      backgroundColor: themeDark.scaffoldBackgroundColor,
      body: ListView(children: [
        Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Settings',
                  style: themeDark.textTheme.labelMedium,
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
                            'Welcome user!',
                            style: themeDark.textTheme.labelSmall,
                          ),
                          Text('AI FitCoach account',
                              style: themeDark.textTheme.headlineSmall),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.local_fire_department, size: 35,),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '0 Days Streak',
                              style: themeDark.textTheme.headlineMedium,
                            ),
                            Text(
                              'Personal Best: 0',
                              style: themeDark.textTheme.headlineSmall,
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
                CustomCalendar(),
                Container(
                  height: 120,
                  width: 400,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 29, 29, 29),
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
                                  color: themeDark.iconTheme.color,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'User Profile',
                                style: themeDark.textTheme.headlineLarge,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.black,
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
                                'Fitness Goal',
                                style: themeDark.textTheme.headlineLarge,
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
                      color: const Color.fromARGB(255, 29, 29, 29),
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
                                'Difficulty Level',
                                style: themeDark.textTheme.headlineLarge,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.black,
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
                                  color: themeDark.iconTheme.color,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Workout Types',
                                style: themeDark.textTheme.headlineLarge,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.black,
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
                                'Automatic Activity Tracking',
                                style: themeDark.textTheme.headlineLarge,
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
                      color: const Color.fromARGB(255, 29, 29, 29),
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
                                'Calorie Goal',
                                style: themeDark.textTheme.headlineLarge,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.black,
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
                                  color: themeDark.iconTheme.color,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Water Balance',
                                style: themeDark.textTheme.headlineLarge,
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
                      color: const Color.fromARGB(255, 29, 29, 29),
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
                                'Do Not Disturb Mode',
                                style: themeDark.textTheme.headlineLarge,
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
                      color: const Color.fromARGB(255, 29, 29, 29),
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
                                'Account Management',
                                style: themeDark.textTheme.headlineLarge,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.black,
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
                                  color: themeDark.iconTheme.color,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Privacy',
                                style: themeDark.textTheme.headlineLarge,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.black,
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
                                'Language & Localization',
                                style: themeDark.textTheme.headlineLarge,
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
                      color: const Color.fromARGB(255, 29, 29, 29),
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
                                'Privacy Policy',
                                style: themeDark.textTheme.headlineLarge,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.black,
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
                                  color: themeDark.iconTheme.color,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Rate Us',
                                style: themeDark.textTheme.headlineLarge,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.black,
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
                                'Delete Your Account',
                                style: themeDark.textTheme.headlineLarge,
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
          height: 40,
        ),
      ]),
    );
  }
}
