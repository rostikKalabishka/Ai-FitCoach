import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../ui/ui.dart';

@RoutePage()
class DifficultyLevelScreen extends StatefulWidget {
  const DifficultyLevelScreen({super.key});

  @override
  State<DifficultyLevelScreen> createState() => _DifficultyLevelScreenState();
}

class _DifficultyLevelScreenState extends State<DifficultyLevelScreen> {
  int? selectedIndex;

  final List<DifficultyOption> options = const [
    DifficultyOption(label: 'Beginner', icon: Icons.looks_one),
    DifficultyOption(label: 'Intermediate', icon: Icons.looks_two),
    DifficultyOption(label: 'Advanced', icon: Icons.looks_3),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Text('Difficulty Level', style: theme.textTheme.labelMedium),
        centerTitle: true,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(options.length, (index) {
            final option = options[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomDifficultySwitchCard(
                icon: option.icon,
                label: option.label,
                value: selectedIndex == index,
                onChanged: (bool newValue) {
                  setState(() {
                    selectedIndex = newValue ? index : null;
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
                final selectedLabel = selectedIndex != null
                    ? options[selectedIndex!].label
                    : null;
                print('Selected level: $selectedLabel');
              },
            ),
          ],
        ),
      ),
    );
  }
}

