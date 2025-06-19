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
        title: const Text('Terms',
            style: TextStyle(color: Colors.white, fontSize: 20)),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            widget.pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        ),
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
                  Text('Do you agree with our terms and policies?',
                      style: TextStyle(color: Colors.white)),
                  CheckboxListTile(
                    title: const Text(
                        'i agree to the Terms of Use and Subscription Terms. I am also aware of the Privacy Notice',
                        style: TextStyle(color: Colors.white)),
                    value: _termsAccepted,
                    checkColor: Colors.black,
                    activeColor: Colors.purple,
                    onChanged: (value) {
                      setState(() {
                        _termsAccepted = value!;
                        _isSubmitEnabled = _termsAccepted;
                      });
                      widget.onTermsChanged(_termsAccepted);
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _isSubmitEnabled ? widget.onSubmit : null,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple),
                    child: const Text('CONTINUE',
                        style: TextStyle(color: Colors.white, fontSize: 24)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
