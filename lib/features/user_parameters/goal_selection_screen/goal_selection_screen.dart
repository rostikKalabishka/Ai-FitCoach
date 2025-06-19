import 'package:ai_fit_coach/features/user_parameters/widgets/widgets.dart';
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
  GoalType? _selectedGoal;
  bool _isNextEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'What is your main goal?',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  GoalButton(
                    goalType: GoalType.loseWeight,
                    text: 'Lose weight',
                    selectedGoal: _selectedGoal,
                    onSelected: (goalType) {
                      setState(() {
                        _selectedGoal = goalType;
                        _isNextEnabled = true;
                      });
                      widget.onGoalSelected('Lose weight');
                    },
                  ),
                  const SizedBox(height: 20),
                  GoalButton(
                    goalType: GoalType.gainMuscle,
                    text: 'Gain muscle',
                    selectedGoal: _selectedGoal,
                    onSelected: (goalType) {
                      setState(() {
                        _selectedGoal = goalType;
                        _isNextEnabled = true;
                      });
                      widget.onGoalSelected('Gain muscle');
                    },
                  ),
                  const SizedBox(height: 20),
                  GoalButton(
                    goalType: GoalType.keepFit,
                    text: 'Keep fit',
                    selectedGoal: _selectedGoal,
                    onSelected: (goalType) {
                      setState(() {
                        _selectedGoal = goalType;
                        _isNextEnabled = true;
                      });
                      widget.onGoalSelected('Keep fit');
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
