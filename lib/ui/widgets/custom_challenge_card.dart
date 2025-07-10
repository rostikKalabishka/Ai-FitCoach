import 'dart:ui';
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomChallengeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final double price;
  final VoidCallback onJoin;
  final VoidCallback? onInfoTap;

  const CustomChallengeCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.price,
    required this.onJoin,
    this.onInfoTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      color: theme.colorScheme.primary,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(24),
                ),
                child: Image.asset(
                  imagePath,
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1.2, sigmaY: 1.2),
                    child: Container(
                      color: Colors.black.withValues(alpha: 0.15),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 8, right: 16, left: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.displaySmall?.copyWith(fontSize: 16),
                  softWrap: true,
                ),
                const SizedBox(width: 16),
                Wrap(
                  spacing: 16,
                  children: [
                    Text(
                      subtitle,
                      style: theme.textTheme.displaySmall?.copyWith(fontSize: 14),
                      softWrap: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8, right: 16, left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 85, 0, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  onPressed: onJoin,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).joinNow,
                        style: theme.textTheme.displaySmall?.copyWith(fontSize: 16),
                        //  softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(width: 8),
                      Text(
                      'Only for \$$price!',
                      style: theme.textTheme.displaySmall?.copyWith(fontSize: 12),
                      softWrap: true,
                    ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.info_outline),
                  onPressed: onInfoTap,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
