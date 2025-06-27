import 'package:ai_fit_coach/ui/widgets/custom_confirm_cancel_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:auto_route/annotations.dart';

import '../settings_data.dart';

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
          ...buildSection(theme, text15),
          const Divider(thickness: 0.5),
          ...buildSection(theme, text16),
          const Divider(thickness: 0.5),
          ...buildSection(theme, text17),
          const Divider(thickness: 0.5),
          ...buildSection(theme, text18),
          const Divider(thickness: 0.5),
          ...buildSection(theme, text19),
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
}
