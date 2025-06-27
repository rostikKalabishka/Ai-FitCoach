import 'package:ai_fit_coach/ui/ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformNavigationBar extends StatelessWidget {
  const PlatformNavigationBar(
      {super.key,
      required this.tabsRouter,
      required this.onSelect,
      required this.items});
  final TabsRouter tabsRouter;
  final Function(int index) onSelect;
  final List<BottomNavigationBarItem> items;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final selectedIndex = tabsRouter.activeIndex;
    if (theme.isAndroid) {
      return BottomNavigationBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        items: items,
        currentIndex: selectedIndex,
        selectedLabelStyle: theme.bottomNavigationBarTheme.selectedLabelStyle,
        unselectedItemColor: theme.bottomNavigationBarTheme.unselectedItemColor,
        onTap: onSelect,
      );
    }
    return CupertinoTabBar(
      activeColor: theme.colorScheme.primary,
      items: items,
      currentIndex: selectedIndex,
      backgroundColor: theme.scaffoldBackgroundColor,
      onTap: onSelect,
    );
  }
}
