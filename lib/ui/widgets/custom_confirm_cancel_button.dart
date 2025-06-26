import 'package:flutter/material.dart';

class CustomConfirmCancelButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final EdgeInsetsGeometry padding;

  const CustomConfirmCancelButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.width = 105,
    this.height = 50,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(padding: padding),
        child: Text(
          label,
          style: theme.textTheme.headlineLarge,
        ),
      ),
    );
  }
}