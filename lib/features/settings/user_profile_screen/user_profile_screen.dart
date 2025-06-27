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
        title: Text('User Profile', style: theme.textTheme.labelMedium),
        centerTitle: true,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CustomUserDataField(hint: 'Name', icon: Icons.account_circle),
            const SizedBox(height: 20),
            const CustomUserDataField(hint: 'Age', icon: Icons.calendar_today),
            const SizedBox(height: 20),
            const CustomUserDataField(hint: 'Height', icon: Icons.straighten),
            const SizedBox(height: 20),
            const CustomUserDataField(hint: 'Weight', icon: Icons.monitor_weight),
            const SizedBox(height: 20),
            CustomUserDataDialog(
              hint: 'Gender',
              icon: Icons.wc,
              dialogTitle: 'Please select your gender',
              options: const [
                DialogOption(label: 'Male', icon: Icons.male),
                DialogOption(label: 'Female', icon: Icons.female),
                DialogOption(label: 'Other', icon: Icons.person),
              ],
            ),
            const SizedBox(height: 20),
            CustomUserDataDialog(
              hint: 'Activity Level',
              icon: Icons.directions_run,
              dialogTitle: 'Please select your activity level',
              options: const [
                DialogOption(label: 'Sedentary', icon: Icons.chair),
                DialogOption(label: 'Lightly Active', icon: Icons.directions_walk),
                DialogOption(label: 'Moderately Active', icon: Icons.directions_run),
                DialogOption(label: 'Very Active', icon: Icons.sports_gymnastics),
                DialogOption(label: 'Extremely Active', icon: Icons.military_tech),
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
  }
}

