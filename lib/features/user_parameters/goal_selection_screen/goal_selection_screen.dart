import 'package:ai_fit_coach/common/api/model/user_data.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/continue_button.dart';
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
        return 'Lose weight';
      case Goal.gainMuscle:
        return 'Gain muscle mass';
      case Goal.keepFit:
        return 'Keep fit';
    }
  }

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  _buildGoalButton(Goal.loseWeight, 'Lose weight'),
                  const SizedBox(height: 20),
                  _buildGoalButton(Goal.gainMuscle, 'Gain muscle mass'),
                  const SizedBox(height: 20),
                  _buildGoalButton(Goal.keepFit, 'Keep fit'),
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
    return InkWell(
      onTap: () {
        setState(() {
          _selectedGoal = goal;
          _isNextEnabled = true;
        });
        widget.onGoalSelected(_getGoalString(goal));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple : Colors.grey[800],
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
