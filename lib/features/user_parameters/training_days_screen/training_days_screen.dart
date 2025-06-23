import 'package:ai_fit_coach/features/user_parameters/widgets/continue_button.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/navigation_back_button.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/selection_button.dart';
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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Choose your training days',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.black,
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
                  const Text(
                    'For best fitness results choose to train every other day 2 to 5 times a week',
                    style: TextStyle(color: Colors.white),
                  ),
                  SelectionButton(
                    text: 'Monday',
                    isSelected: _selectedDays.contains('Monday'),
                    onTap: () => _toggleDay('Monday'),
                  ),
                  SelectionButton(
                    text: 'Tuesday',
                    isSelected: _selectedDays.contains('Tuesday'),
                    onTap: () => _toggleDay('Tuesday'),
                  ),
                  SelectionButton(
                    text: 'Wednesday',
                    isSelected: _selectedDays.contains('Wednesday'),
                    onTap: () => _toggleDay('Wednesday'),
                  ),
                  SelectionButton(
                    text: 'Thursday',
                    isSelected: _selectedDays.contains('Thursday'),
                    onTap: () => _toggleDay('Thursday'),
                  ),
                  SelectionButton(
                    text: 'Friday',
                    isSelected: _selectedDays.contains('Friday'),
                    onTap: () => _toggleDay('Friday'),
                  ),
                  SelectionButton(
                    text: 'Saturday',
                    isSelected: _selectedDays.contains('Saturday'),
                    onTap: () => _toggleDay('Saturday'),
                  ),
                  SelectionButton(
                    text: 'Sunday',
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
        ],
      ),
    );
  }
}
