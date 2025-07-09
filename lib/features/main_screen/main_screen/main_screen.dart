import 'package:ai_fit_coach/features/main_screen/follow_on_social_networks.dart';
import 'package:ai_fit_coach/features/main_screen/main_screen/bloc/list_bloc.dart';
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:ai_fit_coach/ui/theme/app_const.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../ui/widgets/custom_main_screen_card.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

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
        title: Text(S.of(context).home, style: theme.textTheme.labelMedium),
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
                    height: 250,
                    width: double.infinity,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.trendingWorkoutList.length,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        itemBuilder: (context, index) {
                        final trendingWorkout = state.trendingWorkoutList[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: CustomMainScreenCard(
                              title: trendingWorkout.title,
                              subtitle: '',
                              description:
                                  trendingWorkout.subtitle,
                              imagePath: AppConst.challengeFood1Image,
                              onJoin: () {},
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
                          final foodRecommandation = state.trendingFoodRecommendationList[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: CustomMainScreenCard(
                              title: foodRecommandation.title,
                              subtitle: foodRecommandation.foodCategory,
                              description:
                                  foodRecommandation.description,
                              imagePath: AppConst.challengeFood1Image,
                              onJoin: () {},
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
                    height: 250,
                    width: double.infinity,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.trendingChallengeList.length,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        itemBuilder: (context, index) {
                          final trendingChallenges = state.trendingChallengeList[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: CustomMainScreenCard(
                              title: trendingChallenges.title,
                              subtitle: trendingChallenges.subtitle,
                              description:
                                  trendingChallenges.description!,
                              imagePath: AppConst.challengeFood1Image,
                              onJoin: () {},
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
