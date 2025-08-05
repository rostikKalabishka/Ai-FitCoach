import 'package:ai_fit_coach/features/loader/bloc/authentication_bloc.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/widgets.dart';
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:ai_fit_coach/repositories/analytics_repository/abstract_analytics_repository.dart';
import 'package:ai_fit_coach/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class BodyParametersPage extends StatefulWidget {
  final PageController pageController;
  final void Function(int, int, int) onParametersChanged;

  const BodyParametersPage({
    super.key,
    required this.pageController,
    required this.onParametersChanged,
  });

  @override
  State<BodyParametersPage> createState() => _BodyParametersPageState();
}

class _BodyParametersPageState extends State<BodyParametersPage> {
  late int _weight;
  late int _height;
  late int _age;
  bool _isNextEnabled = false;
  final analyticsRepository = GetIt.instance<AbstractAnalyticsRepository>();

  @override
  void initState() {
    super.initState();
    _weight = 65;
    _height = 170;
    _age = 18;
    // Log screen view
    try {
      analyticsRepository.logScreenView(
        screenName: 'body_parameters_screen',
        screenClass: 'BodyParametersPage',
      );
    } catch (e) {
      debugPrint('Error logging screen view: $e');
    }
  }

  void _logParameterChange(String parameter, int value) {
    try {
      analyticsRepository.logEvent(
        name: 'parameter_changed',
        parameters: {
          'screen_name': 'body_parameters_screen',
          'parameter': parameter,
          'value': value,
          'user_id':
              context.read<AuthenticationBloc>().state.user?.id ?? 'unknown',
        },
      );
    } catch (e) {
      debugPrint('Error logging parameter change: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          S.of(context).bodyParameters,
          style: TextStyle(fontSize: 20),
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
                  PlatformAdaptivePicker(
                    label: S.of(context).yourWeight,
                    minValue: 0,
                    maxValue: 500,
                    initialValue: _weight,
                    onChanged: (value) {
                      setState(() {
                        _weight = value;
                        _isNextEnabled = _weight > 0 && _height > 0 && _age > 0;
                      });
                      try {
                        widget.onParametersChanged(_weight, _height, _age);
                        _logParameterChange('weight', value);
                      } catch (e) {
                        debugPrint('Error updating weight: $e');
                        analyticsRepository.logEvent(
                          name: 'parameter_change_error',
                          parameters: {
                            'screen_name': 'body_parameters_screen',
                            'parameter': 'weight',
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
                  PlatformAdaptivePicker(
                    label: S.of(context).yourHeight,
                    minValue: 0,
                    maxValue: 300,
                    initialValue: _height,
                    onChanged: (value) {
                      setState(() {
                        _height = value;
                        _isNextEnabled = _weight > 0 && _height > 0 && _age > 0;
                      });
                      try {
                        widget.onParametersChanged(_weight, _height, _age);
                        _logParameterChange('height', value);
                      } catch (e) {
                        debugPrint('Error updating height: $e');
                        analyticsRepository.logEvent(
                          name: 'parameter_change_error',
                          parameters: {
                            'screen_name': 'body_parameters_screen',
                            'parameter': 'height',
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
                  PlatformAdaptivePicker(
                    label: S.of(context).yourAge,
                    minValue: 0,
                    maxValue: 200,
                    initialValue: _age,
                    onChanged: (value) {
                      setState(() {
                        _age = value;
                        _isNextEnabled = _weight > 0 && _height > 0 && _age > 0;
                      });
                      try {
                        widget.onParametersChanged(_weight, _height, _age);
                        _logParameterChange('age', value);
                      } catch (e) {
                        debugPrint('Error updating age: $e');
                        analyticsRepository.logEvent(
                          name: 'parameter_change_error',
                          parameters: {
                            'screen_name': 'body_parameters_screen',
                            'parameter': 'age',
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
                ],
              ),
            ),
          ),
          ContinueButton(
            isNextEnabled: _isNextEnabled,
            pageController: widget.pageController,
            onPressed: () {
              try {
                analyticsRepository.logEvent(
                  name: 'continue_button_clicked',
                  parameters: {
                    'screen_name': 'body_parameters_screen',
                    'weight': _weight,
                    'height': _height,
                    'age': _age,
                    'user_id':
                        context.read<AuthenticationBloc>().state.user?.id ??
                            'unknown',
                  },
                );
              } catch (e) {
                debugPrint('Error logging continue button click: $e');
              }
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
