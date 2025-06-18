import 'package:ai_fit_coach/features/auth/auth.dart';
import 'package:ai_fit_coach/features/auth/bloc/auth_bloc.dart';
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
    final themeDark = Theme.of(context);
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
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppConst.welcomeBackground),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 90),
                      Text(
                        'AI FitCoach',
                        style: themeDark.textTheme.labelLarge,
                      ),
                      SizedBox(height: 70),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome,',
                              style: themeDark.textTheme.labelMedium,
                            ),
                            Text(
                              'glad to see you!',
                              style: themeDark.textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 80),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: themeDark.elevatedButtonTheme
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
                              child: Text('Sign In',
                                  style: themeDark.textTheme.labelSmall),
                            ),
                          ),
                          SizedBox(width: 30),
                          SizedBox(
                            height: 50,
                            width: 150,
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
                              child: Text('Sign Up',
                                  style: themeDark.textTheme.labelSmall),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 60,
                            width: 150,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: themeDark.elevatedButtonTheme
                                      .style!.backgroundColor),
                              onPressed: () {
                                context
                                    .read<AuthBloc>()
                                    .add(SignInWithGoogleEvent());
                              },
                              child: Text('Continue with Google',
                                  textAlign: TextAlign.center,
                                  style: themeDark.textTheme.labelSmall),
                            ),
                          ),
                          SizedBox(width: 30),
                          SizedBox(
                            height: 60,
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () {
                                context
                                    .read<AuthBloc>()
                                    .add(SignInWithFacebookEvent());
                              },
                              child: Text('Continue with Facebook',
                                  textAlign: TextAlign.center,
                                  style: themeDark.textTheme.labelSmall),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      SizedBox(
                        height: 60,
                        width: 335,
                        child: ElevatedButton(
                          onPressed: () {
                            context
                                .read<AuthBloc>()
                                .add(SignInWithTwitterEvent());
                          },
                          child: Text('Continue with Twitter',
                              textAlign: TextAlign.center,
                              style: themeDark.textTheme.labelSmall),
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
