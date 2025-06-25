import 'package:flutter/material.dart';

class CustomMainScreenCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final String imagePath;
  final VoidCallback onJoin;

  const CustomMainScreenCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imagePath,
    required this.onJoin,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
        child: Container(
      height: 250,
      width: MediaQuery.of(context).size.width * 0.95,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withValues(alpha: .3),
            BlendMode.darken,
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Colors.black.withValues(alpha: 0.25),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subtitle,
              style: theme.textTheme.headlineLarge
                  ?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 16),
            FractionallySizedBox(
              widthFactor: 0.5,
              child: Text(
                title,
                style: theme.textTheme.labelMedium
                    ?.copyWith(color: Colors.white),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              description,
              style: theme.textTheme.headlineMedium
                  ?.copyWith(color: Colors.white),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 85, 0, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: onJoin,
                child: Text('Start',
                    style: theme.textTheme.labelSmall
                        ?.copyWith(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
