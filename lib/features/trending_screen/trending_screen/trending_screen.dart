import 'package:ai_fit_coach/blocs/ads_bloc/ads_bloc.dart';

import 'package:ai_fit_coach/features/trending_screen/follow_on_social_networks.dart';
import 'package:ai_fit_coach/features/trending_screen/trending_details/bloc/trending_details_bloc.dart';
import 'package:ai_fit_coach/features/trending_screen/trending_screen/bloc/list_bloc.dart';
import 'package:ai_fit_coach/features/trending_screen/trending_details/trending_subscreen.dart';
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:ai_fit_coach/repositories/analytics_repository/abstract_analytics_repository.dart';
import 'package:ai_fit_coach/ui/widgets/ads/banner_ad_widget.dart';
import 'package:ai_fit_coach/ui/widgets/custom_main_screen_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:developer';

@RoutePage()
class TrendingScreen extends StatefulWidget {
  const TrendingScreen({super.key});

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  final AbstractAnalyticsRepository _analyticsRepository =
      GetIt.instance<AbstractAnalyticsRepository>();
  late DateTime _screenEnterTime;

  @override
  void initState() {
    super.initState();
    _screenEnterTime = DateTime.now();
    _analyticsRepository.logScreenView(
      screenName: 'trending_screen',
      screenClass: 'TrendingScreen',
    );
    context.read<ListBloc>().add(LoadListEvent());
  }

  @override
  void dispose() {
    final durationSeconds =
        DateTime.now().difference(_screenEnterTime).inSeconds;
    _analyticsRepository.logEvent(
      name: 'screen_exit',
      parameters: {
        'screen_name': 'trending_screen',
        'duration_seconds': durationSeconds,
      },
    );
    super.dispose();
  }

  void _navigateToSubScreen(String id, RecommendationCategory category) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TrendingSubScreen(
          id: id,
          recommendationCategory: category,
        ),
      ),
    );
  }

  // Винесений метод для обробки натискання на будь-яку картку
  void _handleCardTap(dynamic item, RecommendationCategory category) {
    _analyticsRepository.logEvent(
      name: 'card_click',
      parameters: {
        'screen_name': 'trending_screen',
        'category': category.toString().split('.').last,
        'item_id': item.id,
        'item_title': item.title,
      },
    );

    final adsBloc = context.read<AdsBloc>();
    final adsState = adsBloc.state;

    // Перевіряємо, чи є завантажена міжсторінкова реклама
    if (adsState is AdsLoadedState && adsState.interstitialAd != null) {
      final ad = adsState.interstitialAd!;
      ad.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          log('onAdDismissedFullScreenContent');
          ad.dispose();
          _navigateToSubScreen(item.id, category);
          adsBloc.add(LoadInterstitialAdEvent());
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          log('onAdFailedToShowFullScreenContent: $error');
          ad.dispose();
          _navigateToSubScreen(item.id, category);
          adsBloc.add(LoadInterstitialAdEvent());
        },
      );
      ad.show();
    } else {
      // Якщо реклама не завантажена, одразу переходимо на екран
      _navigateToSubScreen(item.id, category);
      adsBloc.add(LoadInterstitialAdEvent());
    }
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
                  const BannerAdWidget(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      'Trending workout',
                      style: theme.textTheme.labelSmall,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.27,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.trendingWorkoutList.length,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
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
                            onJoin: () => _handleCardTap(trendingWorkout,
                                RecommendationCategory.workout),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      'Food recommendation',
                      style: theme.textTheme.labelSmall,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.27,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.trendingFoodRecommendationList.length,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      itemBuilder: (context, index) {
                        final foodRecommendation =
                            state.trendingFoodRecommendationList[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: CustomMainScreenCard(
                            title: foodRecommendation.title,
                            subtitle: foodRecommendation.foodCategory,
                            description: foodRecommendation.description ?? '',
                            imagePath: foodRecommendation.imageUrl,
                            onJoin: () => _handleCardTap(foodRecommendation,
                                RecommendationCategory.food),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      'Trending challenges',
                      style: theme.textTheme.labelSmall,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.27,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.trendingChallengeList.length,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      itemBuilder: (context, index) {
                        final trendingChallenge =
                            state.trendingChallengeList[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: CustomMainScreenCard(
                            title: trendingChallenge.title,
                            subtitle: trendingChallenge.subtitle,
                            description: trendingChallenge.description!,
                            imagePath: trendingChallenge.imageUrl,
                            onJoin: () => _handleCardTap(trendingChallenge,
                                RecommendationCategory.challenges),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'About us',
                          style: theme.textTheme.labelSmall,
                        ),
                      ),
                      const SizedBox(height: 10),
                      FollowOnSocialNetworks(
                        onSocialNetworkClick: (network) {
                          _analyticsRepository.logEvent(
                            name: 'social_network_click',
                            parameters: {
                              'screen_name': 'trending_screen',
                              'network': network,
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}
