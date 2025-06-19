import 'package:ai_fit_coach/features/user_parameters/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DietPreferencePage extends StatefulWidget {
  final PageController pageController;
  final void Function(List<String>) onDietsSelected;

  const DietPreferencePage({
    super.key,
    required this.pageController,
    required this.onDietsSelected,
  });

  @override
  State<DietPreferencePage> createState() => _DietPreferencePageState();
}

class _DietPreferencePageState extends State<DietPreferencePage> {
  final List<String> _selectedDiets = [];
  bool _isNextEnabled = false;

  void _toggleDiet(String diet) {
    setState(() {
      if (_selectedDiets.contains(diet)) {
        _selectedDiets.remove(diet);
      } else {
        _selectedDiets.add(diet);
      }
      _isNextEnabled = _selectedDiets.isNotEmpty;
    });
    widget.onDietsSelected(_selectedDiets);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Which diet type do you prefer?',
            style: TextStyle(color: Colors.white, fontSize: 20)),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            widget.pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Which diet type do you prefer?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        decoration: TextDecoration.underline),
                  ),
                  const SizedBox(height: 20),
                  _buildDietButton('Low-Carb'),
                  _buildDietButton('High-Protein'),
                  _buildDietButton('Gluten-Free'),
                  _buildDietButton('Pescatarian'),
                  _buildDietButton('Keto'),
                  _buildDietButton('Vegan'),
                  _buildDietButton('Vegetarian'),
                  _buildDietButton('All-food diet'),
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

  Widget _buildDietButton(String diet) {
    final isSelected = _selectedDiets.contains(diet);
    return InkWell(
      onTap: () => _toggleDiet(diet),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple : Colors.grey[800],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            diet,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
