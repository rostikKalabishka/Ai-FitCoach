import 'package:ai_fit_coach/features/user_parameters/widgets/widgets.dart';
import 'package:ai_fit_coach/ui/ui.dart';
import 'package:flutter/material.dart';

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
  @override
  void initState() {
    super.initState();
    _weight = 65;
    _height = 170;
    _age = 18;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Body parameters',
            style: TextStyle(color: Colors.white, fontSize: 20)),
        backgroundColor: Colors.black,
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
                    label: 'YOUR WEIGHT:',
                    minValue: 0,
                    maxValue: 500,
                    initialValue: _weight.toInt(),
                    onChanged: (value) {
                      setState(() {
                        _weight = value;
                        _isNextEnabled = _weight > 0 && _height > 0 && _age > 0;
                      });
                      widget.onParametersChanged(_weight, _height, _age);
                    },
                  ),
                  PlatformAdaptivePicker(
                    label: 'YOUR HEIGHT:',
                    minValue: 0,
                    maxValue: 300,
                    initialValue: _height.toInt(),
                    onChanged: (value) {
                      setState(() {
                        _height = value;
                        _isNextEnabled = _weight > 0 && _height > 0 && _age > 0;
                      });
                      widget.onParametersChanged(_weight, _height, _age);
                    },
                  ),
                  PlatformAdaptivePicker(
                    label: 'YOUR AGE:',
                    minValue: 0,
                    maxValue: 200,
                    initialValue: _age,
                    onChanged: (value) {
                      setState(() {
                        _age = value;
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
