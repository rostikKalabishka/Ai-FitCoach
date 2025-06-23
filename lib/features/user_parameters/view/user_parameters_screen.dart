import 'package:ai_fit_coach/common/api/model/user_data.dart';
import 'package:ai_fit_coach/common/api/model/user_motivation.dart'
    hide Goal, FitnessLevel;
import 'package:ai_fit_coach/features/user_parameters/bad_habits_selection_screen/bad_habits_selection_screen.dart';
import 'package:ai_fit_coach/features/user_parameters/bloc/user_parameters_bloc.dart';
import 'package:ai_fit_coach/features/user_parameters/body_parameters_screen/body_parameters_screen.dart';
import 'package:ai_fit_coach/features/user_parameters/choose_activities_screen/choose_activities_screen.dart';
import 'package:ai_fit_coach/features/user_parameters/diet_preference_screen/diet_preference_screen.dart';
import 'package:ai_fit_coach/features/user_parameters/fitness_level_screen/fitness_level_screen.dart';
import 'package:ai_fit_coach/features/user_parameters/goal_selection_screen/goal_selection_screen.dart';
import 'package:ai_fit_coach/features/user_parameters/motivation_screen/motivation_screen.dart';
import 'package:ai_fit_coach/features/user_parameters/terms_screen/terms_screen.dart';
import 'package:ai_fit_coach/features/user_parameters/training_days_screen/training_days_screen.dart';
import 'package:ai_fit_coach/router/router.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  UserData _userData = UserData.emptyUserData;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate() && _userData.isComplete) {
      print(_userData.toJson()); // Відправити до API або зберегти локально
      // Наприклад: context.router.push(NextRoute());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Будь ласка, заповніть усі обов’язкові поля')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserParametersBloc, UserParametersState>(
      listener: (context, state) {
        if (state is UserParametersSuccess) {
          AutoRouter.of(context)
              .pushAndPopUntil(LoaderRoute(), predicate: (route) => false);
        }
      },
      builder: (BuildContext context, state) {
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
                      onGoalSelected: (String goal) {
                        context
                            .read<UserParametersBloc>()
                            .add(GoalSelected(goal));
                      },
                    ),
                    FitnessLevelPage(
                      pageController: _pageController,
                      onFitnessLevelChanged: (String level) {
                        context
                            .read<UserParametersBloc>()
                            .add(FitnessLevelChanged(level));
                      },
                    ),
                    BodyParametersPage(
                      pageController: _pageController,
                      onParametersChanged: (int w, int h, int a) {
                        context.read<UserParametersBloc>().add(
                              BodyParametersChanged(
                                  weight: w, height: h, age: a),
                            );
                      },
                    ),
                    MotivationPage(
                      pageController: _pageController,
                      onMotivationChanged: (UserMotivation motivation) {
                        context
                            .read<UserParametersBloc>()
                            .add(MotivationChanged(motivation));
                      },
                    ),
                    DietPreferencePage(
                      pageController: _pageController,
                      onDietSelected: (String? diet) {
                        context
                            .read<UserParametersBloc>()
                            .add(DietSelected(diet));
                      },
                    ),
                    ChooseActivitiesPage(
                      pageController: _pageController,
                      onActivitiesSelected: (List<String> activitiesList) {
                        context
                            .read<UserParametersBloc>()
                            .add(ActivitiesSelected(activitiesList));
                      },
                    ),
                    BadHabitsSelectionPage(
                      pageController: _pageController,
                      onBadHabitsSelected: (List<String> habits) {
                        context
                            .read<UserParametersBloc>()
                            .add(BadHabitsSelected(habits));
                      },
                    ),
                    TrainingDaysPage(
                      pageController: _pageController,
                      onTrainingDaysSelected: (List<String> days) {
                        context
                            .read<UserParametersBloc>()
                            .add(TrainingDaysSelected(days));
                      },
                    ),
                    TermsPage(
                      pageController: _pageController,
                      onTermsChanged: (bool accepted) {
                        context
                            .read<UserParametersBloc>()
                            .add(TermsChanged(accepted));
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
                          color: _currentPage == index
                              ? Colors.blue
                              : Colors.white,
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
