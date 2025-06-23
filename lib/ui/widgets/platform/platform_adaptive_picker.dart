import 'package:ai_fit_coach/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:numberpicker/numberpicker.dart';

class PlatformAdaptivePicker extends StatefulWidget {
  final String label;
  final int minValue;
  final int maxValue;
  final int initialValue;
  final Function(int) onChanged;

  const PlatformAdaptivePicker({
    super.key,
    required this.label,
    required this.minValue,
    required this.maxValue,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  State<PlatformAdaptivePicker> createState() => _PlatformAdaptivePickerState();
}

class _PlatformAdaptivePickerState extends State<PlatformAdaptivePicker> {
  late int _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 10),
        if (theme.isAndroid)
          NumberPicker(
            value: _currentValue,
            minValue: widget.minValue,
            maxValue: widget.maxValue,
            itemHeight: 50,
            axis: Axis.vertical,
            textStyle: const TextStyle(color: Colors.white, fontSize: 20),
            selectedTextStyle:
                const TextStyle(color: Colors.blue, fontSize: 24),
            onChanged: (value) {
              setState(() {
                _currentValue = value;
              });
              widget.onChanged(value);
            },
          )
        else
          SizedBox(
            height: 150,
            child: CupertinoPicker(
              itemExtent: 32.0,
              onSelectedItemChanged: (int index) {
                setState(() {
                  _currentValue = widget.minValue + index;
                });
                widget.onChanged(_currentValue);
              },
              children: List<Widget>.generate(
                widget.maxValue - widget.minValue + 1,
                (index) => Center(
                  child: Text(
                    '${widget.minValue + index}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              scrollController: FixedExtentScrollController(
                  initialItem: widget.initialValue - widget.minValue),
            ),
          )
      ],
    );
  }
}
