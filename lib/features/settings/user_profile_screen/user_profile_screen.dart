import 'package:ai_fit_coach/blocs/user_bloc/user_bloc.dart';
import 'package:ai_fit_coach/features/loader/bloc/authentication_bloc.dart';
import 'package:ai_fit_coach/generated/l10n.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../ui/ui.dart';

@RoutePage()
class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  void initState() {
    super.initState();
    final userId = context.read<AuthenticationBloc>().state.user!.id;
    context.read<UserBloc>().add(GetUser(userId: userId));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return PopScope(
            canPop: !state.hasChanges,
            onPopInvokedWithResult: (didPop, result) async {
              if (didPop) return;
              if (state.hasChanges) {
                final shouldPop = await showDialog<bool>(
                  context: context,
                  builder: (context) => ConfirmationDialog(
                    title: S.of(context).unsavedChanges,
                    content: Text(S
                        .of(context)
                        .youHaveUnsavedChangesDoYouReallyWantToDiscard),
                    cancelText: S.of(context).cancel,
                    confirmText: S.of(context).discard,
                    onConfirm: () => Navigator.of(context).pop(true),
                  ),
                );
                if (shouldPop == true && context.mounted) {
                  context.router.pop();
                }
              }
            },
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: theme.appBarTheme.backgroundColor,
                title: Text(
                  S.of(context).userProfile,
                  style: theme.textTheme.labelMedium,
                ),
                centerTitle: true,
              ),
              backgroundColor: theme.scaffoldBackgroundColor,
              body: state.userStatus == UserStatus.loading
                  ? const Center(child: CircularProgressIndicator())
                  : state.userStatus == UserStatus.error
                      ? Center(
                          child: Text(
                            'error loading',
                            style: theme.textTheme.bodyMedium,
                          ),
                        )
                      : SingleChildScrollView(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              CustomUserDataField(
                                hint: S.of(context).name,
                                icon: Icons.account_circle,
                                initialValue: state.userModel.username,
                                onChanged: (value) {
                                  context.read<UserBloc>().add(UpdateUserField(
                                        userModel: state.userModel.copyWith(
                                          username: value,
                                        ),
                                      ));
                                },
                              ),
                              const SizedBox(height: 20),
                              CustomUserDataField(
                                keyboardType: TextInputType.number,
                                hint: S.of(context).age,
                                icon: Icons.calendar_today,
                                initialValue:
                                    state.userModel.userData.age.toString(),
                                onChanged: (value) {
                                  context.read<UserBloc>().add(UpdateUserField(
                                        userModel: state.userModel.copyWith(
                                          userData: state.userModel.userData
                                              .copyWith(
                                                  age:
                                                      int.tryParse(value) ?? 0),
                                        ),
                                      ));
                                },
                              ),
                              const SizedBox(height: 20),
                              CustomUserDataField(
                                hint: S.of(context).height,
                                icon: Icons.straighten,
                                keyboardType: TextInputType.number,
                                initialValue:
                                    state.userModel.userData.height.toString(),
                                onChanged: (value) {
                                  context.read<UserBloc>().add(UpdateUserField(
                                        userModel: state.userModel.copyWith(
                                          userData: state.userModel.userData
                                              .copyWith(
                                                  height:
                                                      int.tryParse(value) ?? 0),
                                        ),
                                      ));
                                },
                              ),
                              const SizedBox(height: 20),
                              CustomUserDataField(
                                keyboardType: TextInputType.number,
                                hint: S.of(context).weight,
                                icon: Icons.monitor_weight,
                                initialValue:
                                    state.userModel.userData.weight.toString(),
                                onChanged: (value) {
                                  context.read<UserBloc>().add(UpdateUserField(
                                        userModel: state.userModel.copyWith(
                                          userData: state.userModel.userData
                                              .copyWith(
                                                  weight:
                                                      int.tryParse(value) ?? 0),
                                        ),
                                      ));
                                },
                              ),
                            ],
                          ),
                        ),
              bottomNavigationBar: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomConfirmCancelButton(
                      label: S.of(context).cancel,
                      onPressed: () => context.router.pop(),
                    ),
                    CustomConfirmCancelButton(
                        label: S.of(context).confirm,
                        onPressed: () {
                          context.read<UserBloc>().add(UpdateUserInfo(
                                userModel: state.userModel,
                              ));
                        }),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
