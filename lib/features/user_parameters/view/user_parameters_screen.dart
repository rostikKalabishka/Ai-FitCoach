import 'package:ai_fit_coach/features/user_parameters/bad_habits_selection_screen/bad_habits_selection_screen.dart';
import 'package:ai_fit_coach/features/user_parameters/body_parameters_screen/body_parameters_screen.dart';
import 'package:ai_fit_coach/features/user_parameters/choose_activities_screen/choose_activities_screen.dart';
import 'package:ai_fit_coach/features/user_parameters/diet_preference_screen/diet_preference_screen.dart';
import 'package:ai_fit_coach/features/user_parameters/fitness_level_screen/fitness_level_screen.dart';
import 'package:ai_fit_coach/features/user_parameters/goal_selection_screen/goal_selection_screen.dart';
import 'package:ai_fit_coach/features/user_parameters/motivation_screen/motivation_screen.dart';
import 'package:ai_fit_coach/features/user_parameters/terms_screen/terms_screen.dart';
import 'package:ai_fit_coach/features/user_parameters/training_days_screen/training_days_screen.dart';

import 'package:auto_route/auto_route.dart';

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
  int _currentPage = 0;

  // Shared data
  String goal = '';
  String exerciseType = '';
  double weight = 0;
  double height = 0;
  int age = 0;
  bool stressReduction = false;
  bool eventTraining = false;
  bool rehabilitation = false;
  bool improveHealth = false;
  bool buildStrength = false;
  bool boostImmune = false;
  bool boostLibido = false;
  bool termsAccepted = false;
  List<String> dietPreferences = [];
  List<String> activities = [];
  List<String> badHabits = [];
  List<String> trainingDays = [];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      print(
          'Goal: $goal, Exercise: $exerciseType, Weight: $weight kg, Height: $height cm, Age: $age years, '
          'Motivations: Stress=$stressReduction, Event=$eventTraining, Rehab=$rehabilitation, '
          'ImproveHealth=$improveHealth, BuildStrength=$buildStrength, BoostImmune=$boostImmune, '
          'BoostLibido=$boostLibido, Terms: $termsAccepted, '
          'Diet Preferences: $dietPreferences, Activities: $activities, Bad Habits: $badHabits, '
          'Training Days: $trainingDays');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                GoalSelectionPage(
                  pageController: _pageController,
                  onGoalSelected: (goalText) {
                    setState(() {
                      goal = goalText;
                    });
                  },
                ),
                FitnessLevelPage(
                  pageController: _pageController,
                  onFitnessLevelChanged: (levelName) {
                    setState(() {
                      exerciseType = levelName;
                    });
                  },
                ),
                BodyParametersPage(
                  pageController: _pageController,
                  onParametersChanged: (w, h, a) {
                    setState(() {
                      weight = w;
                      height = h;
                      age = a;
                    });
                  },
                ),
                MotivationPage(
                  pageController: _pageController,
                  onMotivationChanged:
                      (stress, event, rehab, health, strength, immune, libido) {
                    setState(() {
                      stressReduction = stress;
                      eventTraining = event;
                      rehabilitation = rehab;
                      improveHealth = health;
                      buildStrength = strength;
                      boostImmune = immune;
                      boostLibido = libido;
                    });
                  },
                ),
                DietPreferencePage(
                  pageController: _pageController,
                  onDietsSelected: (diets) {
                    setState(() {
                      dietPreferences = diets;
                    });
                  },
                ),
                ChooseActivitiesPage(
                  pageController: _pageController,
                  onActivitiesSelected: (activitiesList) {
                    setState(() {
                      activities = activitiesList;
                    });
                  },
                ),
                BadHabitsSelectionPage(
                  pageController: _pageController,
                  onBadHabitsSelected: (habits) {
                    setState(() {
                      badHabits = habits;
                    });
                  },
                ),
                TrainingDaysPage(
                  pageController: _pageController,
                  onTrainingDaysSelected: (days) {
                    setState(() {
                      trainingDays = days;
                    });
                  },
                ),
                TermsPage(
                  pageController: _pageController,
                  onTermsChanged: (accepted) {
                    setState(() {
                      termsAccepted = accepted;
                    });
                  },
                  onSubmit: _onSubmit,
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(9, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 4.0, vertical: 32),
                    width: _currentPage == index ? 12.0 : 8.0,
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
}
