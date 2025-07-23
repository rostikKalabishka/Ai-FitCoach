import 'package:ai_fit_coach/blocs/health_bloc/health_bloc.dart';
import 'package:ai_fit_coach/blocs/user_bloc/user_bloc.dart';
import 'package:ai_fit_coach/features/auth/bloc/auth_bloc.dart';
import 'package:ai_fit_coach/features/loader/bloc/authentication_bloc.dart';

import 'package:ai_fit_coach/features/settings/settings_screen/settings_card_widgets.dart';

import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:ai_fit_coach/router/router.dart';
import 'package:ai_fit_coach/ui/widgets/custom_calendar.dart';
import 'package:ai_fit_coach/ui/widgets/step_score.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(
        GetUser(userId: context.read<AuthenticationBloc>().state.user!.id));
  }

  final int stepsCountNormal = 10000;

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
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 20, left: 15, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BlocBuilder<UserBloc, UserState>(builder:
                                (BuildContext context, UserState state) {
                              return Text(
                                S
                                    .of(context)
                                    .welcomeUser(state.userModel.username),
                                style: theme.textTheme.labelSmall,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                // softWrap: false,
                              );
                            }),
                            Text(S.of(context).appNameAccount('AI FitCoach'),
                                style: theme.textTheme.headlineSmall),
                          ],
                        ),
                      ),
                    ),
                    // Row(
                    //   children: [
                    //     Icon(
                    //       Icons.local_fire_department,
                    //       size: 35,
                    //       color: theme.colorScheme.secondary,
                    //     ),
                    //     SizedBox(
                    //       width: 10,
                    //     ),
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text(
                    //           S.of(context).numberDaysStreak(0),
                    //           style: theme.textTheme.headlineMedium,
                    //         ),
                    //         Text(
                    //           S.of(context).personalBestNumber(0),
                    //           style: theme.textTheme.headlineSmall,
                    //         ),
                    //       ],
                    //     ),
                    //     SizedBox(
                    //       width: 10,
                    //     ),
                    //   ],
                    // )
                  ],
                ),
                CustomCalendar(),
                BlocBuilder<HealthBloc, HealthState>(builder: (context, state) {
                  if (state is HealthLoaded) {
                    final percent = state.steps / stepsCountNormal;
                    final stepColor = getStepColor(state.steps);
                    return Padding(
                      padding: EdgeInsetsGeometry.symmetric(
                          horizontal: 10, vertical: 8),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.95,
                        decoration: BoxDecoration(
                            color: theme.cardTheme.color,
                            borderRadius: BorderRadiusDirectional.circular(16)),
                        padding: const EdgeInsets.only(
                            top: 5, left: 20, bottom: 5, right: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('Walking',
                                    style: theme.textTheme.displaySmall
                                        ?.copyWith(fontSize: 20)),
                                Text('${state.steps} / $stepsCountNormal steps',
                                    style: theme.textTheme.displaySmall
                                        ?.copyWith(fontSize: 16))
                              ],
                            ),
                            SizedBox(
                              height: 70,
                              width: 70,
                              child: StepScore(
                                percent: percent,
                                fillColors: Colors.grey,
                                lineColor: stepColor,
                                freeColor: stepColor.withValues(alpha: 0.3),
                                lineWidth: 3,
                                child: Text(
                                    '${(percent * 100).toStringAsFixed(0)}%',
                                    style: theme.textTheme.displaySmall
                                        ?.copyWith(fontSize: 16)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                }),
                SizedBox(
                  height: 20,
                ),
                SettingsCard1(theme: theme, router: router),
                SizedBox(
                  height: 20,
                ),
                SettingsCard2(theme: theme, router: router),
                SizedBox(
                  height: 20,
                ),
                SettingsCard3(theme: theme, router: router),
                SizedBox(
                  height: 20,
                ),
                SettingsCard4(theme: theme, router: router),
                SizedBox(
                  height: 20,
                ),
                SettingsCard5(theme: theme, router: router),
                SizedBox(
                  height: 20,
                ),
                SettingsCard6(theme: theme, router: router),
              ],
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        BlocListener<AuthBloc, AuthState>(
          listener: (BuildContext context, AuthState state) {
            if (state is AuthSuccess) {
              AutoRouter.of(context).pushAndPopUntil(
                  LoaderRoute(isDefaultMethod: false),
                  predicate: (route) => false);
            }
          },
          child: TextButton(
              onPressed: () async {
                context.read<AuthBloc>().add(SignOutEvent());
              },
              child: Text(
                S.of(context).logOut,
                style: theme.textTheme.displaySmall
                    ?.copyWith(fontSize: 18, color: theme.colorScheme.primary),
              )),
        ),
        SizedBox(
          height: 20,
        ),
      ]),
    );
  }
}

Color getStepColor(int steps) {
  if (steps < 3000) {
    return Colors.red;
  } else if (steps < 5000) {
    return Colors.orange;
  } else if (steps < 8000) {
    return Colors.amber;
  } else if (steps < 10000) {
    return Colors.green;
  } else {
    return Colors.lightGreenAccent;
  }
}
