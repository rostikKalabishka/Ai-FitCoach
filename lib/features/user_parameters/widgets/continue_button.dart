import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton(
      {super.key, required this.isNextEnabled, required this.pageController});
  final bool isNextEnabled;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: isNextEnabled
                  ? () => pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      )
                  : null,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              child:
                  const Text('CONTINUE', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
