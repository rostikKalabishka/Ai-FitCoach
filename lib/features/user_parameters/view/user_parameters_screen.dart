import 'package:ai_fit_coach/features/user_parameters/widgets/goal_button.dart';
import 'package:ai_fit_coach/ui/widgets/widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UserParametersScreen extends StatefulWidget {
  const UserParametersScreen({super.key});

  @override
  State<UserParametersScreen> createState() => _UserParametersScreenState();
}

class _UserParametersScreenState extends State<UserParametersScreen> {
  final PageController _pageController = PageController();
  final _formKey = GlobalKey<FormState>();

  int _fitnessLevel = 0;

  String _getFitnessLevelName(int level) {
    switch (level) {
      case 0:
        return 'Початківець';
      case 1:
        return 'Аматор';
      case 2:
        return 'Середній';
      case 3:
        return 'Експерт';
      default:
        return 'Початківець';
    }
  }

  bool _stressReduction = false;
  bool _eventTraining = false;
  bool _rehabilitation = false;

  String name = '';
  String goal = '';
  String exerciseType = '';
  String dietPreference = '';
  String workoutDays = '';
  bool termsAccepted = false;

  GoalType? selectedGoal;
  int _currentPage = 0;
  bool _isNextEnabled = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                        _isNextEnabled = false;
                      });
                    },
                    children: [
                      _buildPage(
                        title: 'What is your main goal?',
                        child: Column(
                          spacing: 20,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 150),
                            GoalButton(
                              goalType: GoalType.loseWeight,
                              text: 'Lose weight',
                              selectedGoal: selectedGoal,
                              onSelected: (goalType) {
                                setState(() {
                                  selectedGoal = goalType;
                                  goal = 'Lose weight';
                                  _isNextEnabled = true;
                                });
                              },
                            ),
                            GoalButton(
                              goalType: GoalType.gainMuscle,
                              text: 'Gain muscle',
                              selectedGoal: selectedGoal,
                              onSelected: (goalType) {
                                setState(() {
                                  selectedGoal = goalType;
                                  goal = 'Gain muscle';
                                  _isNextEnabled = true;
                                });
                              },
                            ),
                            GoalButton(
                              goalType: GoalType.keepFit,
                              text: 'Keep fit',
                              selectedGoal: selectedGoal,
                              onSelected: (goalType) {
                                setState(() {
                                  selectedGoal = goalType;
                                  goal = 'Keep fit';
                                  _isNextEnabled = true;
                                });
                              },
                            ),
                          ],
                        ),
                        currentPage: _currentPage,
                        pageController: _pageController,
                      ),
                      _buildPage(
                        title: 'How fit are you?',
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 240,
                              ),
                              SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  trackHeight: 4.0,
                                  activeTrackColor: Colors.purple,
                                  inactiveTrackColor: Colors.grey,
                                  thumbColor: Colors.purple,
                                  overlayColor: Colors.purple.withAlpha(50),
                                  valueIndicatorColor: Colors.purple,
                                  tickMarkShape: const RoundSliderTickMarkShape(
                                      tickMarkRadius: 8.0),
                                  activeTickMarkColor: Colors.white,
                                  inactiveTickMarkColor:
                                      Colors.grey.withAlpha(135),
                                ),
                                child: Slider(
                                  value: _fitnessLevel.toDouble(),
                                  min: 0.0,
                                  max: 3.0,
                                  divisions: 3,
                                  label: _getFitnessLevelName(
                                      _fitnessLevel.round()),
                                  onChanged: (double value) {
                                    setState(() {
                                      _fitnessLevel = value.round();
                                      exerciseType =
                                          _getFitnessLevelName(_fitnessLevel);
                                      _isNextEnabled = true;
                                    });
                                  },
                                ),
                              ),
                              Text(
                                'Рівень: ${_getFitnessLevelName(_fitnessLevel.round())}',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        currentPage: _currentPage,
                        pageController: _pageController,
                      ),
                      _buildPage(
                        currentPage: _currentPage,
                        title: 'Body parameters',
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PlatformAdaptivePicker(
                              label: 'YOUR WEIGHT:',
                              minValue: 0,
                              maxValue: 500,
                              initialValue: 0,
                              onChanged: (value) =>
                                  print('Selected weight: $value kg'),
                            ),
                            const SizedBox(height: 20),
                            PlatformAdaptivePicker(
                              label: 'YOUR HEIGHT:',
                              minValue: 0,
                              maxValue: 300,
                              initialValue: 0,
                              onChanged: (value) => setState(() {
                                _isNextEnabled = true;
                                print('Selected height: $value cm');
                              }),
                            ),
                            const SizedBox(height: 20),
                            PlatformAdaptivePicker(
                              label: 'YOUR AGE:',
                              minValue: 0,
                              maxValue: 200,
                              initialValue: 0,
                              onChanged: (value) =>
                                  print('Selected age: $value years'),
                            ),
                          ],
                        ),
                        pageController: _pageController,
                      ),
                      _buildPage(
                        currentPage: _currentPage,
                        title:
                            'What motivate you to exercise? You can choose a few answers',
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CheckboxListTile(
                              title: Text('Reducing stress / Improving mood',
                                  style: TextStyle(color: Colors.white)),
                              value: _stressReduction,
                              onChanged: (value) {
                                setState(() {
                                  _stressReduction = value ?? false;
                                  _isNextEnabled = _stressReduction ||
                                      _eventTraining ||
                                      _rehabilitation;
                                });
                              },
                            ),
                            CheckboxListTile(
                              title: Text('Training for a specific event',
                                  style: TextStyle(color: Colors.white)),
                              value: _eventTraining,
                              onChanged: (value) {
                                setState(() {
                                  _eventTraining = value ?? false;
                                  _isNextEnabled = _stressReduction ||
                                      _eventTraining ||
                                      _rehabilitation;
                                });
                              },
                            ),
                            CheckboxListTile(
                              title: Text('Rehabilitation / recovery',
                                  style: TextStyle(color: Colors.white)),
                              value: _rehabilitation,
                              onChanged: (value) {
                                setState(() {
                                  _rehabilitation = value ?? false;
                                  _isNextEnabled = _stressReduction ||
                                      _eventTraining ||
                                      _rehabilitation;
                                });
                              },
                            ),
                          ],
                        ),
                        pageController: _pageController,
                      ),
                      _buildPage(
                        currentPage: _currentPage,
                        title: 'Умови',
                        child: Column(
                          children: [
                            CheckboxListTile(
                              title: const Text('Прийняти умови та політику',
                                  style: TextStyle(color: Colors.white)),
                              value: termsAccepted,
                              checkColor: Colors.black,
                              activeColor: Colors.purple,
                              onChanged: (value) {
                                setState(() {
                                  termsAccepted = value!;
                                  _isNextEnabled = value;
                                });
                              },
                            ),
                          ],
                        ),
                        pageController: _pageController,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      if (_currentPage < 4)
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _isNextEnabled
                                ? () => _pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    )
                                : null,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple),
                            child: const Text(
                              'CONTINUE',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      if (_currentPage == 4)
                        Expanded(
                          child: ElevatedButton(
                            onPressed: termsAccepted
                                ? () {
                                    if (_formKey.currentState!.validate()) {
                                      print(
                                          'Name: $name, Goal: $goal, Exercise: $exerciseType, Diet: $dietPreference, Workout Days: $workoutDays');
                                    }
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple),
                            child: const Text(
                              'Подати',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            // Bottom Indicators
            Positioned(
              left: 0,
              right: 0,
              bottom: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 4.0, vertical: 32),
                    width: _currentPage == index ? 12.0 : 8,
                    height: _currentPage == index ? 12.0 : 8.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index ? Colors.blue : Colors.white,
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(
      {required String title,
      required Widget child,
      required int currentPage,
      required PageController pageController}) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.black,
        leading: currentPage != 0
            ? IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  setState(() {});

                  pageController.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                },
              )
            : null,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            child,
          ],
        ),
      ),
    );
  }
}
