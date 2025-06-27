import 'package:flutter/material.dart';

class CustomAccountDataField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final double iconSize;

  const CustomAccountDataField({
    required this.hint,
    required this.icon,
    this.iconSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: Icon(icon, size: iconSize),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: theme.colorScheme.onSurface),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: theme.colorScheme.onSurface),
        ),
      ),
    );
  }
}
