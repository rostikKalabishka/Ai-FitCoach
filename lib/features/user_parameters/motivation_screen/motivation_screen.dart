import 'package:ai_fit_coach/common/api/model/user_motivation.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/continue_button.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/navigation_back_button.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/selection_button.dart';
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
        leading: NavigationBackButton(pageController: widget.pageController),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                spacing: 20,
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
                  SelectionButton(
                    text: 'Reducing stress',
                    isSelected: _stressReduction,
                    onTap: () {
                      setState(() {
                        _stressReduction = !_stressReduction;
                      });
                      _updateMotivation();
                    },
                  ),
                  SelectionButton(
                    text: 'Preparing for the event',
                    isSelected: _eventTraining,
                    onTap: () {
                      setState(() {
                        _eventTraining = !_eventTraining;
                      });
                      _updateMotivation();
                    },
                  ),
                  SelectionButton(
                    text: 'Rehabilitation',
                    isSelected: _rehabilitation,
                    onTap: () {
                      setState(() {
                        _rehabilitation = !_rehabilitation;
                      });
                      _updateMotivation();
                    },
                  ),
                  SelectionButton(
                    text: 'Improving health',
                    isSelected: _improveHealth,
                    onTap: () {
                      setState(() {
                        _improveHealth = !_improveHealth;
                      });
                      _updateMotivation();
                    },
                  ),
                  SelectionButton(
                    text: 'Building strength',
                    isSelected: _buildStrength,
                    onTap: () {
                      setState(() {
                        _buildStrength = !_buildStrength;
                      });
                      _updateMotivation();
                    },
                  ),
                  SelectionButton(
                    text: 'Improving immunity',
                    isSelected: _boostImmune,
                    onTap: () {
                      setState(() {
                        _boostImmune = !_boostImmune;
                      });
                      _updateMotivation();
                    },
                  ),
                  SelectionButton(
                    text: 'Increase in libido',
                    isSelected: _boostLibido,
                    onTap: () {
                      setState(() {
                        _boostLibido = !_boostLibido;
                      });
                      _updateMotivation();
                    },
                  ),
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
}
