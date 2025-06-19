import 'package:ai_fit_coach/features/user_parameters/widgets/continue_button.dart';
import 'package:ai_fit_coach/ui/ui.dart';
import 'package:flutter/material.dart';

class BodyParametersPage extends StatefulWidget {
  final PageController pageController;
  final void Function(double, double, int) onParametersChanged;

  const BodyParametersPage({
    super.key,
    required this.pageController,
    required this.onParametersChanged,
  });

  @override
  State<BodyParametersPage> createState() => _BodyParametersPageState();
}

class _BodyParametersPageState extends State<BodyParametersPage> {
  double _weight = 65;
  double _height = 170;
  int _age = 18;
  bool _isNextEnabled = false;

  @override
  Widget build(BuildContext context) {
    _isNextEnabled = _weight > 0 && _height > 0 && _age > 0;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Body parameters',
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
                  PlatformAdaptivePicker(
                    label: 'YOUR WEIGHT:',
                    minValue: 0,
                    maxValue: 500,
                    initialValue: _weight.toInt(),
                    onChanged: (value) {
                      setState(() {
                        _weight = value.toDouble();
                        _isNextEnabled = _weight > 0 && _height > 0 && _age > 0;
                      });
                      widget.onParametersChanged(_weight, _height, _age);
                    },
                  ),
                  const SizedBox(height: 20),
                  PlatformAdaptivePicker(
                    label: 'YOUR HEIGHT:',
                    minValue: 0,
                    maxValue: 300,
                    initialValue: _height.toInt(),
                    onChanged: (value) {
                      setState(() {
                        _height = value.toDouble();
                        _isNextEnabled = _weight > 0 && _height > 0 && _age > 0;
                      });
                      widget.onParametersChanged(_weight, _height, _age);
                    },
                  ),
                  const SizedBox(height: 20),
                  PlatformAdaptivePicker(
                    label: 'YOUR AGE:',
                    minValue: 0,
                    maxValue: 200,
                    initialValue: _age,
                    onChanged: (value) {
                      setState(() {
                        _age = value.toInt();
                        _isNextEnabled = _weight > 0 && _height > 0 && _age > 0;
                      });
                      widget.onParametersChanged(_weight, _height, _age);
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
