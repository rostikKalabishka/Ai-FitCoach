import 'package:ai_fit_coach/features/user_parameters/widgets/continue_button.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/navigation_back_button.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/selection_button.dart';
import 'package:ai_fit_coach/generated/l10n.dart';
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
        title: Text(
          S.of(context).whatTypeOfDietDoYouPrefer,
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
                      text: S.of(context).lowcarb,
                      isSelected: _selectedDiet == 'Low-Carb',
                      onTap: () => _toggleDiet('Low-Carb'),
                      selectedColor: const Color.fromARGB(255, 85, 0, 0)),
                  SelectionButton(
                      text: S.of(context).highprotein,
                      isSelected: _selectedDiet == 'High-Protein',
                      onTap: () => _toggleDiet('High-Protein'),
                      selectedColor: const Color.fromARGB(255, 85, 0, 0)),
                  SelectionButton(
                      text: S.of(context).glutenfree,
                      isSelected: _selectedDiet == 'Gluten-Free',
                      onTap: () => _toggleDiet('Gluten-Free'),
                      selectedColor: const Color.fromARGB(255, 85, 0, 0)),
                  SelectionButton(
                      text: 'Piscatorial',
                      isSelected: _selectedDiet == 'Pescatarian',
                      onTap: () => _toggleDiet('Pescatarian'),
                      selectedColor: const Color.fromARGB(255, 85, 0, 0)),
                  SelectionButton(
                      text: S.of(context).keto,
                      isSelected: _selectedDiet == 'Keto',
                      onTap: () => _toggleDiet('Keto'),
                      selectedColor: const Color.fromARGB(255, 85, 0, 0)),
                  SelectionButton(
                      text: S.of(context).vegan,
                      isSelected: _selectedDiet == 'Vegan',
                      onTap: () => _toggleDiet('Vegan'),
                      selectedColor: const Color.fromARGB(255, 85, 0, 0)),
                  SelectionButton(
                      text: S.of(context).vegetarian,
                      isSelected: _selectedDiet == 'Vegetarian',
                      onTap: () => _toggleDiet('Vegetarian'),
                      selectedColor: const Color.fromARGB(255, 85, 0, 0)),
                  SelectionButton(
                      text: S.of(context).allfoodDiet,
                      isSelected: _selectedDiet == 'All-food diet',
                      onTap: () => _toggleDiet('All-food diet'),
                      selectedColor: const Color.fromARGB(255, 85, 0, 0)),
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
