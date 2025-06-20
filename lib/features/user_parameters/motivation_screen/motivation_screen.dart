import 'package:ai_fit_coach/common/api/model/user_motivation.dart';

import 'package:ai_fit_coach/features/user_parameters/widgets/continue_button.dart';
import 'package:flutter/material.dart';

class MotivationPage extends StatefulWidget {
  final PageController pageController;
  final void Function(UserMotivation) onMotivationChanged;

  const MotivationPage({
    super.key,
    required this.pageController,
    required this.onMotivationChanged,
  });

  @override
  State<MotivationPage> createState() => _MotivationPageState();
}

class _MotivationPageState extends State<MotivationPage> {
  bool _stressReduction = false;
  bool _eventTraining = false;
  bool _rehabilitation = false;
  bool _improveHealth = false;
  bool _buildStrength = false;
  bool _boostImmune = false;
  bool _boostLibido = false;
  bool _isNextEnabled = false;

  void _updateMotivation() {
    final motivation = UserMotivation(
      stressReduction: _stressReduction,
      eventTraining: _eventTraining,
      rehabilitation: _rehabilitation,
      improveHealth: _improveHealth,
      buildStrength: _buildStrength,
      boostImmune: _boostImmune,
      boostLibido: _boostLibido,
    );
    setState(() {
      _isNextEnabled = motivation.toList().isNotEmpty;
    });
    widget.onMotivationChanged(motivation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'What motivates you?',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Choose your motivations',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildMotivationButton('Reducing stress', _stressReduction,
                      (value) {
                    setState(() {
                      _stressReduction = value;
                    });
                    _updateMotivation();
                  }),
                  _buildMotivationButton(
                      'Preparing for the event', _eventTraining, (value) {
                    setState(() {
                      _eventTraining = value;
                    });
                    _updateMotivation();
                  }),
                  _buildMotivationButton('Rehabilitation', _rehabilitation,
                      (value) {
                    setState(() {
                      _rehabilitation = value;
                    });
                    _updateMotivation();
                  }),
                  _buildMotivationButton('Improving health', _improveHealth,
                      (value) {
                    setState(() {
                      _improveHealth = value;
                    });
                    _updateMotivation();
                  }),
                  _buildMotivationButton('Building strength', _buildStrength,
                      (value) {
                    setState(() {
                      _buildStrength = value;
                    });
                    _updateMotivation();
                  }),
                  _buildMotivationButton('Improving immunity', _boostImmune,
                      (value) {
                    setState(() {
                      _boostImmune = value;
                    });
                    _updateMotivation();
                  }),
                  _buildMotivationButton('Increase in libido', _boostLibido,
                      (value) {
                    setState(() {
                      _boostLibido = value;
                    });
                    _updateMotivation();
                  }),
                ],
              ),
            ),
          ),
          ContinueButton(
            isNextEnabled: _isNextEnabled,
            pageController: widget.pageController,
          ),
        ],
      ),
    );
  }

  Widget _buildMotivationButton(
      String text, bool value, ValueChanged<bool> onChanged) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: value ? Colors.purple : Colors.grey[800],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
