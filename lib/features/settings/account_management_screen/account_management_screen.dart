import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:ai_fit_coach/ui/widgets/custom_confirm_cancel_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../ui/ui.dart';

@RoutePage()
class AccountManagementScreen extends StatelessWidget {
  const AccountManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Text(S.of(context).accountManagement,
            style: theme.textTheme.labelMedium),
        centerTitle: true,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        child: Column(
          children: [
            CustomAccountDataField(
                hint: S.of(context).email, icon: Icons.email),
            SizedBox(height: 20),
            CustomAccountDataField(
              hint: S.of(context).reservedEmail,
              icon: FontAwesomeIcons.envelopeCircleCheck,
              iconSize: 21,
            ),
            SizedBox(height: 20),
            CustomAccountDataField(
              hint: 'Google',
              icon: FontAwesomeIcons.google,
              iconSize: 21,
            ),
            SizedBox(height: 20),
            CustomAccountDataField(
              hint: 'Facebook',
              icon: FontAwesomeIcons.facebook,
              iconSize: 21,
            ),
            SizedBox(height: 20),
            CustomAccountDataField(
              hint: 'Twitter',
              icon: FontAwesomeIcons.twitter,
              iconSize: 21,
            ),
          ],
        ),
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
