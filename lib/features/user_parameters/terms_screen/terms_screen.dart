import 'package:ai_fit_coach/features/user_parameters/widgets/widgets.dart';
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:ai_fit_coach/ui/theme/app_const.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          S.of(context).terms,
          style: TextStyle(fontSize: 20),
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
                      style: TextStyle(fontSize: 11),
                    ),
                    value: _termsAccepted,
                    activeColor: theme.colorScheme.primary,
                    onChanged: (value) {
                      setState(() {
                        _termsAccepted = value ?? false;
                        _isSubmitEnabled = _termsAccepted;
                      });
                      widget.onTermsChanged(_termsAccepted);
                    },
                  ),
                ],
              ),
            ),
          ),
          ContinueButton(
            pageController: widget.pageController,
            isSubmitEnabled: _isSubmitEnabled,
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
