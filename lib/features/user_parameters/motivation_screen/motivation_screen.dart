import 'package:ai_fit_coach/common/api/model/user_motivation.dart';
import 'package:ai_fit_coach/features/loader/bloc/authentication_bloc.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/continue_button.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/navigation_back_button.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/selection_button.dart';
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:ai_fit_coach/repositories/analytics_repository/abstract_analytics_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class MotivationPage extends StatefulWidget {
  final PageController pageController;
  final void Function(UserMotivation) onMotivationChanged;

  const MotivationPage({
    super.key,
    required this.pageController,
    required this.onMotivationChanged,
  });

  @override
  State<MotivationPage> createState() => _MotivationPageState();
}

class _MotivationPageState extends State<MotivationPage> {
  bool _stressReduction = false;
  bool _eventTraining = false;
  bool _rehabilitation = false;
  bool _improveHealth = false;
  bool _buildStrength = false;
  bool _boostImmune = false;
  bool _boostLibido = false;
  bool _isNextEnabled = false;
  final analyticsRepository = GetIt.instance<AbstractAnalyticsRepository>();

  @override
  void initState() {
    super.initState();
    try {
      analyticsRepository.logScreenView(
        screenName: 'motivation_screen',
        screenClass: 'MotivationPage',
      );
    } catch (e) {
      debugPrint('Error logging screen view: $e');
    }
  }

  void _updateMotivation(
      {required String motivation, required bool isSelected}) {
    try {
      final userMotivation = UserMotivation(
        stressReduction: _stressReduction,
        eventTraining: _eventTraining,
        rehabilitation: _rehabilitation,
        improveHealth: _improveHealth,
        buildStrength: _buildStrength,
        boostImmune: _boostImmune,
        boostLibido: _boostLibido,
      );
      setState(() {
        _isNextEnabled = userMotivation.toList().isNotEmpty;
      });
      widget.onMotivationChanged(userMotivation);
      analyticsRepository.logEvent(
        name: 'motivation_selected',
        parameters: {
          'screen_name': 'motivation_screen',
          'motivation': motivation,
          'is_selected': isSelected.toString(),
          'selected_count': userMotivation.toList().length,
          'user_id':
              context.read<AuthenticationBloc>().state.user?.id ?? 'unknown',
        },
      );
    } catch (e) {
      debugPrint('Error updating motivation: $e');
      analyticsRepository.logEvent(
        name: 'motivation_selection_error',
        parameters: {
          'screen_name': 'motivation_screen',
          'motivation': motivation,
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
          S.of(context).whatMotivatesYou,
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
                    S.of(context).chooseYourMotivations,
                    style: theme.textTheme.labelSmall,
                  ),
                  SelectionButton(
                    selectedColor: theme.colorScheme.primary,
                    text: S.of(context).reducingStress,
                    isSelected: _stressReduction,
                    onTap: () {
                      setState(() {
                        _stressReduction = !_stressReduction;
                      });
                      _updateMotivation(
                        motivation: 'Reducing Stress',
                        isSelected: _stressReduction,
                      );
                    },
                  ),
                  SelectionButton(
                    selectedColor: theme.colorScheme.primary,
                    text: S.of(context).preparingForTheEvent,
                    isSelected: _eventTraining,
                    onTap: () {
                      setState(() {
                        _eventTraining = !_eventTraining;
                      });
                      _updateMotivation(
                        motivation: 'Preparing for the Event',
                        isSelected: _eventTraining,
                      );
                    },
                  ),
                  SelectionButton(
                    selectedColor: theme.colorScheme.primary,
                    text: S.of(context).rehabilitation,
                    isSelected: _rehabilitation,
                    onTap: () {
                      setState(() {
                        _rehabilitation = !_rehabilitation;
                      });
                      _updateMotivation(
                        motivation: 'Rehabilitation',
                        isSelected: _rehabilitation,
                      );
                    },
                  ),
                  SelectionButton(
                    selectedColor: theme.colorScheme.primary,
                    text: S.of(context).improvingHealth,
                    isSelected: _improveHealth,
                    onTap: () {
                      setState(() {
                        _improveHealth = !_improveHealth;
                      });
                      _updateMotivation(
                        motivation: 'Improving Health',
                        isSelected: _improveHealth,
                      );
                    },
                  ),
                  SelectionButton(
                    selectedColor: theme.colorScheme.primary,
                    text: S.of(context).buildingStrength,
                    isSelected: _buildStrength,
                    onTap: () {
                      setState(() {
                        _buildStrength = !_buildStrength;
                      });
                      _updateMotivation(
                        motivation: 'Building Strength',
                        isSelected: _buildStrength,
                      );
                    },
                  ),
                  SelectionButton(
                    selectedColor: theme.colorScheme.primary,
                    text: S.of(context).improvingImmunity,
                    isSelected: _boostImmune,
                    onTap: () {
                      setState(() {
                        _boostImmune = !_boostImmune;
                      });
                      _updateMotivation(
                        motivation: 'Improving Immunity',
                        isSelected: _boostImmune,
                      );
                    },
                  ),
                  SelectionButton(
                    selectedColor: theme.colorScheme.primary,
                    text: S.of(context).increaseInLibido,
                    isSelected: _boostLibido,
                    onTap: () {
                      setState(() {
                        _boostLibido = !_boostLibido;
                      });
                      _updateMotivation(
                        motivation: 'Increase in Libido',
                        isSelected: _boostLibido,
                      );
                    },
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
                    final userMotivation = UserMotivation(
                      stressReduction: _stressReduction,
                      eventTraining: _eventTraining,
                      rehabilitation: _rehabilitation,
                      improveHealth: _improveHealth,
                      buildStrength: _buildStrength,
                      boostImmune: _boostImmune,
                      boostLibido: _boostLibido,
                    );
                    analyticsRepository.logEvent(
                      name: 'continue_button_clicked',
                      parameters: {
                        'screen_name': 'motivation_screen',
                        'selected_motivations':
                            userMotivation.toList().join(','),
                        'selected_count': userMotivation.toList().length,
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
                        'screen_name': 'motivation_screen',
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
