// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ai_fit_coach/blocs/settings_cubit/settings_cubit.dart';
import 'package:ai_fit_coach/features/loader/bloc/authentication_bloc.dart';
import 'package:ai_fit_coach/router/router.dart';

@RoutePage()
class LoaderScreen extends StatefulWidget {
  const LoaderScreen({
    super.key,
    this.showCircularProgressIndicator = false,
  });
  final bool showCircularProgressIndicator;

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen>
    with TickerProviderStateMixin {
  double opacityLevel = 1.0;

  late Animation<double> _opacityAnimation;
  late AnimationController _animationController;
  @override
  void initState() {
    if (widget.showCircularProgressIndicator == false) {
      _animationController = AnimationController(
        duration: const Duration(seconds: 2),
        vsync: this,
      );

      _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeIn,
        ),
      );

      _animationController.forward();
    }

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _navigateTo(context, state);
        });

        return Scaffold(
          body: Center(
            child: widget.showCircularProgressIndicator
                ? CircularProgressIndicator.adaptive()
                : FadeTransition(
                    opacity: _opacityAnimation,
                    child: Column(
                      spacing: 5,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AI FitCoach',
                          style: TextStyle(
                            fontSize: 36,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'No excuses - only results',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )
                      ],
                    ),
                  ),
          ),
          backgroundColor: Colors.black,
        );
      },
    );
  }

  void _navigateTo(BuildContext context, AuthenticationState state) {
    final router = AutoRouter.of(context);
    final settingsState =
        context.read<SettingsCubit>().state.isOnboardingShowing;
    if (settingsState == false) {
      debugPrint("Navigating to HomeRoute");
      router.replaceAll([OnboardingRoute()]);
    } else if (state.status == AuthenticationStatus.authenticated) {
      debugPrint("Navigating to HomeRoute");
      router.replaceAll([HomeRoute()]);
    } else if (state.status == AuthenticationStatus.unauthenticated) {
      debugPrint("Navigating to WelcomeRoute");
      router.replaceAll([const WelcomeRoute()]);
    }
  }
}
