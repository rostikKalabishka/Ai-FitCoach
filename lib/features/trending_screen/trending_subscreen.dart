import 'package:ai_fit_coach/common/api/model/challenges/challenge_item.dart';
import 'package:ai_fit_coach/common/api/model/home/food_recommendation_item.dart';
import 'package:ai_fit_coach/common/api/model/workout/workout_item.dart';
import 'package:ai_fit_coach/ui/ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TrendingSubScreen extends StatefulWidget {
  const TrendingSubScreen(
    this.trendingWorkoutList,
    this.trendingChallenges,
    this.foodRecommandation, {
    super.key,
  });

  final WorkoutItem trendingWorkoutList;
  final ChallengeItem trendingChallenges;
  final FoodRecommendationItem foodRecommandation;

  @override
  State<TrendingSubScreen> createState() => _TrendingSubScreenState();
}

class _TrendingSubScreenState extends State<TrendingSubScreen> {
  bool get isWorkout => widget.trendingWorkoutList.title.isNotEmpty;
  bool get isChallenge => widget.trendingChallenges.title.isNotEmpty;
  bool get isFood => widget.foodRecommandation.title.isNotEmpty;

  String get title {
    if (isWorkout) return widget.trendingWorkoutList.title;
    if (isChallenge) return widget.trendingChallenges.title;
    return widget.foodRecommandation.title;
  }

  String get subtitle {
    if (isWorkout) {
      return '';
    } else if (isChallenge) {
      return widget.trendingChallenges.subtitle;
    } else {
      return widget.foodRecommandation.foodCategory;
    }
  }

  String get imageUrl {
    if (isWorkout) return widget.trendingWorkoutList.imageUrl;
    if (isChallenge) return widget.trendingChallenges.imageUrl;
    return widget.foodRecommandation.imageUrl;
  }

  String get description {
    if (isWorkout) return widget.trendingWorkoutList.subtitle;
    if (isChallenge) return widget.trendingChallenges.description ?? '';
    return widget.foodRecommandation.description;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 350,
                  width: MediaQuery.of(context).size.width,
                  child: Image(
                    image: CachedNetworkImageProvider(imageUrl),
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      'assets/images/challenges/exercise/2.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.red,
                      size: 28,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 310),
                  child: Container(
                    height: 160,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.tertiary,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Text(
                                  title,
                                  style: theme.textTheme.displaySmall?.copyWith(
                                    fontSize: 24,
                                    color: theme.colorScheme.onSurface,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 4, top: 4),
                                child: Text(
                                  subtitle,
                                  style: theme.textTheme.displaySmall?.copyWith(
                                    fontSize: 16,
                                    color: theme.colorScheme.onSurface,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.favorite_border_outlined),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.12,
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: theme.colorScheme.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Start',
                                  style: theme.textTheme.displaySmall
                                      ?.copyWith(fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Text(
                description,
                style: theme.textTheme.bodyLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recommendations',
                    style: theme.textTheme.labelSmall,
                  ),
                  const SizedBox(height: 10),
                  CustomSubcategoryWorkout(
                    title: 'Example 1',
                    imagePath: 'assets/images/challenges/exercise/2.png',
                    repsNumber: 'reps | duration | sets | portions',
                  ),
                  CustomSubcategoryWorkout(
                    title: 'Example 2',
                    imagePath: 'assets/images/challenges/exercise/2.png',
                    repsNumber: 'reps | duration | sets | portions',
                  ),
                  CustomSubcategoryWorkout(
                    title: 'Example 2',
                    imagePath: 'assets/images/challenges/exercise/2.png',
                    repsNumber: 'reps | duration | sets | portions',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
