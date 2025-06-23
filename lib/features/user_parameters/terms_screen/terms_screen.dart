import 'package:ai_fit_coach/features/user_parameters/widgets/widgets.dart';
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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Terms',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.black,
        leading: NavigationBackButton(pageController: widget.pageController),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                spacing: 20,
                children: [
                  Image.asset(AppConst.privacy),
                  Text(
                    'Do you agree with our terms and policies?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  CheckboxListTile(
                    title: const Text(
                        'I agree to the Terms of Use and Subscription Terms. I am also aware of the Privacy Notice',
                        style: TextStyle(color: Colors.white)),
                    value: _termsAccepted,
                    checkColor: Colors.black,
                    activeColor: Colors.blue,
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
          )
        ],
      ),
    );
  }
}
