import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../ui/ui.dart';

class WorkoutTypeOption {
  final IconData icon;
  final String label;

  const WorkoutTypeOption({
    required this.icon,
    required this.label,
  });
}

@RoutePage()
class WorkoutTypesScreen extends StatefulWidget {
  const WorkoutTypesScreen({super.key});

  @override
  State<WorkoutTypesScreen> createState() => _WorkoutTypesScreenState();
}

class _WorkoutTypesScreenState extends State<WorkoutTypesScreen> {
  final List<bool> _switchStates = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<WorkoutTypeOption> options = [
      WorkoutTypeOption(
          icon: Icons.directions_run, label: S.of(context).cardio),
      WorkoutTypeOption(
          icon: Icons.fitness_center, label: S.of(context).strength),
      WorkoutTypeOption(
          icon: Icons.self_improvement, label: S.of(context).yoga),
      WorkoutTypeOption(icon: Icons.flash_on, label: S.of(context).hiit),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Text(S.of(context).workoutTypes,
            style: theme.textTheme.labelMedium),
        centerTitle: true,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: List.generate(options.length, (index) {
              final option = options[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: CustomWorkoutTypeCard(
                  icon: option.icon,
                  label: option.label,
                  value: _switchStates[index],
                  onChanged: (bool value) {
                    setState(() {
                      _switchStates[index] = value;
                    });
                  },
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
