import 'package:ai_fit_coach/common/api/model/challenges/challenge_item.dart';
import 'package:ai_fit_coach/common/api/model/home/food_recommendation_item.dart';
import 'package:ai_fit_coach/common/api/model/workout/workout_item.dart';
import 'package:ai_fit_coach/features/trending_screen/follow_on_social_networks.dart';
import 'package:ai_fit_coach/features/trending_screen/trending_screen/bloc/list_bloc.dart';
import 'package:ai_fit_coach/features/trending_screen/trending_subscreen.dart';
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../ui/widgets/custom_main_screen_card.dart';

@RoutePage()
class TrendingScreen extends StatefulWidget {
  const TrendingScreen({super.key});

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  @override
  void initState() {
    context.read<ListBloc>().add(LoadListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Text(S.of(context).trending, style: theme.textTheme.labelMedium),
        centerTitle: true,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: BlocBuilder<ListBloc, ListState>(
        builder: (context, state) {
          if (state is ListHomeLoaded) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      'Trending workout',
                      style: theme.textTheme.labelSmall,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.27,
                    width: double.infinity,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.trendingWorkoutList.length,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        itemBuilder: (context, index) {
                          final trendingWorkout =
                              state.trendingWorkoutList[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: CustomMainScreenCard(
                              title: trendingWorkout.title,
                              subtitle: '',
                              description: trendingWorkout.subtitle,
                              imagePath: trendingWorkout.imageUrl,
                              onJoin: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => TrendingSubScreen(
                                          trendingWorkout,
                                          ChallengeItem.empty(),
                                          FoodRecommendationItem.empty(),
                                        )));
                              },
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      'Food recommendation',
                      style: theme.textTheme.labelSmall,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.27,
                    width: double.infinity,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.trendingFoodRecommendationList.length,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        itemBuilder: (context, index) {
                          final foodRecommandation =
                              state.trendingFoodRecommendationList[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: CustomMainScreenCard(
                              title: foodRecommandation.title,
                              subtitle: foodRecommandation.foodCategory,
                              description: foodRecommandation.description,
                              imagePath: foodRecommandation.imageUrl,
                              onJoin: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => TrendingSubScreen(
                                        WorkoutItem.empty(),
                                        ChallengeItem.empty(),
                                        foodRecommandation)));
                              },
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      'Trending challenges',
                      style: theme.textTheme.labelSmall,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.27,
                    width: double.infinity,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.trendingChallengeList.length,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        itemBuilder: (context, index) {
                          final trendingChallenges =
                              state.trendingChallengeList[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: CustomMainScreenCard(
                              title: trendingChallenges.title,
                              subtitle: trendingChallenges.subtitle,
                              description: trendingChallenges.description!,
                              imagePath: trendingChallenges.imageUrl,
                              onJoin: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => TrendingSubScreen(
                                        WorkoutItem.empty(),
                                        trendingChallenges,
                                        FoodRecommendationItem.empty())));
                              },
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Text(
                          'About us',
                          style: theme.textTheme.labelSmall,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FollowOnSocialNetworks(),
                    ],
                  )
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}
