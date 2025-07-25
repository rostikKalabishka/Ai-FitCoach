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
    this.isDefaultMethod = true,
  });
  final bool showCircularProgressIndicator;
  final bool isDefaultMethod;

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen>
    with TickerProviderStateMixin {
  Animation<double>? _opacityAnimation;
  AnimationController? _animationController;
  Future<void>? _pendingNavigationFuture;
  bool _isNavigating = false; // Прапорець для блокування навігації

  @override
  void initState() {
    super.initState();
    debugPrint(
        'LoaderScreen initState: showCircularProgressIndicator = ${widget.showCircularProgressIndicator}');

    if (!widget.showCircularProgressIndicator) {
      _animationController = AnimationController(
        duration: const Duration(seconds: 2),
        vsync: this,
      );

      _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _animationController!,
          curve: Curves.easeIn,
        ),
      );

      _animationController!.forward();
    }
  }

  @override
  void dispose() {
    debugPrint('LoaderScreen dispose called.');
    _animationController?.dispose();
    _pendingNavigationFuture = null; // Очищення запланованої навігації
    _isNavigating = false; // Очищення прапорця навігації
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('LoaderScreen build called.');
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (listenerContext, state) {
        debugPrint(
            'LoaderScreen BlocConsumer Listener: Auth State changed to ${state.status}, userNotNull: ${state.userNotNull}');
        if (state.status != AuthenticationStatus.unknown && !_isNavigating) {
          if (widget.isDefaultMethod) {
            _scheduleNavigation(listenerContext, state);
          }
        }
      },
      builder: (builderContext, state) {
        debugPrint(
            'LoaderScreen BlocConsumer Builder: Auth State = ${state.status}, userNotNull: ${state.userNotNull}');
        if (state.status != AuthenticationStatus.unknown && !_isNavigating) {
          if (!widget.isDefaultMethod) {
            _scheduleNavigation(builderContext, state);
          }
        }

        return Scaffold(
          body: Center(
            child: widget.showCircularProgressIndicator
                ? const CircularProgressIndicator.adaptive()
                : FadeTransition(
                    opacity:
                        _opacityAnimation ?? const AlwaysStoppedAnimation(1.0),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AI FitCoach',
                          style: TextStyle(
                            fontSize: 36,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
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

  // Планування навігації з дебансуванням
  void _scheduleNavigation(BuildContext context, AuthenticationState state) {
    if (_isNavigating || _pendingNavigationFuture != null) {
      debugPrint('LoaderScreen: Навігація вже виконується. Пропускаємо.');
      return;
    }

    if (!mounted) {
      debugPrint('LoaderScreen: Віджет не змонтовано. Пропускаємо навігацію.');
      return;
    }

    _isNavigating = true; // Встановлення блокування навігації
    _pendingNavigationFuture = Future.delayed(
      const Duration(milliseconds: 300), // Затримка для дебансування
      () {
        // Перевіряємо найновіший стан перед навігацією
        final latestState = context.read<AuthenticationBloc>().state;
        debugPrint(
            'LoaderScreen: Виконання запланованої навігації. Останній стан: ${latestState.status}, userNotNull: ${latestState.userNotNull}');
        _navigateTo(context, latestState);
      },
    ).whenComplete(() {
      _isNavigating = false; // Очищення блокування навігації
      _pendingNavigationFuture = null; // Очищення запланованого майбутнього
      debugPrint('LoaderScreen: Навігація завершена/очищена.');
    });
  }

  void _navigateTo(BuildContext context, AuthenticationState state) {
    if (!mounted) {
      debugPrint('LoaderScreen: Віджет не змонтовано під час навігації.');
      return;
    }

    final router = AutoRouter.of(context);
    final settingsCubitState = context.read<SettingsCubit>().state;

    debugPrint('--- _navigateTo ПОЧАТОК ---');
    debugPrint('Поточний стек: ${router.stack.map((r) => r.name).toList()}');
    debugPrint('Статус автентифікації: ${state.status}');
    debugPrint('Показ онбордингу: ${settingsCubitState.isOnboardingShowing}');
    debugPrint(
        'Показ параметрів користувача: ${settingsCubitState.isUserParametersScreenShown}');
    debugPrint('Користувач: ${state.userNotNull ? "наявний" : "відсутній"}');

    PageRouteInfo? targetRoute;

    // Логіка визначення цільового маршруту
    if (!settingsCubitState.isOnboardingShowing) {
      debugPrint("Умова: Онбординг не показано. Ціль: OnboardingRoute.");
      targetRoute = const OnboardingRoute();
    } else if (state.status == AuthenticationStatus.authenticated &&
        state.userNotNull) {
      debugPrint("Умова: Користувач автентифікований.");
      final bool needsUserParameters =
          !settingsCubitState.isUserParametersScreenShown ||
              (state.user?.userData.isEmpty ?? true);

      if (needsUserParameters) {
        debugPrint(
            "Умова: Потрібні параметри користувача. Ціль: UserParametersRoute.");
        targetRoute = const UserParametersRoute();
      } else {
        debugPrint(
            "Умова: Користувач автентифікований і параметри оброблено. Ціль: HomeRoute.");
        targetRoute = HomeRoute();
      }
    } else if (state.status == AuthenticationStatus.unauthenticated) {
      debugPrint("Умова: Користувач не автентифікований. Ціль: WelcomeRoute.");
      targetRoute = const WelcomeRoute();
    } else {
      debugPrint(
          "Умова: Статус автентифікації невідомий або необроблений. Цільового маршруту немає.");
      return; // Не виконуємо навігацію, якщо стан невідомий
    }

    if (router.current.name != targetRoute.routeName) {
      // Використовуємо pushAndPopUntil для безпечної заміни стеку
      router.pushAndPopUntil(
        targetRoute,
        predicate: (route) => false, // Очищення всього стеку
      );
      debugPrint("Навігація до ${targetRoute.routeName}");
    } else {
      debugPrint("Вже на ${targetRoute.routeName}. Навігація не потрібна.");
    }

    debugPrint('--- _navigateTo КІНЕЦЬ ---');
  }
}
