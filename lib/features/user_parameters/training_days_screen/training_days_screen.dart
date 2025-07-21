import 'package:ai_fit_coach/features/user_parameters/widgets/continue_button.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/navigation_back_button.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/selection_button.dart';
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:flutter/material.dart';

class TrainingDaysPage extends StatefulWidget {
  final PageController pageController;
  final void Function(List<String>) onTrainingDaysSelected;

  const TrainingDaysPage({
    super.key,
    required this.pageController,
    required this.onTrainingDaysSelected,
  });

  @override
  State<TrainingDaysPage> createState() => _TrainingDaysState();
}

class _TrainingDaysState extends State<TrainingDaysPage> {
  final List<String> _selectedDays = [];
  bool _isNextEnabled = false;

  void _toggleDay(String day) {
    setState(() {
      if (_selectedDays.contains(day)) {
        _selectedDays.remove(day);
      } else {
        _selectedDays.add(day);
      }
      _isNextEnabled = _selectedDays.length >= 2 && _selectedDays.length <= 5;
    });
    widget.onTrainingDaysSelected(List.from(_selectedDays));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).chooseYourTrainingDays,
          style: theme.textTheme.labelMedium,
        ),
        leading: NavigationBackButton(pageController: widget.pageController),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S
                        .of(context)
                        .forBestFitnessResultsChooseToTrainEveryOtherDay,
                    style: TextStyle(color: Colors.white),
                  ),
                  SelectionButton(
                    selectedColor: const Color.fromARGB(255, 85, 0, 0),
                    text: S.of(context).monday,
                    isSelected: _selectedDays.contains('Monday'),
                    onTap: () => _toggleDay('Monday'),
                  ),
                  SelectionButton(
                    selectedColor: const Color.fromARGB(255, 85, 0, 0),
                    text: S.of(context).tuesday,
                    isSelected: _selectedDays.contains('Tuesday'),
                    onTap: () => _toggleDay('Tuesday'),
                  ),
                  SelectionButton(
                    selectedColor: const Color.fromARGB(255, 85, 0, 0),
                    text: S.of(context).wednesday,
                    isSelected: _selectedDays.contains('Wednesday'),
                    onTap: () => _toggleDay('Wednesday'),
                  ),
                  SelectionButton(
                    selectedColor: const Color.fromARGB(255, 85, 0, 0),
                    text: S.of(context).thursday,
                    isSelected: _selectedDays.contains('Thursday'),
                    onTap: () => _toggleDay('Thursday'),
                  ),
                  SelectionButton(
                    selectedColor: const Color.fromARGB(255, 85, 0, 0),
                    text: S.of(context).friday,
                    isSelected: _selectedDays.contains('Friday'),
                    onTap: () => _toggleDay('Friday'),
                  ),
                  SelectionButton(
                    selectedColor: const Color.fromARGB(255, 85, 0, 0),
                    text: S.of(context).saturday,
                    isSelected: _selectedDays.contains('Saturday'),
                    onTap: () => _toggleDay('Saturday'),
                  ),
                  SelectionButton(
                    selectedColor: const Color.fromARGB(255, 85, 0, 0),
                    text: S.of(context).sunday,
                    isSelected: _selectedDays.contains('Sunday'),
                    onTap: () => _toggleDay('Sunday'),
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
