import 'package:ai_fit_coach/features/loader/bloc/authentication_bloc.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/continue_button.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/navigation_back_button.dart';
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:ai_fit_coach/ui/theme/app_const.dart';
import 'package:ai_fit_coach/repositories/analytics_repository/abstract_analytics_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class TermsPage extends StatefulWidget {
  final PageController pageController;
  final void Function(bool) onTermsChanged;
  final VoidCallback onSubmit;

  const TermsPage({
    super.key,
    required this.pageController,
    required this.onTermsChanged,
    required this.onSubmit,
  });

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  bool _termsAccepted = false;
  bool _isSubmitEnabled = false;
  final analyticsRepository = GetIt.instance<AbstractAnalyticsRepository>();

  @override
  void initState() {
    super.initState();
    try {
      analyticsRepository.logScreenView(
        screenName: 'terms_screen',
        screenClass: 'TermsPage',
      );
    } catch (e) {
      debugPrint('Error logging screen view: $e');
    }
  }

  void _updateTerms(bool value) {
    try {
      setState(() {
        _termsAccepted = value;
        _isSubmitEnabled = _termsAccepted;
      });
      widget.onTermsChanged(_termsAccepted);
      analyticsRepository.logEvent(
        name: 'terms_accepted',
        parameters: {
          'screen_name': 'terms_screen',
          'accepted': _termsAccepted.toString(),
          'user_id':
              context.read<AuthenticationBloc>().state.user?.id ?? 'unknown',
        },
      );
    } catch (e) {
      debugPrint('Error updating terms: $e');
      analyticsRepository.logEvent(
        name: 'terms_error',
        parameters: {
          'screen_name': 'terms_screen',
          'error_message': e.toString(),
          'user_id':
              context.read<AuthenticationBloc>().state.user?.id ?? 'unknown',
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          S.of(context).terms,
          style: const TextStyle(fontSize: 20),
        ),
        leading: NavigationBackButton(pageController: widget.pageController),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                spacing: 10,
                children: [
                  Image.asset(AppConst.privacy),
                  Text(
                    S.of(context).doYouAgreeWithOurTermsAndPolicies,
                    style: theme.textTheme.labelMedium,
                    textAlign: TextAlign.center,
                  ),
                  CheckboxListTile(
                    title: Text(
                      S.of(context).iAgreeToTheTermsOfUseAndSubscriptionTerms,
                      style: const TextStyle(fontSize: 11),
                    ),
                    value: _termsAccepted,
                    activeColor: theme.colorScheme.primary,
                    onChanged: (value) {
                      _updateTerms(value ?? false);
                    },
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              ContinueButton(
                pageController: widget.pageController,
                isSubmitEnabled: _isSubmitEnabled,
                onPressed: () {
                  try {
                    analyticsRepository.logEvent(
                      name: 'continue_button_clicked',
                      parameters: {
                        'screen_name': 'terms_screen',
                        'terms_accepted': _termsAccepted.toString(),
                        'user_id':
                            context.read<AuthenticationBloc>().state.user?.id ??
                                'unknown',
                      },
                    );
                    widget.onSubmit();
                  } catch (e) {
                    debugPrint('Error logging continue button click: $e');
                    analyticsRepository.logEvent(
                      name: 'continue_button_error',
                      parameters: {
                        'screen_name': 'terms_screen',
                        'error_message': e.toString(),
                        'user_id':
                            context.read<AuthenticationBloc>().state.user?.id ??
                                'unknown',
                      },
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
