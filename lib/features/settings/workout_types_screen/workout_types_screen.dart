import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../ui/ui.dart';

class WorkoutTypeOption {
  final IconData icon;
  final String label;

  const WorkoutTypeOption({
    required this.icon,
    required this.label,
  });}

@RoutePage()
class WorkoutTypesScreen extends StatefulWidget {
  const WorkoutTypesScreen({super.key});

  @override
  State<WorkoutTypesScreen> createState() => _WorkoutTypesScreenState();
}

class _WorkoutTypesScreenState extends State<WorkoutTypesScreen> {
  final List<bool> _switchStates = [false, false, false, false];

  final List<WorkoutTypeOption> _options = const [
    WorkoutTypeOption(icon: Icons.directions_run, label: 'Cardio'),
    WorkoutTypeOption(icon: Icons.fitness_center, label: 'Strength'),
    WorkoutTypeOption(icon: Icons.self_improvement, label: 'Yoga'),
    WorkoutTypeOption(icon: Icons.flash_on, label: 'HIIT'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Text('Workout Types', style: theme.textTheme.labelMedium),
        centerTitle: true,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: List.generate(_options.length, (index) {
              final option = _options[index];
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
                final selectedTypes = <String>[];
                for (int i = 0; i < _options.length; i++) {
                  if (_switchStates[i]) {
                    selectedTypes.add(_options[i].label);
                  }
                }
                print('Selected workout types: $selectedTypes');
              },
            ),
          ],
        ),
      ),
    );
  }
}

