import 'package:ai_fit_coach/router/router.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    tabController =
        TabController(initialIndex: initialIndex, length: 5, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AutoTabsRouter(
      routes: [
        FoodChallengesRoute(),
        ExerciseChallengesRoute(),
        SleepAndRelaxChallengesRoute(),
        HydrationChallengesRoute(),
        MentalChallengesRoute(),
      ],
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: theme.appBarTheme.backgroundColor,
            title: Text('Challenges', style: theme.textTheme.labelMedium),
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
                    _buildTab('Food', 0),
                    _buildTab('Exercise', 1),
                    _buildTab('Sleep and Relax', 2),
                    _buildTab('Hydration', 3),
                    _buildTab('Mental', 4),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
                            const SizedBox(height: 8),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    FoodChallengesScreen(),
                    ExerciseChallengesScreen(),
                    SleepAndRelaxChallengesScreen(),
                    HydrationChallengesScreen(),
                    MentalChallengesScreen(),
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
              color: isSelected ? const Color.fromARGB(255, 87, 48, 69) : theme.colorScheme.onTertiary,
              width: 3,
            ),
          ),
        ),
        child: Text(
          title,
          style: theme.textTheme.headlineLarge?.copyWith(
            color: isSelected ? theme.textTheme.headlineLarge?.color : Colors.grey,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
