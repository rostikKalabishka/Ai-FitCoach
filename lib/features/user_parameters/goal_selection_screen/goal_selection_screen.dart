import 'package:ai_fit_coach/common/api/model/user_data.dart';
import 'package:ai_fit_coach/features/loader/bloc/authentication_bloc.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/continue_button.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/navigation_back_button.dart';
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:ai_fit_coach/repositories/analytics_repository/abstract_analytics_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class GoalSelectionPage extends StatefulWidget {
  final PageController pageController;
  final void Function(String) onGoalSelected;

  const GoalSelectionPage({
    super.key,
    required this.pageController,
    required this.onGoalSelected,
  });

  @override
  State<GoalSelectionPage> createState() => _GoalSelectionPageState();
}

class _GoalSelectionPageState extends State<GoalSelectionPage> {
  Goal? _selectedGoal;
  bool _isNextEnabled = false;
  final analyticsRepository = GetIt.instance<AbstractAnalyticsRepository>();

  @override
  void initState() {
    super.initState();
    try {
      analyticsRepository.logScreenView(
        screenName: 'goal_selection_screen',
        screenClass: 'GoalSelectionPage',
      );
    } catch (e) {
      debugPrint('Error logging screen view: $e');
    }
  }

  String _getGoalString(Goal goal) {
    switch (goal) {
      case Goal.loseWeight:
        return S.of(context).loseWeight;
      case Goal.gainMuscle:
        return S.of(context).gainMuscleMass;
      case Goal.keepFit:
        return S.of(context).keepFit;
    }
  }

  void _selectGoal(Goal goal) {
    try {
      setState(() {
        _selectedGoal = goal;
        _isNextEnabled = true;
      });
      final goalString = _getGoalString(goal);
      widget.onGoalSelected(goalString);
      analyticsRepository.logGoalSet(
        goalType: goalString,
      );
      analyticsRepository.logEvent(
        name: 'goal_selected',
        parameters: {
          'screen_name': 'goal_selection_screen',
          'goal': goalString,
          'user_id':
              context.read<AuthenticationBloc>().state.user?.id ?? 'unknown',
        },
      );
    } catch (e) {
      debugPrint('Error selecting goal: $e');
      analyticsRepository.logEvent(
        name: 'goal_selection_error',
        parameters: {
          'screen_name': 'goal_selection_screen',
          'goal': goal.toString(),
          'error_message': e.toString(),
          'user_id':
              context.read<AuthenticationBloc>().state.user?.id ?? 'unknown',
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          S.of(context).whatIsYourMainGoal,
          style: const TextStyle(fontSize: 20),
        ),
        leading: NavigationBackButton(pageController: widget.pageController),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  _buildGoalButton(Goal.loseWeight, S.of(context).loseWeight,
                      theme.colorScheme.primary),
                  _buildGoalButton(Goal.gainMuscle,
                      S.of(context).gainMuscleMass, theme.colorScheme.primary),
                  _buildGoalButton(Goal.keepFit, S.of(context).keepFit,
                      theme.colorScheme.primary),
                ],
              ),
            ),
          ),
          Column(
            children: [
              ContinueButton(
                isNextEnabled: _isNextEnabled,
                pageController: widget.pageController,
                onPressed: () {
                  try {
                    analyticsRepository.logEvent(
                      name: 'continue_button_clicked',
                      parameters: {
                        'screen_name': 'goal_selection_screen',
                        'selected_goal': _selectedGoal != null
                            ? _getGoalString(_selectedGoal!)
                            : 'none',
                        'user_id':
                            context.read<AuthenticationBloc>().state.user?.id ??
                                'unknown',
                      },
                    );
                  } catch (e) {
                    debugPrint('Error logging continue button click: $e');
                    analyticsRepository.logEvent(
                      name: 'continue_button_error',
                      parameters: {
                        'screen_name': 'goal_selection_screen',
                        'error_message': e.toString(),
                        'user_id':
                            context.read<AuthenticationBloc>().state.user?.id ??
                                'unknown',
                      },
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGoalButton(Goal goal, String text, Color selectedColor) {
    final isSelected = _selectedGoal == goal;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Material(
        color: isSelected ? selectedColor : Colors.grey[800],
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () => _selectGoal(goal),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
