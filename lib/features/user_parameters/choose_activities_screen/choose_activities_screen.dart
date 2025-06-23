import 'package:ai_fit_coach/features/user_parameters/widgets/continue_button.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/navigation_back_button.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/selection_button.dart';
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
        title: const Text(
          'Choose up to 3 activities\nyou’re interested in',
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
                    text: 'Dancing',
                    isSelected: _selectedActivities.contains('Dancing'),
                    onTap: () => _toggleActivity('Dancing'),
                  ),
                  SelectionButton(
                    text: 'Swimming & Water Activities',
                    isSelected: _selectedActivities
                        .contains('Swimming & Water Activities'),
                    onTap: () => _toggleActivity('Swimming & Water Activities'),
                  ),
                  SelectionButton(
                    text: 'Cycling',
                    isSelected: _selectedActivities.contains('Cycling'),
                    onTap: () => _toggleActivity('Cycling'),
                  ),
                  SelectionButton(
                    text: 'Walking',
                    isSelected: _selectedActivities.contains('Walking'),
                    onTap: () => _toggleActivity('Walking'),
                  ),
                  SelectionButton(
                    text: 'Running',
                    isSelected: _selectedActivities.contains('Running'),
                    onTap: () => _toggleActivity('Running'),
                  ),
                  SelectionButton(
                    text: 'Fitness at home',
                    isSelected: _selectedActivities.contains('Fitness at home'),
                    onTap: () => _toggleActivity('Fitness at home'),
                  ),
                  SelectionButton(
                    text: 'Yoga',
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
