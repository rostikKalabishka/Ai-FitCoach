import 'package:ai_fit_coach/common/api/model/user_motivation.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/continue_button.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/navigation_back_button.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/selection_button.dart';
import 'package:ai_fit_coach/generated/l10n.dart';
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
        title: Text(
          S.of(context).whatMotivatesYou,
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
                  Text(
                    S.of(context).chooseYourMotivations,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  SelectionButton(
                    selectedColor: const Color.fromARGB(255, 85, 0, 0),
                    text: S.of(context).reducingStress,
                    isSelected: _stressReduction,
                    onTap: () {
                      setState(() {
                        _stressReduction = !_stressReduction;
                      });
                      _updateMotivation();
                    },
                  ),
                  SelectionButton(
                    text: S.of(context).preparingForTheEvent,
                    isSelected: _eventTraining,
                    onTap: () {
                      setState(() {
                        _eventTraining = !_eventTraining;
                      });
                      _updateMotivation();
                    },
                  ),
                  SelectionButton(
                    selectedColor: const Color.fromARGB(255, 85, 0, 0),
                    text: S.of(context).rehabilitation,
                    isSelected: _rehabilitation,
                    onTap: () {
                      setState(() {
                        _rehabilitation = !_rehabilitation;
                      });
                      _updateMotivation();
                    },
                  ),
                  SelectionButton(
                    selectedColor: const Color.fromARGB(255, 85, 0, 0),
                    text: S.of(context).improvingHealth,
                    isSelected: _improveHealth,
                    onTap: () {
                      setState(() {
                        _improveHealth = !_improveHealth;
                      });
                      _updateMotivation();
                    },
                  ),
                  SelectionButton(
                    selectedColor: const Color.fromARGB(255, 85, 0, 0),
                    text: S.of(context).buildingStrength,
                    isSelected: _buildStrength,
                    onTap: () {
                      setState(() {
                        _buildStrength = !_buildStrength;
                      });
                      _updateMotivation();
                    },
                  ),
                  SelectionButton(
                    selectedColor: const Color.fromARGB(255, 85, 0, 0),
                    text: S.of(context).improvingImmunity,
                    isSelected: _boostImmune,
                    onTap: () {
                      setState(() {
                        _boostImmune = !_boostImmune;
                      });
                      _updateMotivation();
                    },
                  ),
                  SelectionButton(
                    selectedColor: const Color.fromARGB(255, 85, 0, 0),
                    text: S.of(context).increaseInLibido,
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
