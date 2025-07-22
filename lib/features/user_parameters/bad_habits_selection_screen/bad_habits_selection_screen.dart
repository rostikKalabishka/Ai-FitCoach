import 'package:ai_fit_coach/features/user_parameters/widgets/continue_button.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/navigation_back_button.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/selection_button.dart';
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:flutter/material.dart';

class BadHabitsSelectionPage extends StatefulWidget {
  final PageController pageController;
  final void Function(List<String>) onBadHabitsSelected;

  const BadHabitsSelectionPage({
    super.key,
    required this.pageController,
    required this.onBadHabitsSelected,
  });

  @override
  State<BadHabitsSelectionPage> createState() => _BadHabitsSelectionPageState();
}

class _BadHabitsSelectionPageState extends State<BadHabitsSelectionPage> {
  final List<String> _selectedHabits = [];
  bool _isNextEnabled = false;

  void _toggleHabit(String habit) {
    setState(() {
      if (_selectedHabits.contains(habit)) {
        _selectedHabits.remove(habit);
      } else {
        _selectedHabits.add(habit);
      }
      _isNextEnabled = _selectedHabits.isNotEmpty;
    });
    widget.onBadHabitsSelected(List.from(_selectedHabits));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          S.of(context).chooseYourBadHabits,
          style: TextStyle(fontSize: 20),
        ),
        leading: NavigationBackButton(pageController: widget.pageController),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectionButton(
                    selectedColor: theme.colorScheme.primary,
                    text: S.of(context).unableToRestEnough,
                    isSelected:
                        _selectedHabits.contains('Unable to rest enough'),
                    onTap: () => _toggleHabit('Unable to rest enough'),
                  ),
                  SelectionButton(
                    selectedColor: theme.colorScheme.primary,
                    text: S.of(context).sometimesIDrinkAlcohol,
                    isSelected:
                        _selectedHabits.contains('Sometimes I drink alcohol'),
                    onTap: () => _toggleHabit('Sometimes I drink alcohol'),
                  ),
                  SelectionButton(
                    selectedColor: theme.colorScheme.primary,
                    text: S.of(context).iConsumeALotOfSaltyFood,
                    isSelected: _selectedHabits
                        .contains('I consume a lot of salty food'),
                    onTap: () => _toggleHabit('I consume a lot of salty food'),
                  ),
                  SelectionButton(
                    selectedColor: theme.colorScheme.primary,
                    text: S.of(context).iEatMidnightSnacks,
                    isSelected:
                        _selectedHabits.contains('I eat midnight snacks'),
                    onTap: () => _toggleHabit('I eat midnight snacks'),
                  ),
                  SelectionButton(
                    selectedColor: theme.colorScheme.primary,
                    text: S.of(context).iLoveSweetCandiesAndChocolate,
                    isSelected: _selectedHabits
                        .contains('I love sweet candies and chocolate'),
                    onTap: () =>
                        _toggleHabit('I love sweet candies and chocolate'),
                  ),
                  SelectionButton(
                    selectedColor: theme.colorScheme.primary,
                    text: S.of(context).sodaIsMyBestFriend,
                    isSelected:
                        _selectedHabits.contains('Soda is my best friend'),
                    onTap: () => _toggleHabit('Soda is my best friend'),
                  ),
                  SelectionButton(
                    selectedColor: theme.colorScheme.primary,
                    text: S.of(context).noneOfTheAbove,
                    isSelected: _selectedHabits.contains('None of the above'),
                    onTap: () => _toggleHabit('None of the above'),
                  ),
                ],
              ),
            ),
          ),
          ContinueButton(
            isNextEnabled: _isNextEnabled,
            pageController: widget.pageController,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
