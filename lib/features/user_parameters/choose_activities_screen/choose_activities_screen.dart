import 'package:ai_fit_coach/features/loader/bloc/authentication_bloc.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/continue_button.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/navigation_back_button.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/selection_button.dart';
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:ai_fit_coach/repositories/analytics_repository/abstract_analytics_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

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
  final analyticsRepository = GetIt.instance<AbstractAnalyticsRepository>();

  @override
  void initState() {
    super.initState();
    try {
      analyticsRepository.logScreenView(
        screenName: 'choose_activities_screen',
        screenClass: 'ChooseActivitiesPage',
      );
    } catch (e) {
      debugPrint('Error logging screen view: $e');
    }
  }

  void _toggleActivity(String activity) {
    try {
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
      analyticsRepository.logEvent(
        name: 'activity_selected',
        parameters: {
          'screen_name': 'choose_activities_screen',
          'activity': activity,
          'is_selected': _selectedActivities.contains(activity).toString(),
          'selected_count': _selectedActivities.length,
          'user_id':
              context.read<AuthenticationBloc>().state.user?.id ?? 'unknown',
        },
      );
    } catch (e) {
      debugPrint('Error toggling activity: $e');
      analyticsRepository.logEvent(
        name: 'activity_selection_error',
        parameters: {
          'screen_name': 'choose_activities_screen',
          'activity': activity,
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
          S.of(context).chooseUpTo3ActivitiesYourInterestedIn,
          maxLines: 2,
          textAlign: TextAlign.center,
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
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectionButton(
                    text: S.of(context).dancing,
                    isSelected: _selectedActivities.contains('Dancing'),
                    onTap: () => _toggleActivity('Dancing'),
                    selectedColor: theme.colorScheme.primary,
                  ),
                  SelectionButton(
                    selectedColor: theme.colorScheme.primary,
                    text: S.of(context).swimmingWaterActivities,
                    isSelected: _selectedActivities
                        .contains('Swimming & Water Activities'),
                    onTap: () => _toggleActivity('Swimming & Water Activities'),
                  ),
                  SelectionButton(
                    selectedColor: theme.colorScheme.primary,
                    text: S.of(context).cycling,
                    isSelected: _selectedActivities.contains('Cycling'),
                    onTap: () => _toggleActivity('Cycling'),
                  ),
                  SelectionButton(
                    selectedColor: theme.colorScheme.primary,
                    text: S.of(context).walking,
                    isSelected: _selectedActivities.contains('Walking'),
                    onTap: () => _toggleActivity('Walking'),
                  ),
                  SelectionButton(
                    selectedColor: theme.colorScheme.primary,
                    text: S.of(context).running,
                    isSelected: _selectedActivities.contains('Running'),
                    onTap: () => _toggleActivity('Running'),
                  ),
                  SelectionButton(
                    selectedColor: theme.colorScheme.primary,
                    text: S.of(context).fitnessAtHome,
                    isSelected: _selectedActivities.contains('Fitness at home'),
                    onTap: () => _toggleActivity('Fitness at home'),
                  ),
                  SelectionButton(
                    selectedColor: theme.colorScheme.primary,
                    text: S.of(context).yoga,
                    isSelected: _selectedActivities.contains('Yoga'),
                    onTap: () => _toggleActivity('Yoga'),
                  ),
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
                        'screen_name': 'choose_activities_screen',
                        'selected_activities': _selectedActivities.join(','),
                        'selected_count': _selectedActivities.length,
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
                        'screen_name': 'choose_activities_screen',
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
}
