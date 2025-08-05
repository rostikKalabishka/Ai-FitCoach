import 'package:ai_fit_coach/common/api/model/challenges/challenge_item.dart';
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:ai_fit_coach/repositories/analytics_repository/abstract_analytics_repository.dart';
import 'package:ai_fit_coach/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../challenges.dart';

@RoutePage()
class ChallengesScreen extends StatefulWidget {
  const ChallengesScreen({super.key});

  @override
  State<ChallengesScreen> createState() => _ChallengesScreenState();
}

class _ChallengesScreenState extends State<ChallengesScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  int initialIndex = 0;
  final AbstractAnalyticsRepository _analyticsRepository =
      GetIt.instance<AbstractAnalyticsRepository>();
  late DateTime _screenEnterTime;

  String _categoryType(CategoryType categoryType) {
    switch (categoryType) {
      case CategoryType.exercise:
        return 'exercise';
      case CategoryType.food:
        return 'food';
      case CategoryType.sleepAndRelax:
        return 'sleepAndRelax';
      case CategoryType.mental:
        return 'mental';
      case CategoryType.hydration:
        return 'hydration';
    }
  }

  @override
  void initState() {
    super.initState();
    _screenEnterTime = DateTime.now();

    _analyticsRepository.logScreenView(
      screenName: 'challenges_screen',
      screenClass: 'ChallengesScreen',
    );
    tabController =
        TabController(initialIndex: initialIndex, length: 5, vsync: this);
    tabController.addListener(() {
      setState(() {
        final tabNames = [
          'food_tab',
          'exercise_tab',
          'sleepAndRelax_tab',
          'hydration_tab',
          'mental_tab',
        ];
        _analyticsRepository.logEvent(
          name: 'tab_select',
          parameters: {
            'screen_name': 'challenges_screen',
            'tab_name': tabNames[tabController.index],
          },
        );
      });
    });
  }

  @override
  void dispose() {
    // Логування виходу з екрану з тривалістю
    final durationSeconds =
        DateTime.now().difference(_screenEnterTime).inSeconds;
    _analyticsRepository.logEvent(
      name: 'screen_exit',
      parameters: {
        'screen_name': 'challenges_screen',
        'duration_seconds': durationSeconds,
      },
    );
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AutoTabsRouter(
      routes: [
        FoodChallengesRoute(categoryType: 'food'),
        ExerciseChallengesRoute(categoryType: 'exercise'),
        SleepAndRelaxChallengesRoute(categoryType: 'sleepAndRelax'),
        HydrationChallengesRoute(categoryType: 'hydration'),
        MentalChallengesRoute(categoryType: 'mental'),
      ],
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: theme.appBarTheme.backgroundColor,
            title: Text(S.of(context).challenges,
                style: theme.textTheme.labelMedium),
            centerTitle: true,
          ),
          backgroundColor: theme.scaffoldBackgroundColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    _buildTab(S.of(context).food, 0),
                    _buildTab(S.of(context).exercise, 1),
                    _buildTab(S.of(context).sleepAndRelax, 2),
                    _buildTab(S.of(context).hydration, 3),
                    _buildTab(S.of(context).mental, 4),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    FoodChallengesScreen(
                        categoryType: _categoryType(CategoryType.food)),
                    ExerciseChallengesScreen(
                        categoryType: _categoryType(CategoryType.exercise)),
                    SleepAndRelaxChallengesScreen(
                        categoryType:
                            _categoryType(CategoryType.sleepAndRelax)),
                    HydrationChallengesScreen(
                        categoryType: _categoryType(CategoryType.hydration)),
                    MentalChallengesScreen(
                        categoryType: _categoryType(CategoryType.mental)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTab(String title, int index) {
    final theme = Theme.of(context);
    final isSelected = tabController.index == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          tabController.index = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected
                  ? theme.bottomNavigationBarTheme.unselectedItemColor!
                  : theme.colorScheme.onTertiary,
              width: 3,
            ),
          ),
        ),
        child: Text(
          title,
          style: theme.textTheme.headlineLarge?.copyWith(
            color:
                isSelected ? theme.textTheme.headlineLarge?.color : Colors.grey,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
