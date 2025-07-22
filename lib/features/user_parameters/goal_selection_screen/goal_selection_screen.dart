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
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          S.of(context).whatIsYourMainGoal,
          style: TextStyle(fontSize: 20),
        ),
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
                  _buildGoalButton(Goal.loseWeight, S.of(context).loseWeight,
                      theme.colorScheme.primary),
                  _buildGoalButton(Goal.gainMuscle,
                      S.of(context).gainMuscleMass, theme.colorScheme.primary),
                  _buildGoalButton(Goal.keepFit, S.of(context).keepFit,
                      theme.colorScheme.primary),
                ],
              ),
            ),
          ),
          Column(children: [
            ContinueButton(
              isNextEnabled: _isNextEnabled,
              pageController: widget.pageController,
            ),
            SizedBox(
              height: 20,
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildGoalButton(Goal goal, String text, Color selectedColor) {
    final isSelected = _selectedGoal == goal;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Material(
        color: isSelected ? selectedColor : Colors.grey[800],
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
