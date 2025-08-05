import 'package:ai_fit_coach/features/loader/bloc/authentication_bloc.dart';
import 'package:ai_fit_coach/features/user_parameters/bloc/user_parameters_bloc.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/continue_button.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/navigation_back_button.dart';
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:ai_fit_coach/repositories/analytics_repository/abstract_analytics_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class FitnessLevelPage extends StatefulWidget {
  final PageController pageController;
  final void Function(String) onFitnessLevelChanged;

  const FitnessLevelPage({
    super.key,
    required this.pageController,
    required this.onFitnessLevelChanged,
  });

  @override
  State<FitnessLevelPage> createState() => _FitnessLevelPageState();
}

class _FitnessLevelPageState extends State<FitnessLevelPage> {
  int _fitnessLevel = 0;
  bool _isNextEnabled = false;
  final analyticsRepository = GetIt.instance<AbstractAnalyticsRepository>();

  @override
  void initState() {
    super.initState();
    try {
      analyticsRepository.logScreenView(
        screenName: 'fitness_level_screen',
        screenClass: 'FitnessLevelPage',
      );
      analyticsRepository
          .setUserFitnessLevel(_getFitnessLevelString(_fitnessLevel));
    } catch (e) {
      debugPrint('Error logging screen view or setting fitness level: $e');
    }
  }

  String _getFitnessLevelString(int level) {
    switch (level) {
      case 0:
        return S.of(context).beginner;
      case 1:
        return S.of(context).amateur;
      case 2:
        return S.of(context).medium;
      case 3:
        return S.of(context).expert;
      default:
        return S.of(context).beginner;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UserParametersBloc>();
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          S.of(context).whatIsYourLevelOfPhysicalFitness,
          style: const TextStyle(fontSize: 20),
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
        leading: NavigationBackButton(pageController: widget.pageController),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 4.0,
                        activeTrackColor: theme.colorScheme.primary,
                        inactiveTrackColor: Colors.grey,
                        thumbColor: theme.colorScheme.primary,
                        overlayColor: theme.colorScheme.primary.withAlpha(50),
                        valueIndicatorColor: theme.colorScheme.primary,
                        tickMarkShape:
                            const RoundSliderTickMarkShape(tickMarkRadius: 8.0),
                        activeTickMarkColor: theme.colorScheme.primary,
                        inactiveTickMarkColor: Colors.grey.withAlpha(135),
                      ),
                      child: Slider(
                        value: _fitnessLevel.toDouble(),
                        min: 0.0,
                        max: 3.0,
                        divisions: 3,
                        label: _getFitnessLevelString(_fitnessLevel),
                        onChanged: (double value) {
                          try {
                            setState(() {
                              _fitnessLevel = value.round();
                              _isNextEnabled = true;
                            });
                            final fitnessLevel =
                                _getFitnessLevelString(_fitnessLevel);
                            bloc.add(FitnessLevelChanged(fitnessLevel));
                            widget.onFitnessLevelChanged(fitnessLevel);
                            analyticsRepository
                                .setUserFitnessLevel(fitnessLevel);
                            analyticsRepository.logSliderInteraction(
                              sliderName: 'fitness_level',
                              selectedLevel: fitnessLevel,
                              screenName: 'fitness_level_screen',
                            );
                          } catch (e) {
                            debugPrint('Error updating fitness level: $e');
                            analyticsRepository.logEvent(
                              name: 'fitness_level_error',
                              parameters: {
                                'screen_name': 'fitness_level_screen',
                                'fitness_level':
                                    _getFitnessLevelString(_fitnessLevel),
                                'error_message': e.toString(),
                                'user_id': context
                                        .read<AuthenticationBloc>()
                                        .state
                                        .user
                                        ?.id ??
                                    'unknown',
                              },
                            );
                          }
                        },
                      ),
                    ),
                    Text(
                      S.of(context).levelFitnessLevel(
                          _getFitnessLevelString(_fitnessLevel)),
                      style: theme.textTheme.labelMedium,
                    ),
                  ],
                ),
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
                        'screen_name': 'fitness_level_screen',
                        'fitness_level': _getFitnessLevelString(_fitnessLevel),
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
                        'screen_name': 'fitness_level_screen',
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
