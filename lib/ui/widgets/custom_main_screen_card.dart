import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
          image: CachedNetworkImageProvider(imagePath),
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
              style:
                  theme.textTheme.headlineLarge?.copyWith(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 16),
            FractionallySizedBox(
              widthFactor: 1,
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style:
                  theme.textTheme.headlineLarge?.copyWith(color: Colors.white, fontSize: 24),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              description,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            const Spacer(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: onJoin,
                child: Text(S.of(context).start,
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
