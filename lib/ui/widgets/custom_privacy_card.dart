import 'package:flutter/material.dart';

class CustomPrivacyCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const CustomPrivacyCard({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width * 0.95,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon),
                  const SizedBox(width: 10),
                  Text(label, style: theme.textTheme.headlineLarge),
                ],
              ),
              Row(
                children: [
                  Text('Settings', style: theme.textTheme.headlineSmall),
                  const Icon(Icons.arrow_right_outlined),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}