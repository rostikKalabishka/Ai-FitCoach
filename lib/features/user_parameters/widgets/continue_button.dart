import 'package:ai_fit_coach/blocs/settings_cubit/settings_cubit.dart';
import 'package:ai_fit_coach/features/loader/bloc/authentication_bloc.dart';
import 'package:ai_fit_coach/features/user_parameters/bloc/user_parameters_bloc.dart';
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:ai_fit_coach/repositories/analytics_repository/abstract_analytics_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    super.key,
    required this.pageController,
    this.isNextEnabled = false,
    this.isSubmitEnabled = false,
    this.onPressed,
  });

  final bool isNextEnabled;
  final PageController pageController;
  final bool isSubmitEnabled;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UserParametersBloc>();
    final analyticsRepository = GetIt.instance<AbstractAnalyticsRepository>();
    final theme = Theme.of(context);
    final isEnabled = isNextEnabled || isSubmitEnabled;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: isEnabled
                  ? () {
                      try {
                        // Call custom onPressed callback (e.g., for BodyParametersPage analytics)
                        onPressed?.call();

                        // Log button click
                        analyticsRepository.logEvent(
                          name: 'continue_button_clicked',
                          parameters: {
                            'screen_name': 'body_parameters_screen',
                            'action': isSubmitEnabled ? 'submit' : 'next',
                            'user_id': context
                                    .read<AuthenticationBloc>()
                                    .state
                                    .user
                                    ?.id ??
                                'unknown',
                          },
                        );

                        if (isSubmitEnabled) {
                          // Submit parameters
                          bloc.add(SubmitParameters(context
                              .read<AuthenticationBloc>()
                              .state
                              .user!
                              .id));
                          context
                              .read<SettingsCubit>()
                              .setUserParametersScreen();
                        } else if (isNextEnabled) {
                          // Navigate to next page
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      } catch (e) {
                        debugPrint('Error in ContinueButton: $e');
                        analyticsRepository.logEvent(
                          name: 'continue_button_error',
                          parameters: {
                            'screen_name': 'body_parameters_screen',
                            'action': isSubmitEnabled ? 'submit' : 'next',
                            'error_message': e.toString(),
                            'user_id': context
                                    .read<AuthenticationBloc>()
                                    .state
                                    .user
                                    ?.id ??
                                'unknown',
                          },
                        );
                      }
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    isEnabled ? theme.colorScheme.primary : theme.disabledColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  S.of(context).continueText,
                  style: theme.textTheme.displaySmall?.copyWith(fontSize: 24),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
