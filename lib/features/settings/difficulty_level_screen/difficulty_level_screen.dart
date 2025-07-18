import 'package:ai_fit_coach/generated/l10n.dart';
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

  @override
  Widget build(BuildContext context) {
    final List<DifficultyOption> options = [
      DifficultyOption(label: S.of(context).beginner, icon: Icons.looks_one),
      DifficultyOption(
          label: S.of(context).intermediate, icon: Icons.looks_two),
      DifficultyOption(label: S.of(context).advanced, icon: Icons.looks_3),
    ];
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Text(S.of(context).difficultyLevel,
            style: theme.textTheme.labelMedium),
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
    );
  }
}
