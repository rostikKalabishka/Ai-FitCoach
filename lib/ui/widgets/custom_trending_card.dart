import 'package:flutter/material.dart';

class CustomTrendingCard extends StatelessWidget {
  final String title;

  const CustomTrendingCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
        decoration: BoxDecoration(
          color: theme.colorScheme.tertiary,
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  title,
                  maxLines: 25,
                  softWrap: true,
                  overflow: TextOverflow.visible, 
                  style: theme.textTheme.displaySmall?.copyWith(
                    fontSize: 16,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
