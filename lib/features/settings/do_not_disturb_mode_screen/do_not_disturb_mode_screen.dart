import 'package:ai_fit_coach/blocs/settings_cubit/settings_cubit.dart';
import 'package:ai_fit_coach/generated/l10n.dart';
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
  bool isMuted = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: theme.appBarTheme.backgroundColor,
            title: Text(S.of(context).doNotDisturbMode,
                style: theme.textTheme.labelMedium),
            centerTitle: true,
          ),
          backgroundColor: theme.scaffoldBackgroundColor,
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  CustomDoNotDisturbModeCard(
                    icon: Icons.wb_sunny,
                    label: S.of(context).switchThemeMode,
                    value: state.isDark,
                    onChanged: (value) {
                      final brightness =
                          value ? Brightness.dark : Brightness.light;
                      context
                          .read<SettingsCubit>()
                          .setThemeBrightness(brightness);
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomDoNotDisturbModeCard(
                    icon: Icons.notifications_off,
                    label: S.of(context).muteNotifications,
                    value: isMuted,
                    onChanged: (value) {
                      setState(() {
                        isMuted = value;
                      });
                    },
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
                  label: S.of(context).cancel,
                  onPressed: () => Navigator.pop(context),
                ),
                CustomConfirmCancelButton(
                  label: S.of(context).confirm,
                  onPressed: () {
                    print('Mute Notifications: $isMuted');
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
