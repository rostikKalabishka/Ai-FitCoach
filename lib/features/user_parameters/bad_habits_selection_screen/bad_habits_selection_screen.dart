import 'package:ai_fit_coach/features/user_parameters/widgets/widgets.dart';
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
    widget.onBadHabitsSelected(_selectedHabits);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Choose your bad habits',
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
                  InkWell(
                    onTap: () => _toggleHabit('Unable to rest enough'),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        color: _selectedHabits.contains('Unable to rest enough')
                            ? Colors.purple
                            : Colors.grey[800],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Unable to rest enough',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => _toggleHabit('Sometimes i drink alcohol'),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        color: _selectedHabits
                                .contains('Sometimes i drink alcohol')
                            ? Colors.purple
                            : Colors.grey[800],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Sometimes i drink alcohol',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => _toggleHabit('I consume a lot of salty food'),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        color: _selectedHabits
                                .contains('I consume a lot of salty food')
                            ? Colors.purple
                            : Colors.grey[800],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'I consume a lot of salty food',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => _toggleHabit('I eat midnight snacks'),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        color: _selectedHabits.contains('I eat midnight snacks')
                            ? Colors.purple
                            : Colors.grey[800],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'I eat midnight snacks',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () =>
                        _toggleHabit('I love sweet candies and chocolate'),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        color: _selectedHabits
                                .contains('I love sweet candies and chocolate')
                            ? Colors.purple
                            : Colors.grey[800],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'I love sweet candies and chocolate',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => _toggleHabit('Soda is my best friend'),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        color:
                            _selectedHabits.contains('Soda is my best friend')
                                ? Colors.purple
                                : Colors.grey[800],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Soda is my best friend',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => _toggleHabit('None of the above'),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        color: _selectedHabits.contains('None of the above')
                            ? Colors.purple
                            : Colors.grey[800],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'None of the above',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
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
