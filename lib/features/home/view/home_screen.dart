import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:ai_fit_coach/router/router.dart';
import 'package:ai_fit_coach/ui/widgets/widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                    label: S.of(context).home,
                    icon: Icon(
                      Icons.trending_up_outlined,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: S.of(context).workout,
                    icon: Icon(
                      Icons.fitness_center,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: S.of(context).challenges,
                    icon: Icon(
                      Icons.local_fire_department,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: S.of(context).aiAssistant,
                    icon: Icon(Icons.smart_toy),
                  ),
                  BottomNavigationBarItem(
                    label: S.of(context).settings,
                    icon: Icon(Icons.settings),
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
    tabsRouter.setActiveIndex(index);
  }
}
