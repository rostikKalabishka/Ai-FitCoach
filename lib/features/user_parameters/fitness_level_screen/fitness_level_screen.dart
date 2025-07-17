import 'package:ai_fit_coach/features/user_parameters/bloc/user_parameters_bloc.dart';

import 'package:ai_fit_coach/features/user_parameters/widgets/widgets.dart';
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    //final isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).whatIsYourLevelOfPhysicalFitness,
          style: TextStyle(fontSize: 20),
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
                        activeTrackColor: const Color.fromARGB(255, 85, 0, 0),
                        inactiveTrackColor: Colors.grey,
                        thumbColor: const Color.fromARGB(255, 85, 0, 0),
                        overlayColor:
                            const Color.fromARGB(255, 85, 0, 0).withAlpha(50),
                        valueIndicatorColor:
                            const Color.fromARGB(255, 85, 0, 0),
                        tickMarkShape:
                            const RoundSliderTickMarkShape(tickMarkRadius: 8.0),
                        activeTickMarkColor:
                            const Color.fromARGB(255, 85, 0, 0),
                        inactiveTickMarkColor: Colors.grey.withAlpha(135),
                      ),
                      child: Slider(
                        value: _fitnessLevel.toDouble(),
                        min: 0.0,
                        max: 3.0,
                        divisions: 3,
                        label: _getFitnessLevelString(_fitnessLevel),
                        onChanged: (double value) {
                          setState(() {
                            _fitnessLevel = value.round();
                            _isNextEnabled = true;
                          });
                          bloc.add(FitnessLevelChanged(
                              _getFitnessLevelString(_fitnessLevel)));
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
          ContinueButton(
            isNextEnabled: _isNextEnabled,
            pageController: widget.pageController,
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
