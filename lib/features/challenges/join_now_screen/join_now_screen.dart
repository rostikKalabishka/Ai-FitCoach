import 'package:ai_fit_coach/common/api/model/challenges/challenge_item.dart';
import 'package:ai_fit_coach/ui/theme/app_const.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

@RoutePage()
class JoinNowScreen extends StatefulWidget {
  const JoinNowScreen({super.key, required this.challengeItem});
  final ChallengeItem challengeItem;

  @override
  State<JoinNowScreen> createState() => _JoinNowScreenState();
}

class _JoinNowScreenState extends State<JoinNowScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final challengeItem = widget.challengeItem;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: Image(
                      image: CachedNetworkImageProvider(challengeItem.imageUrl),
                      height: 400,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.red,
                          size: 28,
                        )),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          challengeItem.title,
                          style: theme.textTheme.labelSmall,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.local_fire_department,
                          color: Colors.deepOrange,
                        ),
                        const SizedBox(width: 5),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            challengeItem.subtitle,
                            style: theme.textTheme.headlineMedium,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'JOIN CHALLENGE',
                        style: theme.textTheme.displaySmall,
                      ),
                      Text(
                        'Only for \$ ${challengeItem.price}',
                        style: theme.textTheme.displaySmall,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  'One-time payment. Once finished, the challenge will be removed from your list.',
                  style: theme.textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 5),
              Divider(),
              SizedBox(height: 10),
              Text(
                "WHAT YOU'LL GET",
                style: theme.textTheme.headlineMedium,
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  Row(
                    spacing: 20,
                    children: [
                      Icon(
                        Icons.self_improvement,
                        size: 45,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Grow confidence',
                            style: theme.textTheme.headlineMedium,
                          ),
                          Text(
                            'Tame your inner critic',
                            style: theme.textTheme.headlineSmall,
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    spacing: 20,
                    children: [
                      Icon(
                        Icons.psychology_alt,
                        size: 45,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Reduce anxiety',
                            style: theme.textTheme.headlineMedium,
                          ),
                          Text(
                            'Improved mental health',
                            style: theme.textTheme.headlineSmall,
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    spacing: 20,
                    children: [
                      Icon(
                        Icons.favorite_outline,
                        size: 45,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Develop self-compassion',
                            style: theme.textTheme.headlineMedium,
                          ),
                          Text(
                            'Kindness towards yourself',
                            style: theme.textTheme.headlineSmall,
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    spacing: 20,
                    children: [
                      Icon(
                        Icons.remove_red_eye_outlined,
                        size: 45,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Improve focus',
                            style: theme.textTheme.headlineMedium,
                          ),
                          Text(
                            'Less brain fog from sugar highs/lows',
                            style: theme.textTheme.headlineSmall,
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    spacing: 20,
                    children: [
                      Icon(
                        Icons.lock_clock,
                        size: 45,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Strengthen willpower',
                            style: theme.textTheme.headlineMedium,
                          ),
                          Text(
                            'practice daily discipline',
                            style: theme.textTheme.headlineSmall,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
