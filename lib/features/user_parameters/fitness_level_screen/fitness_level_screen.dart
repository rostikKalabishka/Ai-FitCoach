import 'package:ai_fit_coach/features/user_parameters/bloc/user_parameters_bloc.dart';
import 'package:ai_fit_coach/features/user_parameters/widgets/continue_button.dart';
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
        return 'Beginner';
      case 1:
        return 'Amateur';
      case 2:
        return 'Medium';
      case 3:
        return 'Expert';
      default:
        return 'Beginner';
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UserParametersBloc>();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'What is your level of physical fitness?',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            widget.pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        ),
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
                        activeTrackColor: Colors.purple,
                        inactiveTrackColor: Colors.grey,
                        thumbColor: Colors.purple,
                        overlayColor: Colors.purple.withAlpha(50),
                        valueIndicatorColor: Colors.purple,
                        tickMarkShape:
                            const RoundSliderTickMarkShape(tickMarkRadius: 8.0),
                        activeTickMarkColor: Colors.white,
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
                      'Level: ${_getFitnessLevelString(_fitnessLevel)}',
                      style: const TextStyle(color: Colors.white, fontSize: 24),
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
        ],
      ),
    );
  }
}
