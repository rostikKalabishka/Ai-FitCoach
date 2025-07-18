import 'package:ai_fit_coach/generated/l10n.dart';
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
          S.of(context).privacyPolicy,
          style: theme.textTheme.labelMedium,
        ),
        centerTitle: true,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          ...SettingsData.buildSection(context, theme, 'privacyPolicy'),
          const Divider(thickness: 0.5),
          ...SettingsData.buildSection(context, theme, 'informationWeCollect'),
          const Divider(thickness: 0.5),
          ...SettingsData.buildSection(context, theme, 'howWeUseInfo'),
          const Divider(thickness: 0.5),
          ...SettingsData.buildSection(context, theme, 'sharingInfo'),
          const Divider(thickness: 0.5),
          ...SettingsData.buildSection(context, theme, 'thirdPartyServices'),
          const Divider(thickness: 0.5),
          ...SettingsData.buildSection(context, theme, 'dataSecurity'),
          const Divider(thickness: 0.5),
          ...SettingsData.buildSection(context, theme, 'yourRights'),
          const Divider(thickness: 0.5),
          ...SettingsData.buildSection(context, theme, 'childrenPrivacy'),
          const Divider(thickness: 0.5),
          ...SettingsData.buildSection(context, theme, 'changesToPolicy'),
          const Divider(thickness: 0.5),
          ...SettingsData.buildSection(context, theme, 'contactUs'),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
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
