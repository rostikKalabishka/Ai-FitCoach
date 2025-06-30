import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../ui/ui.dart';

class _GoalOption {
  final IconData icon;
  final String label;

  const _GoalOption({
    required this.icon,
    required this.label,
  });
}

@RoutePage()
class FitnessGoalScreen extends StatefulWidget {
  const FitnessGoalScreen({super.key});

  @override
  State<FitnessGoalScreen> createState() => _FitnessGoalScreenState();
}

class _FitnessGoalScreenState extends State<FitnessGoalScreen> {
  final List<_GoalOption> goals = [
    _GoalOption(icon: Icons.scale, label: 'Weight Loss'),
    _GoalOption(icon: Icons.fitness_center, label: 'Muscle Gain'),
    _GoalOption(icon: Icons.accessibility_new, label: 'Stay Fit'),
    _GoalOption(icon: Icons.more_horiz, label: 'Other'),
  ];

  final List<bool> switches = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Text('Fitness Goal', style: theme.textTheme.labelMedium),
        centerTitle: true,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(goals.length, (index) {
            final goal = goals[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomFitnessGoalCard(
                icon: goal.icon,
                label: goal.label,
                value: switches[index],
                onChanged: (value) {
                  setState(() {
                    switches[index] = value;
                  });
                },
              ),
            );
          }),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomConfirmCancelButton(
              label: 'Cancel',
              onPressed: () => Navigator.pop(context),
            ),
            CustomConfirmCancelButton(
              label: 'Confirm',
              onPressed: () {
                final selectedGoals = <String>[];
                for (int i = 0; i < goals.length; i++) {
                  if (switches[i]) selectedGoals.add(goals[i].label);
                }
                print('Selected goals: $selectedGoals');
              },
            ),
          ],
        ),
      ),
    );
  }
}


