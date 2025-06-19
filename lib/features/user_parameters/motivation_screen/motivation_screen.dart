import 'package:ai_fit_coach/features/user_parameters/widgets/continue_button.dart';
import 'package:flutter/material.dart';

class MotivationPage extends StatefulWidget {
  final PageController pageController;
  final void Function(bool, bool, bool, bool, bool, bool, bool)
      onMotivationChanged;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('What motivates you to exercise?',
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CheckboxListTile(
                    title: const Text('Reducing stress / Improving mood',
                        style: TextStyle(color: Colors.white)),
                    value: _stressReduction,
                    onChanged: (value) {
                      setState(() {
                        _stressReduction = value ?? false;
                        _isNextEnabled = _stressReduction ||
                            _eventTraining ||
                            _rehabilitation ||
                            _improveHealth ||
                            _buildStrength ||
                            _boostImmune ||
                            _boostLibido;
                      });
                      widget.onMotivationChanged(
                        _stressReduction,
                        _eventTraining,
                        _rehabilitation,
                        _improveHealth,
                        _buildStrength,
                        _boostImmune,
                        _boostLibido,
                      );
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Training for a specific event',
                        style: TextStyle(color: Colors.white)),
                    value: _eventTraining,
                    onChanged: (value) {
                      setState(() {
                        _eventTraining = value ?? false;
                        _isNextEnabled = _stressReduction ||
                            _eventTraining ||
                            _rehabilitation ||
                            _improveHealth ||
                            _buildStrength ||
                            _boostImmune ||
                            _boostLibido;
                      });
                      widget.onMotivationChanged(
                        _stressReduction,
                        _eventTraining,
                        _rehabilitation,
                        _improveHealth,
                        _buildStrength,
                        _boostImmune,
                        _boostLibido,
                      );
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Rehabilitation / recovery',
                        style: TextStyle(color: Colors.white)),
                    value: _rehabilitation,
                    onChanged: (value) {
                      setState(() {
                        _rehabilitation = value ?? false;
                        _isNextEnabled = _stressReduction ||
                            _eventTraining ||
                            _rehabilitation ||
                            _improveHealth ||
                            _buildStrength ||
                            _boostImmune ||
                            _boostLibido;
                      });
                      widget.onMotivationChanged(
                        _stressReduction,
                        _eventTraining,
                        _rehabilitation,
                        _improveHealth,
                        _buildStrength,
                        _boostImmune,
                        _boostLibido,
                      );
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Improve health',
                        style: TextStyle(color: Colors.white)),
                    value: _improveHealth,
                    onChanged: (value) {
                      setState(() {
                        _improveHealth = value ?? false;
                        _isNextEnabled = _stressReduction ||
                            _eventTraining ||
                            _rehabilitation ||
                            _improveHealth ||
                            _buildStrength ||
                            _boostImmune ||
                            _boostLibido;
                      });
                      widget.onMotivationChanged(
                        _stressReduction,
                        _eventTraining,
                        _rehabilitation,
                        _improveHealth,
                        _buildStrength,
                        _boostImmune,
                        _boostLibido,
                      );
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Building strength and endurance',
                        style: TextStyle(color: Colors.white)),
                    value: _buildStrength,
                    onChanged: (value) {
                      setState(() {
                        _buildStrength = value ?? false;
                        _isNextEnabled = _stressReduction ||
                            _eventTraining ||
                            _rehabilitation ||
                            _improveHealth ||
                            _buildStrength ||
                            _boostImmune ||
                            _boostLibido;
                      });
                      widget.onMotivationChanged(
                        _stressReduction,
                        _eventTraining,
                        _rehabilitation,
                        _improveHealth,
                        _buildStrength,
                        _boostImmune,
                        _boostLibido,
                      );
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Boosting immune system',
                        style: TextStyle(color: Colors.white)),
                    value: _boostImmune,
                    onChanged: (value) {
                      setState(() {
                        _boostImmune = value ?? false;
                        _isNextEnabled = _stressReduction ||
                            _eventTraining ||
                            _rehabilitation ||
                            _improveHealth ||
                            _buildStrength ||
                            _boostImmune ||
                            _boostLibido;
                      });
                      widget.onMotivationChanged(
                        _stressReduction,
                        _eventTraining,
                        _rehabilitation,
                        _improveHealth,
                        _buildStrength,
                        _boostImmune,
                        _boostLibido,
                      );
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Boosting libido',
                        style: TextStyle(color: Colors.white)),
                    value: _boostLibido,
                    onChanged: (value) {
                      setState(() {
                        _boostLibido = value ?? false;
                        _isNextEnabled = _stressReduction ||
                            _eventTraining ||
                            _rehabilitation ||
                            _improveHealth ||
                            _buildStrength ||
                            _boostImmune ||
                            _boostLibido;
                      });
                      widget.onMotivationChanged(
                        _stressReduction,
                        _eventTraining,
                        _rehabilitation,
                        _improveHealth,
                        _buildStrength,
                        _boostImmune,
                        _boostLibido,
                      );
                    },
                  ),
                ],
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
