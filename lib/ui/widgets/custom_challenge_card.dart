import 'dart:ui';
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(24)),
                    child: Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.27,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(imagePath),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                Colors.black.withValues(alpha: .3),
                                BlendMode.darken,
                              ),
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 1.2, sigmaY: 1.2),
                              child: Container(
                                color: Colors.black.withValues(alpha: 0.15),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              right: 16, left: 16, top: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    subtitle,
                                    style: theme.textTheme.displaySmall
                                        ?.copyWith(fontSize: 16),
                                    softWrap: true,
                                  ),
                                  Wrap(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.info_outline),
                                        onPressed: onInfoTap,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 24,),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  title,
                                  style: theme.textTheme.displaySmall
                                      ?.copyWith(fontSize: 20),
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(height: 8),
                            Text(
                              'Only for \$ $price!',
                              style: theme.textTheme.displaySmall
                                  ?.copyWith(fontSize: 14),
                            ),
                            ],
                          ),
                        ),
                      ],
                    )),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 4,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                        ),
                        onPressed: onJoin,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          spacing: 8,
                          children: [
                            Text(
                              S.of(context).joinNow,
                              style: theme.textTheme.displaySmall
                                  ?.copyWith(fontSize: 18,),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
