import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:ai_fit_coach/ui/widgets/custom_confirm_cancel_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../ui/ui.dart';
import '../../../ui/widgets/custom_user_data_dialog.dart';

@RoutePage()
class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        title:
            Text(S.of(context).userProfile, style: theme.textTheme.labelMedium),
        centerTitle: true,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomUserDataField(
                hint: S.of(context).name, icon: Icons.account_circle),
            SizedBox(height: 20),
            CustomUserDataField(
                hint: S.of(context).age, icon: Icons.calendar_today),
            SizedBox(height: 20),
            CustomUserDataField(
                hint: S.of(context).height, icon: Icons.straighten),
            SizedBox(height: 20),
            CustomUserDataField(
                hint: S.of(context).weight, icon: Icons.monitor_weight),
            SizedBox(height: 20),
            CustomUserDataDialog(
              hint: S.of(context).gender,
              icon: Icons.wc,
              dialogTitle: S.of(context).pleaseSelectYourGender,
              options: [
                DialogOption(label: S.of(context).male, icon: Icons.male),
                DialogOption(label: S.of(context).female, icon: Icons.female),
                DialogOption(label: S.of(context).other, icon: Icons.person),
              ],
            ),
            const SizedBox(height: 20),
            CustomUserDataDialog(
              hint: S.of(context).activityLevel,
              icon: Icons.directions_run,
              dialogTitle: S.of(context).pleaseSelectYourActivityLevel,
              options: [
                DialogOption(label: S.of(context).sedentary, icon: Icons.chair),
                DialogOption(
                    label: S.of(context).lightlyActive,
                    icon: Icons.directions_walk),
                DialogOption(
                    label: S.of(context).moderatelyActive,
                    icon: Icons.directions_run),
                DialogOption(
                    label: S.of(context).veryActive,
                    icon: Icons.sports_gymnastics),
                DialogOption(
                    label: S.of(context).extremelyActive,
                    icon: Icons.military_tech),
              ],
            ),
          ],
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
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
