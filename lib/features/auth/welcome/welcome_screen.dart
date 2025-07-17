import 'dart:ui';

import 'package:ai_fit_coach/features/auth/auth.dart';
import 'package:ai_fit_coach/features/auth/bloc/auth_bloc.dart';
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:ai_fit_coach/router/router.dart';
import 'package:ai_fit_coach/ui/theme/app_const.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (BuildContext context, AuthState state) {
        if (state is AuthSuccess) {
          AutoRouter.of(context)
              .pushAndPopUntil(LoaderRoute(), predicate: (_) => false);
        } else if (state is AuthFailure) {}
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppConst.welcomeBackground),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                      child: Container(
                        color: Colors.black.withValues(alpha: 0),
                      ),
                    ),
                  ),
                ],
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 56, vertical: 56),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'AI FitCoach',
                        style: theme.textTheme.displaySmall
                            ?.copyWith(fontSize: 32),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 40),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                S.of(context).welcomeGladToSeeYou,
                                style: theme.textTheme.displaySmall
                                    ?.copyWith(fontSize: 24),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 80),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.2,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: theme.elevatedButtonTheme
                                        .style!.backgroundColor),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => AuthScreen(
                                        initialIndex: 0,
                                      ),
                                    ),
                                  );
                                },
                                child: Text(S.of(context).signIn,
                                    style: theme.textTheme.displaySmall
                                        ?.copyWith(fontSize: 18)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.2,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => AuthScreen(
                                        initialIndex: 1,
                                      ),
                                    ),
                                  );
                                },
                                child: Text(S.of(context).signUp,
                                    style: theme.textTheme.displaySmall
                                        ?.copyWith(fontSize: 18)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.2,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 16),
                          child: ElevatedButton(
                            onPressed: () {
                              context
                                  .read<AuthBloc>()
                                  .add(SignInWithGoogleEvent());
                            },
                            child: Text(S.of(context).continueWithGoogle,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.displaySmall
                                    ?.copyWith(fontSize: 18)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.2,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 16),
                          child: ElevatedButton(
                            onPressed: () {
                              context
                                  .read<AuthBloc>()
                                  .add(SignInWithFacebookEvent());
                            },
                            child: Text(S.of(context).continueWithFacebook,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.displaySmall
                                    ?.copyWith(fontSize: 18)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
