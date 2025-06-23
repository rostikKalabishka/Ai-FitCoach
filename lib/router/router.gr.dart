// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [AiChatScreen]
class AiChatRoute extends PageRouteInfo<AiChatRouteArgs> {
  AiChatRoute({Key? key, String? chatId, List<PageRouteInfo>? children})
      : super(
          AiChatRoute.name,
          args: AiChatRouteArgs(key: key, chatId: chatId),
          initialChildren: children,
        );

  static const String name = 'AiChatRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AiChatRouteArgs>(
        orElse: () => const AiChatRouteArgs(),
      );
      return AiChatScreen(key: args.key, chatId: args.chatId);
    },
  );
}

class AiChatRouteArgs {
  const AiChatRouteArgs({this.key, this.chatId});

  final Key? key;

  final String? chatId;

  @override
  String toString() {
    return 'AiChatRouteArgs{key: $key, chatId: $chatId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AiChatRouteArgs) return false;
    return key == other.key && chatId == other.chatId;
  }

  @override
  int get hashCode => key.hashCode ^ chatId.hashCode;
}

/// generated route for
/// [AuthScreen]
class AuthRoute extends PageRouteInfo<AuthRouteArgs> {
  AuthRoute({
    Key? key,
    required int initialIndex,
    List<PageRouteInfo>? children,
  }) : super(
          AuthRoute.name,
          args: AuthRouteArgs(key: key, initialIndex: initialIndex),
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AuthRouteArgs>();
      return AuthScreen(key: args.key, initialIndex: args.initialIndex);
    },
  );
}

class AuthRouteArgs {
  const AuthRouteArgs({this.key, required this.initialIndex});

  final Key? key;

  final int initialIndex;

  @override
  String toString() {
    return 'AuthRouteArgs{key: $key, initialIndex: $initialIndex}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AuthRouteArgs) return false;
    return key == other.key && initialIndex == other.initialIndex;
  }

  @override
  int get hashCode => key.hashCode ^ initialIndex.hashCode;
}

/// generated route for
/// [ChallengesScreen]
class ChallengesRoute extends PageRouteInfo<void> {
  const ChallengesRoute({List<PageRouteInfo>? children})
      : super(ChallengesRoute.name, initialChildren: children);

  static const String name = 'ChallengesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChallengesScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [LoaderScreen]
class LoaderRoute extends PageRouteInfo<LoaderRouteArgs> {
  LoaderRoute({
    Key? key,
    bool showCircularProgressIndicator = false,
    List<PageRouteInfo>? children,
  }) : super(
          LoaderRoute.name,
          args: LoaderRouteArgs(
            key: key,
            showCircularProgressIndicator: showCircularProgressIndicator,
          ),
          initialChildren: children,
        );

  static const String name = 'LoaderRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoaderRouteArgs>(
        orElse: () => const LoaderRouteArgs(),
      );
      return LoaderScreen(
        key: args.key,
        showCircularProgressIndicator: args.showCircularProgressIndicator,
      );
    },
  );
}

class LoaderRouteArgs {
  const LoaderRouteArgs({this.key, this.showCircularProgressIndicator = false});

  final Key? key;

  final bool showCircularProgressIndicator;

  @override
  String toString() {
    return 'LoaderRouteArgs{key: $key, showCircularProgressIndicator: $showCircularProgressIndicator}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LoaderRouteArgs) return false;
    return key == other.key &&
        showCircularProgressIndicator == other.showCircularProgressIndicator;
  }

  @override
  int get hashCode => key.hashCode ^ showCircularProgressIndicator.hashCode;
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainScreen();
    },
  );
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnboardingScreen();
    },
  );
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsScreen();
    },
  );
}

/// generated route for
/// [UserParametersScreen]
class UserParametersRoute extends PageRouteInfo<void> {
  const UserParametersRoute({List<PageRouteInfo>? children})
      : super(UserParametersRoute.name, initialChildren: children);

  static const String name = 'UserParametersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UserParametersScreen();
    },
  );
}

/// generated route for
/// [WelcomeScreen]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute({List<PageRouteInfo>? children})
      : super(WelcomeRoute.name, initialChildren: children);

  static const String name = 'WelcomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WelcomeScreen();
    },
  );
}

/// generated route for
/// [WorkoutScreen]
class WorkoutRoute extends PageRouteInfo<void> {
  const WorkoutRoute({List<PageRouteInfo>? children})
      : super(WorkoutRoute.name, initialChildren: children);

  static const String name = 'WorkoutRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WorkoutScreen();
    },
  );
}
