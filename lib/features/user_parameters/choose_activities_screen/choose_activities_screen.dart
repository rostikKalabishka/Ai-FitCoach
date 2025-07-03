import 'package:ai_fit_coach/features/user_parameters/widgets/continue_button.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/navigation_back_button.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/selection_button.dart';
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:flutter/material.dart';

class ChooseActivitiesPage extends StatefulWidget {
  final PageController pageController;
  final void Function(List<String>) onActivitiesSelected;

  const ChooseActivitiesPage({
    super.key,
    required this.pageController,
    required this.onActivitiesSelected,
  });

  @override
  State<ChooseActivitiesPage> createState() => _ChooseActivitiesPageState();
}

class _ChooseActivitiesPageState extends State<ChooseActivitiesPage> {
  final List<String> _selectedActivities = [];
  bool _isNextEnabled = false;

  void _toggleActivity(String activity) {
    setState(() {
      if (_selectedActivities.contains(activity)) {
        _selectedActivities.remove(activity);
      } else if (_selectedActivities.length < 3) {
        _selectedActivities.add(activity);
      }
      _isNextEnabled =
          _selectedActivities.isNotEmpty && _selectedActivities.length <= 3;
    });
    widget.onActivitiesSelected(List.from(_selectedActivities));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          S.of(context).chooseUpTo3ActivitiesYourInterestedIn,
          maxLines: 2,
          textAlign: TextAlign.center,
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
                  SelectionButton(
                    text: S.of(context).dancing,
                    isSelected: _selectedActivities.contains('Dancing'),
                    onTap: () => _toggleActivity('Dancing'),
                    selectedColor: const Color.fromARGB(255, 85, 0, 0),
                  ),
                  SelectionButton(
                    selectedColor: const Color.fromARGB(255, 85, 0, 0),
                    text: S.of(context).swimmingWaterActivities,
                    isSelected: _selectedActivities
                        .contains('Swimming & Water Activities'),
                    onTap: () => _toggleActivity('Swimming & Water Activities'),
                  ),
                  SelectionButton(
                    selectedColor: const Color.fromARGB(255, 85, 0, 0),
                    text: S.of(context).cycling,
                    isSelected: _selectedActivities.contains('Cycling'),
                    onTap: () => _toggleActivity('Cycling'),
                  ),
                  SelectionButton(
                    selectedColor: const Color.fromARGB(255, 85, 0, 0),
                    text: S.of(context).walking,
                    isSelected: _selectedActivities.contains('Walking'),
                    onTap: () => _toggleActivity('Walking'),
                  ),
                  SelectionButton(
                    selectedColor: const Color.fromARGB(255, 85, 0, 0),
                    text: S.of(context).running,
                    isSelected: _selectedActivities.contains('Running'),
                    onTap: () => _toggleActivity('Running'),
                  ),
                  SelectionButton(
                    selectedColor: const Color.fromARGB(255, 85, 0, 0),
                    text: S.of(context).fitnessAtHome,
                    isSelected: _selectedActivities.contains('Fitness at home'),
                    onTap: () => _toggleActivity('Fitness at home'),
                  ),
                  SelectionButton(
                    selectedColor: const Color.fromARGB(255, 85, 0, 0),
                    text: S.of(context).yoga,
                    isSelected: _selectedActivities.contains('Yoga'),
                    onTap: () => _toggleActivity('Yoga'),
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
