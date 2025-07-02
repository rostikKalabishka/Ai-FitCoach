import 'package:ai_fit_coach/features/auth/bloc/auth_bloc.dart';
import 'package:ai_fit_coach/router/router.dart';
import 'package:ai_fit_coach/ui/theme/app_const.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          AutoRouter.of(context)
              .pushAndPopUntil(LoaderRoute(), predicate: (_) => false);
        }
      },
      child: Scaffold(
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
                controller: tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Text('Sign In', style: theme.textTheme.labelSmall),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Text('Sign Up', style: theme.textTheme.labelSmall),
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
      ),
    );
  }
}
