import 'package:ai_fit_coach/blocs/settings_cubit/settings_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../ui/ui.dart';

@RoutePage()
class DoNotDisturbModeScreen extends StatefulWidget {
  const DoNotDisturbModeScreen({super.key});

  @override
  State<DoNotDisturbModeScreen> createState() => _DoNotDisturbModeScreenState();
}

class _DoNotDisturbModeScreenState extends State<DoNotDisturbModeScreen> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        final isDarkTheme = context.watch<SettingsCubit>().state.isDark;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: theme.appBarTheme.backgroundColor,
            title: Text('Do Not Disturb Mode',
                style: theme.textTheme.labelMedium),
            centerTitle: true,
          ),
          backgroundColor: theme.scaffoldBackgroundColor,
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 60,
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.wb_sunny),
                                SizedBox(width: 10),
                                Text(
                                  'Switch theme mode',
                                  style: theme.textTheme.headlineLarge,
                                ),
                              ],
                            ),
                            Switch.adaptive(
                              value: isDarkTheme,
                              onChanged: (bool value) {
                                final brightness =
                                    value ? Brightness.dark : Brightness.light;
                                context
                                    .read<SettingsCubit>()
                                    .setThemeBrightness(brightness);
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 60,
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.notifications_off),
                                SizedBox(width: 10),
                                Text(
                                  'Mute Notifications',
                                  style: theme.textTheme.headlineLarge,
                                ),
                              ],
                            ),
                            Switch.adaptive(
                              value: isSwitched,
                              onChanged: (bool value) {
                                setState(() {
                                  isSwitched = value;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomConfirmCancelButton(
              label: 'Cancel',
              onPressed: () => Navigator.pop(context),
            ),
            CustomConfirmCancelButton(
              label: 'Confirm',
              onPressed: () {
              },
            ),
          ],
        ),
      ),
        );
      },
    );
  }
}
