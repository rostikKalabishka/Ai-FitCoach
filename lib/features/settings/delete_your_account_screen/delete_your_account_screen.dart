import 'package:ai_fit_coach/ui/widgets/custom_confirm_cancel_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:auto_route/annotations.dart';

@RoutePage()
class DeleteYourAccountScreen extends StatelessWidget {
   const DeleteYourAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Text(
          'Delete Your Account',
          style: theme.textTheme.labelMedium,
        ),
        centerTitle: true,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          ..._buildSection(theme, text15),
          const Divider(thickness: 0.5),
          ..._buildSection(theme, text16),
          const Divider(thickness: 0.5),
          ..._buildSection(theme, text17),
          const Divider(thickness: 0.5),
          ..._buildSection(theme, text18),
          const Divider(thickness: 0.5),
          ..._buildSection(theme, text19),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomConfirmCancelButton(
              label: 'Cancel',
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CustomConfirmCancelButton(
              label: 'Confirm',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSection(ThemeData theme, List<String> texts) {
    return [
      const SizedBox(height: 16),
      ...texts.map(
        (text) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Text(
            text,
            style: theme.textTheme.headlineMedium,
          ),
        ),
      ),
      const SizedBox(height: 16),
    ];
  }
}

List<String> text15 = [
  'We respect your right to control your personal data. If you wish to delete your account, we provide an easy way to request full removal of your information.',
];

List<String> text16 = [
  '1. How to Delete Your Account',
  'You can request to delete your account by:',
  'Using the “Delete Account” option in the app (if available), or',
  'Contacting us directly at [Your Contact Email] with the subject line “Account Deletion Request”',
];

List<String> text17 = [
  '2. What Happens When You Delete Your Account',
  'Once we receive your request:',
  'We will permanently delete your account and associated personal data from our systems (unless retention is required by law).',
  'Your app usage history, preferences, and any stored data will be removed and cannot be restored.',
  'Some anonymized or aggregated data may be retained for internal analysis and legal purposes, but it cannot be linked back to you.',
];

List<String> text18 = [
  '3. Data Retention Exceptions',
  'We may retain certain information if:',
  'Required by law or legal obligations (e.g., fraud prevention, accounting)',
  'Necessary for resolving disputes or enforcing our policies',
  'In such cases, we ensure the data is kept securely and only for as long as needed.',
];

List<String> text19 = [
  '4. Need Help?',
  'If you have questions or need help with account deletion, please contact us at:',
  'Email: [Your Contact Email]',
];
