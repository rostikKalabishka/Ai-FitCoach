import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../ui/ui.dart';
import '../settings_data.dart';

@RoutePage()
class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Text(
          'Privacy Policy',
          style: theme.textTheme.labelMedium,
        ),
        centerTitle: true,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          ...buildSection(theme, text1),
          const Divider(thickness: 0.5),
          ...buildSection(theme, text2),
          const Divider(thickness: 0.5),
          ...buildSection(theme, text3),
          const Divider(thickness: 0.5),
          ...buildSection(theme, text4),
          const Divider(thickness: 0.5),
          ...buildSection(theme, text5),
          const Divider(thickness: 0.5),
          ...buildSection(theme, text6),
          const Divider(thickness: 0.5),
          ...buildSection(theme, text7),
          const Divider(thickness: 0.5),
          ...buildSection(theme, text8),
          const Divider(thickness: 0.5),
          ...buildSection(theme, text9),
        ],
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


