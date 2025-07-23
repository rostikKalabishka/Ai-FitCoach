import 'package:flutter/material.dart';

class CustomUserDataField extends StatefulWidget {
  final String hint;
  final IconData icon;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;

  const CustomUserDataField({
    super.key,
    required this.hint,
    required this.icon,
    this.initialValue,
    this.onChanged,
    this.keyboardType = TextInputType.text,
  });

  @override
  _CustomUserDataFieldState createState() => _CustomUserDataFieldState();
}

class _CustomUserDataFieldState extends State<CustomUserDataField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void didUpdateWidget(CustomUserDataField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue) {
      _controller.text = widget.initialValue ?? '';
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      style: theme.textTheme.headlineLarge?.copyWith(
        fontWeight: FontWeight.normal,
      ),
      controller: _controller,
      decoration: InputDecoration(
        hintText: widget.hint,
        suffixIcon: Icon(widget.icon),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: theme.colorScheme.onSurface),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: theme.colorScheme.onSurface),
        ),
      ),
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
    );
  }
}
