import 'package:flutter/material.dart';

import '../../auth.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0, length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final themeDark = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeDark.appBarTheme.backgroundColor,
      ),
      backgroundColor: themeDark.scaffoldBackgroundColor,
      body: Column(
        children: [
          Text('AI FitCoach', style: themeDark.textTheme.labelLarge,),
          SizedBox(
            height: 250,
            width: 250,
            child: Image.asset(
              'assets/images/logo.jpg',
            ),
          ),
          TabBar(
              controller: tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Text('Sign In', style: themeDark.textTheme.labelSmall),
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Text('Sign Up', style: themeDark.textTheme.labelSmall),
                ),
              ]),
          Expanded(
              child: TabBarView(
                  controller: tabController,
                  children: [SignInScreen(), SignUpScreen()]))
        ],
      ),
    );
  }
}
