import 'package:flutter/material.dart';

enum GoalType { loseWeight, gainMuscle, keepFit }

class GoalButton extends StatelessWidget {
  final GoalType goalType;
  final String text;
  final GoalType? selectedGoal;
  final ValueChanged<GoalType> onSelected;

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
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
