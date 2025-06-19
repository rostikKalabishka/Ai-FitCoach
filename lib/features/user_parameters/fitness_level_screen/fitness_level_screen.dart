import 'package:ai_fit_coach/features/user_parameters/widgets/widgets.dart';
import 'package:flutter/material.dart';

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

  String _getFitnessLevelName(int level) {
    switch (level) {
      case 0:
        return 'Початківець';
      case 1:
        return 'Аматор';
      case 2:
        return 'Середній';
      case 3:
        return 'Експерт';
      default:
        return 'Початківець';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('How fit are you?',
            style: TextStyle(color: Colors.white, fontSize: 20)),
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
                        label: _getFitnessLevelName(_fitnessLevel.round()),
                        onChanged: (double value) {
                          setState(() {
                            _fitnessLevel = value.round();
                            _isNextEnabled = true;
                          });
                          widget.onFitnessLevelChanged(
                              _getFitnessLevelName(_fitnessLevel));
                        },
                      ),
                    ),
                    Text(
                      'Рівень: ${_getFitnessLevelName(_fitnessLevel.round())}',
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
