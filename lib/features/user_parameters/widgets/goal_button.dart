import 'package:ai_fit_coach/common/api/model/user_data.dart';
import 'package:flutter/material.dart';

// enum GoalType { loseWeight, gainMuscle, keepFit }

class GoalButton extends StatelessWidget {
  final Goal goalType;
  final String text;
  final Goal? selectedGoal;
  final ValueChanged<Goal> onSelected;

  const GoalButton({
    super.key,
    required this.goalType,
    required this.text,
    required this.selectedGoal,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = selectedGoal == goalType;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => onSelected(goalType),
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.purple : Colors.grey[800],
          padding: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
