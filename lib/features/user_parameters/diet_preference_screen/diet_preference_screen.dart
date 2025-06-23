import 'package:ai_fit_coach/features/user_parameters/widgets/continue_button.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/navigation_back_button.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/selection_button.dart';
import 'package:flutter/material.dart';

class DietPreferencePage extends StatefulWidget {
  final PageController pageController;
  final void Function(String?) onDietSelected;

  const DietPreferencePage({
    super.key,
    required this.pageController,
    required this.onDietSelected,
  });

  @override
  State<DietPreferencePage> createState() => _DietPreferencePageState();
}

class _DietPreferencePageState extends State<DietPreferencePage> {
  String? _selectedDiet;
  bool _isNextEnabled = false;

  void _toggleDiet(String diet) {
    setState(() {
      if (_selectedDiet == diet) {
        _selectedDiet = null;
        _isNextEnabled = false;
      } else {
        _selectedDiet = diet;
        _isNextEnabled = true;
      }
    });
    widget.onDietSelected(_selectedDiet);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'What type of diet do you prefer?',
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
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectionButton(
                    text: 'Low-Carb',
                    isSelected: _selectedDiet == 'Low-Carb',
                    onTap: () => _toggleDiet('Low-Carb'),
                    selectedColor: Colors.blue,
                  ),
                  SelectionButton(
                    text: 'High-Protein',
                    isSelected: _selectedDiet == 'High-Protein',
                    onTap: () => _toggleDiet('High-Protein'),
                    selectedColor: Colors.blue,
                  ),
                  SelectionButton(
                    text: 'Gluten-Free',
                    isSelected: _selectedDiet == 'Gluten-Free',
                    onTap: () => _toggleDiet('Gluten-Free'),
                    selectedColor: Colors.blue,
                  ),
                  SelectionButton(
                    text: 'Pescatarian',
                    isSelected: _selectedDiet == 'Pescatarian',
                    onTap: () => _toggleDiet('Pescatarian'),
                    selectedColor: Colors.blue,
                  ),
                  SelectionButton(
                    text: 'Keto',
                    isSelected: _selectedDiet == 'Keto',
                    onTap: () => _toggleDiet('Keto'),
                    selectedColor: Colors.blue,
                  ),
                  SelectionButton(
                    text: 'Vegan',
                    isSelected: _selectedDiet == 'Vegan',
                    onTap: () => _toggleDiet('Vegan'),
                    selectedColor: Colors.blue,
                  ),
                  SelectionButton(
                    text: 'Vegetarian',
                    isSelected: _selectedDiet == 'Vegetarian',
                    onTap: () => _toggleDiet('Vegetarian'),
                    selectedColor: Colors.blue,
                  ),
                  SelectionButton(
                    text: 'All-food diet',
                    isSelected: _selectedDiet == 'All-food diet',
                    onTap: () => _toggleDiet('All-food diet'),
                    selectedColor: Colors.blue,
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
