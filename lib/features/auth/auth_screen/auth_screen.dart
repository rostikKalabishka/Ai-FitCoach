import 'package:ai_fit_coach/features/auth/sign_in/sign_in_screen.dart';

import 'package:ai_fit_coach/generated/l10n.dart';

import 'package:ai_fit_coach/ui/theme/app_const.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../auth.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key, required this.initialIndex});
  final int initialIndex;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        initialIndex: widget.initialIndex, length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Column(
        children: [
          Text(
            'AI FitCoach',
            style: theme.textTheme.labelLarge,
          ),
          SizedBox(
            height: 250,
            width: 250,
            child: Image.asset(
              theme.brightness == Brightness.dark
                  ? AppConst.logo
                  : AppConst.logo2,
            ),
          ),
          TabBar(
              indicatorColor:
                  theme.bottomNavigationBarTheme.unselectedItemColor,
              controller: tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(S.of(context).signIn,
                      style: theme.textTheme.labelSmall),
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(S.of(context).signUp,
                      style: theme.textTheme.labelSmall),
                ),
              ]),
          Expanded(
              child: TabBarView(
            controller: tabController,
            children: [
              SignInScreen(),
              SignUpScreen(),
            ],
          ))
        ],
      ),
    );
  }
}
