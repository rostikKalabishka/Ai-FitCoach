import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../ui/ui.dart';
import '../settings_data.dart';

@RoutePage()
class RateUsScreen extends StatelessWidget {
  const RateUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Text(
          'Rate Us',
          style: theme.textTheme.labelMedium,
        ),
        centerTitle: true,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          ...buildSection(theme, text10),
          const Divider(thickness: 0.5),
          ...buildSection(theme, text11),
          const Divider(thickness: 0.5),
          ...buildSection(theme, text12),
          const Divider(thickness: 0.5),
          ...buildSection(theme, text13),
          const Divider(thickness: 0.5),
          ...buildSection(theme, text14),
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


