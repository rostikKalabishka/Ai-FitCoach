import 'package:ai_fit_coach/features/loader/bloc/authentication_bloc.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/continue_button.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/navigation_back_button.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/selection_button.dart';
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:ai_fit_coach/repositories/analytics_repository/abstract_analytics_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class TrainingDaysPage extends StatefulWidget {
  final PageController pageController;
  final void Function(List<String>) onTrainingDaysSelected;

  const TrainingDaysPage({
    super.key,
    required this.pageController,
    required this.onTrainingDaysSelected,
  });

  @override
  State<TrainingDaysPage> createState() => _TrainingDaysState();
}

class _TrainingDaysState extends State<TrainingDaysPage> {
  final List<String> _selectedDays = [];
  bool _isNextEnabled = false;
  final analyticsRepository = GetIt.instance<AbstractAnalyticsRepository>();

  @override
  void initState() {
    super.initState();
    try {
      analyticsRepository.logScreenView(
        screenName: 'training_days_screen',
        screenClass: 'TrainingDaysPage',
      );
    } catch (e) {
      debugPrint('Error logging screen view: $e');
    }
  }

  void _toggleDay(String day) {
    try {
      setState(() {
        if (_selectedDays.contains(day)) {
          _selectedDays.remove(day);
        } else {
          _selectedDays.add(day);
        }
        _isNextEnabled = _selectedDays.length >= 2 && _selectedDays.length <= 5;
      });
      widget.onTrainingDaysSelected(List.from(_selectedDays));
      analyticsRepository.logEvent(
        name: 'training_day_selected',
        parameters: {
          'screen_name': 'training_days_screen',
          'day': day,
          'is_selected': _selectedDays.contains(day).toString(),
          'selected_count': _selectedDays.length,
          'user_id':
              context.read<AuthenticationBloc>().state.user?.id ?? 'unknown',
        },
      );
    } catch (e) {
      debugPrint('Error toggling training day: $e');
      analyticsRepository.logEvent(
        name: 'training_day_selection_error',
        parameters: {
          'screen_name': 'training_days_screen',
          'day': day,
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
          S.of(context).chooseYourTrainingDays,
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
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S
                        .of(context)
                        .forBestFitnessResultsChooseToTrainEveryOtherDay,
                    style: theme.textTheme.headlineLarge
                        ?.copyWith(fontWeight: FontWeight.normal),
                  ),
                  SelectionButton(
                    selectedColor: theme.colorScheme.primary,
                    text: S.of(context).monday,
                    isSelected: _selectedDays.contains('Monday'),
                    onTap: () => _toggleDay('Monday'),
                  ),
                  SelectionButton(
                    selectedColor: theme.colorScheme.primary,
                    text: S.of(context).tuesday,
                    isSelected: _selectedDays.contains('Tuesday'),
                    onTap: () => _toggleDay('Tuesday'),
                  ),
                  SelectionButton(
                    selectedColor: theme.colorScheme.primary,
                    text: S.of(context).wednesday,
                    isSelected: _selectedDays.contains('Wednesday'),
                    onTap: () => _toggleDay('Wednesday'),
                  ),
                  SelectionButton(
                    selectedColor: theme.colorScheme.primary,
                    text: S.of(context).thursday,
                    isSelected: _selectedDays.contains('Thursday'),
                    onTap: () => _toggleDay('Thursday'),
                  ),
                  SelectionButton(
                    selectedColor: theme.colorScheme.primary,
                    text: S.of(context).friday,
                    isSelected: _selectedDays.contains('Friday'),
                    onTap: () => _toggleDay('Friday'),
                  ),
                  SelectionButton(
                    selectedColor: theme.colorScheme.primary,
                    text: S.of(context).saturday,
                    isSelected: _selectedDays.contains('Saturday'),
                    onTap: () => _toggleDay('Saturday'),
                  ),
                  SelectionButton(
                    selectedColor: theme.colorScheme.primary,
                    text: S.of(context).sunday,
                    isSelected: _selectedDays.contains('Sunday'),
                    onTap: () => _toggleDay('Sunday'),
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
                        'screen_name': 'training_days_screen',
                        'selected_days': _selectedDays.join(','),
                        'selected_count': _selectedDays.length,
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
                        'screen_name': 'training_days_screen',
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
