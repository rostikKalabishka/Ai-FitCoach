import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:ai_fit_coach/router/router.dart';
import 'package:ai_fit_coach/ui/widgets/widgets.dart';
import 'package:ai_fit_coach/repositories/analytics_repository/abstract_analytics_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AbstractAnalyticsRepository _analyticsRepository =
      GetIt.instance<AbstractAnalyticsRepository>();
  late DateTime _screenEnterTime;

  @override
  void initState() {
    super.initState();
    _screenEnterTime = DateTime.now();
    // Логування перегляду екрану
    _analyticsRepository.logScreenView(
      screenName: 'home_screen',
      screenClass: 'HomeScreen',
    );
  }

  @override
  void dispose() {
    final durationSeconds =
        DateTime.now().difference(_screenEnterTime).inSeconds;
    _analyticsRepository.logEvent(
      name: 'screen_exit',
      parameters: {
        'screen_name': 'home_screen',
        'duration_seconds': durationSeconds,
      },
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        TrendingRoute(),
        WorkoutRoute(),
        ChallengesRoute(),
        AiChatRoute(),
        SettingsRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PlatformNavigationBar(
                tabsRouter: tabsRouter,
                onSelect: (int index) {
                  _openPage(index, tabsRouter);
                },
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    label: S.of(context).trending,
                    icon: const Icon(Icons.trending_up_outlined),
                  ),
                  BottomNavigationBarItem(
                    label: S.of(context).workout,
                    icon: const Icon(Icons.fitness_center),
                  ),
                  BottomNavigationBarItem(
                    label: S.of(context).challenges,
                    icon: const Icon(Icons.local_fire_department),
                  ),
                  BottomNavigationBarItem(
                    label: S.of(context).aiAssistant,
                    icon: const Icon(Icons.smart_toy),
                  ),
                  BottomNavigationBarItem(
                    label: S.of(context).settings,
                    icon: const Icon(Icons.settings),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  void _openPage(int index, TabsRouter tabsRouter) {
    // Логування вибору вкладки
    final tabNames = [
      'trending_tab',
      'workout_tab',
      'challenges_tab',
      'ai_chat_tab',
      'settings_tab',
    ];
    _analyticsRepository.logEvent(
      name: 'tab_select',
      parameters: {
        'tab_name': tabNames[index],
        'screen_name': 'home_screen',
      },
    );
    tabsRouter.setActiveIndex(index);
  }
}
