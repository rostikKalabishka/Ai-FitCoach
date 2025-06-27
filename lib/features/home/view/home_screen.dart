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
        MainRoute(),
        ChallengesRoute(),
        WorkoutRoute(),
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
                    label: 'Home',
                    icon: Icon(
                      Icons.home,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'Challenges',
                    icon: Icon(
                      Icons.local_fire_department,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'Workout',
                    icon: Icon(
                      Icons.fitness_center,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'AI assistant',
                    icon: Icon(Icons.smart_toy),
                  ),
                  BottomNavigationBarItem(
                    label: 'Settings',
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
