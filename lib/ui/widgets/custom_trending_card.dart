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
        height: MediaQuery.of(context).size.height * 0.07,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                  maxLines: 3,
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
