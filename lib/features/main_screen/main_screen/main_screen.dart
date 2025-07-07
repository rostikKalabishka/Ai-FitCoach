import 'package:ai_fit_coach/features/main_screen/follow_on_social_networks.dart';
import 'package:ai_fit_coach/features/main_screen/main_screen/bloc/list_bloc.dart';
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
        title: Text('Home', style: theme.textTheme.labelMedium),
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
                                  'Build serious size and strength in your biceps, triceps, and forearms with this intense arm-blasting workout. Designed to maximize hypertrophy and definition, this session targets all angles of your arm muscles through a mix of isolation and compound movements. Expect supersets, slow negatives, and high volume to fully fatigue your arms and spark growth. ',
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
                                  'Salmon & Avocado Grain Bowl — a nutrient-packed meal combining omega-3-rich grilled salmon, creamy avocado, fiber-loaded quinoa, and fresh greens. Topped with a drizzle of lemon-tahini dressing, this bowl supports brain function, balances blood sugar, and keeps you full and energized. Ideal for a nourishing lunch or dinner that satisfies without slowing you down.',
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
                                  'Screens overload the brain with stimuli. A short break resets your attention span, reduces anxiety, and helps you feel calmer.',
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
