import 'package:ai_fit_coach/common/api/model/user_data.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/continue_button.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/widgets.dart';
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:flutter/material.dart';

class GoalSelectionPage extends StatefulWidget {
  final PageController pageController;
  final void Function(String) onGoalSelected;

  const GoalSelectionPage({
    super.key,
    required this.pageController,
    required this.onGoalSelected,
  });

  @override
  State<GoalSelectionPage> createState() => _GoalSelectionPageState();
}

class _GoalSelectionPageState extends State<GoalSelectionPage> {
  Goal? _selectedGoal;
  bool _isNextEnabled = false;

  String _getGoalString(Goal goal) {
    switch (goal) {
      case Goal.loseWeight:
        return S.of(context).loseWeight;
      case Goal.gainMuscle:
        return S.of(context).gainMuscleMass;
      case Goal.keepFit:
        return S.of(context).keepFit;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          S.of(context).whatIsYourMainGoal,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        spacing: 20,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  _buildGoalButton(Goal.loseWeight, S.of(context).loseWeight),
                  _buildGoalButton(
                      Goal.gainMuscle, S.of(context).gainMuscleMass),
                  _buildGoalButton(Goal.keepFit, S.of(context).keepFit),
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

  Widget _buildGoalButton(Goal goal, String text) {
    final isSelected = _selectedGoal == goal;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Material(
        color:
            isSelected ? const Color.fromARGB(255, 85, 0, 0) : Colors.grey[800],
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            setState(() {
              _selectedGoal = goal;
              _isNextEnabled = true;
            });
            widget.onGoalSelected(_getGoalString(goal));
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
