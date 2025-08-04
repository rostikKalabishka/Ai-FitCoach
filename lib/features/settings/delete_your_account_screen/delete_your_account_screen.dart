import 'package:ai_fit_coach/blocs/user_bloc/user_bloc.dart';
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:ai_fit_coach/router/router.dart';
import 'package:ai_fit_coach/ui/widgets/custom_confirm_cancel_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:auto_route/annotations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../settings_data.dart';

@RoutePage()
class DeleteYourAccountScreen extends StatelessWidget {
  const DeleteYourAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state.userStatus == UserStatus.delete) {
          AutoRouter.of(context)
              .pushAndPopUntil(WelcomeRoute(), predicate: (_) => false);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.appBarTheme.backgroundColor,
          title: Text(
            S.of(context).deleteYourAccount,
            style: theme.textTheme.labelMedium,
          ),
          centerTitle: true,
        ),
        backgroundColor: theme.scaffoldBackgroundColor,
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          children: [
            ...SettingsData.buildSection(context, theme, 'deleteAccount'),
            const Divider(thickness: 0.5),
            ...SettingsData.buildSection(context, theme, 'deleteAccountHowTo'),
            const Divider(thickness: 0.5),
            ...SettingsData.buildSection(
                context, theme, 'deleteAccountWhatHappens'),
            const Divider(thickness: 0.5),
            ...SettingsData.buildSection(
                context, theme, 'deleteAccountRetention'),
            const Divider(thickness: 0.5),
            ...SettingsData.buildSection(context, theme, 'deleteAccountHelp'),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomConfirmCancelButton(
                label: S.of(context).cancel,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              CustomConfirmCancelButton(
                label: S.of(context).confirm,
                onPressed: () {
                  context.read<UserBloc>().add(DeleteUserAccount());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
