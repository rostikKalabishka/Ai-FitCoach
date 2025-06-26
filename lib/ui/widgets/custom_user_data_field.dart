import 'package:flutter/material.dart';

class CustomUserDataField extends StatelessWidget {
  final String hint;
  final IconData icon;

  const CustomUserDataField({required this.hint, required this.icon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: Icon(icon),
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
