// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [AccountManagementScreen]
class AccountManagementRoute extends PageRouteInfo<void> {
  const AccountManagementRoute({List<PageRouteInfo>? children})
      : super(AccountManagementRoute.name, initialChildren: children);

  static const String name = 'AccountManagementRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AccountManagementScreen();
    },
  );
}

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
/// [AutomaticActivityTrackingScreen]
class AutomaticActivityTrackingRoute extends PageRouteInfo<void> {
  const AutomaticActivityTrackingRoute({List<PageRouteInfo>? children})
      : super(AutomaticActivityTrackingRoute.name, initialChildren: children);

  static const String name = 'AutomaticActivityTrackingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AutomaticActivityTrackingScreen();
    },
  );
}

/// generated route for
/// [CalorieGoalScreen]
class CalorieGoalRoute extends PageRouteInfo<void> {
  const CalorieGoalRoute({List<PageRouteInfo>? children})
      : super(CalorieGoalRoute.name, initialChildren: children);

  static const String name = 'CalorieGoalRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CalorieGoalScreen();
    },
  );
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
/// [DeleteYourAccountScreen]
class DeleteYourAccountRoute extends PageRouteInfo<void> {
  const DeleteYourAccountRoute({List<PageRouteInfo>? children})
      : super(DeleteYourAccountRoute.name, initialChildren: children);

  static const String name = 'DeleteYourAccountRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DeleteYourAccountScreen();
    },
  );
}

/// generated route for
/// [DifficultyLevelScreen]
class DifficultyLevelRoute extends PageRouteInfo<void> {
  const DifficultyLevelRoute({List<PageRouteInfo>? children})
      : super(DifficultyLevelRoute.name, initialChildren: children);

  static const String name = 'DifficultyLevelRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DifficultyLevelScreen();
    },
  );
}

/// generated route for
/// [DoNotDisturbModeScreen]
class DoNotDisturbModeRoute extends PageRouteInfo<void> {
  const DoNotDisturbModeRoute({List<PageRouteInfo>? children})
      : super(DoNotDisturbModeRoute.name, initialChildren: children);

  static const String name = 'DoNotDisturbModeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DoNotDisturbModeScreen();
    },
  );
}

/// generated route for
/// [ExerciseChallengesScreen]
class ExerciseChallengesRoute
    extends PageRouteInfo<ExerciseChallengesRouteArgs> {
  ExerciseChallengesRoute({
    Key? key,
    required String categoryType,
    List<PageRouteInfo>? children,
  }) : super(
          ExerciseChallengesRoute.name,
          args: ExerciseChallengesRouteArgs(
            key: key,
            categoryType: categoryType,
          ),
          initialChildren: children,
        );

  static const String name = 'ExerciseChallengesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ExerciseChallengesRouteArgs>();
      return ExerciseChallengesScreen(
        key: args.key,
        categoryType: args.categoryType,
      );
    },
  );
}

class ExerciseChallengesRouteArgs {
  const ExerciseChallengesRouteArgs({this.key, required this.categoryType});

  final Key? key;

  final String categoryType;

  @override
  String toString() {
    return 'ExerciseChallengesRouteArgs{key: $key, categoryType: $categoryType}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ExerciseChallengesRouteArgs) return false;
    return key == other.key && categoryType == other.categoryType;
  }

  @override
  int get hashCode => key.hashCode ^ categoryType.hashCode;
}

/// generated route for
/// [FitnessGoalScreen]
class FitnessGoalRoute extends PageRouteInfo<void> {
  const FitnessGoalRoute({List<PageRouteInfo>? children})
      : super(FitnessGoalRoute.name, initialChildren: children);

  static const String name = 'FitnessGoalRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FitnessGoalScreen();
    },
  );
}

/// generated route for
/// [FoodChallengesScreen]
class FoodChallengesRoute extends PageRouteInfo<FoodChallengesRouteArgs> {
  FoodChallengesRoute({
    Key? key,
    required String categoryType,
    List<PageRouteInfo>? children,
  }) : super(
          FoodChallengesRoute.name,
          args: FoodChallengesRouteArgs(key: key, categoryType: categoryType),
          initialChildren: children,
        );

  static const String name = 'FoodChallengesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FoodChallengesRouteArgs>();
      return FoodChallengesScreen(
        key: args.key,
        categoryType: args.categoryType,
      );
    },
  );
}

class FoodChallengesRouteArgs {
  const FoodChallengesRouteArgs({this.key, required this.categoryType});

  final Key? key;

  final String categoryType;

  @override
  String toString() {
    return 'FoodChallengesRouteArgs{key: $key, categoryType: $categoryType}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FoodChallengesRouteArgs) return false;
    return key == other.key && categoryType == other.categoryType;
  }

  @override
  int get hashCode => key.hashCode ^ categoryType.hashCode;
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
/// [HydrationChallengesScreen]
class HydrationChallengesRoute
    extends PageRouteInfo<HydrationChallengesRouteArgs> {
  HydrationChallengesRoute({
    Key? key,
    required String categoryType,
    List<PageRouteInfo>? children,
  }) : super(
          HydrationChallengesRoute.name,
          args: HydrationChallengesRouteArgs(
            key: key,
            categoryType: categoryType,
          ),
          initialChildren: children,
        );

  static const String name = 'HydrationChallengesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HydrationChallengesRouteArgs>();
      return HydrationChallengesScreen(
        key: args.key,
        categoryType: args.categoryType,
      );
    },
  );
}

class HydrationChallengesRouteArgs {
  const HydrationChallengesRouteArgs({this.key, required this.categoryType});

  final Key? key;

  final String categoryType;

  @override
  String toString() {
    return 'HydrationChallengesRouteArgs{key: $key, categoryType: $categoryType}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! HydrationChallengesRouteArgs) return false;
    return key == other.key && categoryType == other.categoryType;
  }

  @override
  int get hashCode => key.hashCode ^ categoryType.hashCode;
}

/// generated route for
/// [JoinNowScreen]
class JoinNowRoute extends PageRouteInfo<void> {
  const JoinNowRoute({List<PageRouteInfo>? children})
      : super(JoinNowRoute.name, initialChildren: children);

  static const String name = 'JoinNowRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const JoinNowScreen();
    },
  );
}

/// generated route for
/// [LanguageLocalizationScreen]
class LanguageLocalizationRoute extends PageRouteInfo<void> {
  const LanguageLocalizationRoute({List<PageRouteInfo>? children})
      : super(LanguageLocalizationRoute.name, initialChildren: children);

  static const String name = 'LanguageLocalizationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LanguageLocalizationScreen();
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
/// [MentalChallengesScreen]
class MentalChallengesRoute extends PageRouteInfo<MentalChallengesRouteArgs> {
  MentalChallengesRoute({
    Key? key,
    required String categoryType,
    List<PageRouteInfo>? children,
  }) : super(
          MentalChallengesRoute.name,
          args: MentalChallengesRouteArgs(key: key, categoryType: categoryType),
          initialChildren: children,
        );

  static const String name = 'MentalChallengesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MentalChallengesRouteArgs>();
      return MentalChallengesScreen(
        key: args.key,
        categoryType: args.categoryType,
      );
    },
  );
}

class MentalChallengesRouteArgs {
  const MentalChallengesRouteArgs({this.key, required this.categoryType});

  final Key? key;

  final String categoryType;

  @override
  String toString() {
    return 'MentalChallengesRouteArgs{key: $key, categoryType: $categoryType}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MentalChallengesRouteArgs) return false;
    return key == other.key && categoryType == other.categoryType;
  }

  @override
  int get hashCode => key.hashCode ^ categoryType.hashCode;
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
/// [PrivacyPolicyScreen]
class PrivacyPolicyRoute extends PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<PageRouteInfo>? children})
      : super(PrivacyPolicyRoute.name, initialChildren: children);

  static const String name = 'PrivacyPolicyRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PrivacyPolicyScreen();
    },
  );
}

/// generated route for
/// [PrivacyScreen]
class PrivacyRoute extends PageRouteInfo<void> {
  const PrivacyRoute({List<PageRouteInfo>? children})
      : super(PrivacyRoute.name, initialChildren: children);

  static const String name = 'PrivacyRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PrivacyScreen();
    },
  );
}

/// generated route for
/// [RateUsScreen]
class RateUsRoute extends PageRouteInfo<void> {
  const RateUsRoute({List<PageRouteInfo>? children})
      : super(RateUsRoute.name, initialChildren: children);

  static const String name = 'RateUsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RateUsScreen();
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
/// [SleepAndRelaxChallengesScreen]
class SleepAndRelaxChallengesRoute
    extends PageRouteInfo<SleepAndRelaxChallengesRouteArgs> {
  SleepAndRelaxChallengesRoute({
    Key? key,
    required String categoryType,
    List<PageRouteInfo>? children,
  }) : super(
          SleepAndRelaxChallengesRoute.name,
          args: SleepAndRelaxChallengesRouteArgs(
            key: key,
            categoryType: categoryType,
          ),
          initialChildren: children,
        );

  static const String name = 'SleepAndRelaxChallengesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SleepAndRelaxChallengesRouteArgs>();
      return SleepAndRelaxChallengesScreen(
        key: args.key,
        categoryType: args.categoryType,
      );
    },
  );
}

class SleepAndRelaxChallengesRouteArgs {
  const SleepAndRelaxChallengesRouteArgs({
    this.key,
    required this.categoryType,
  });

  final Key? key;

  final String categoryType;

  @override
  String toString() {
    return 'SleepAndRelaxChallengesRouteArgs{key: $key, categoryType: $categoryType}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SleepAndRelaxChallengesRouteArgs) return false;
    return key == other.key && categoryType == other.categoryType;
  }

  @override
  int get hashCode => key.hashCode ^ categoryType.hashCode;
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
/// [UserProfileScreen]
class UserProfileRoute extends PageRouteInfo<void> {
  const UserProfileRoute({List<PageRouteInfo>? children})
      : super(UserProfileRoute.name, initialChildren: children);

  static const String name = 'UserProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UserProfileScreen();
    },
  );
}

/// generated route for
/// [WaterBalanceScreen]
class WaterBalanceRoute extends PageRouteInfo<void> {
  const WaterBalanceRoute({List<PageRouteInfo>? children})
      : super(WaterBalanceRoute.name, initialChildren: children);

  static const String name = 'WaterBalanceRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WaterBalanceScreen();
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

/// generated route for
/// [WorkoutTypesScreen]
class WorkoutTypesRoute extends PageRouteInfo<void> {
  const WorkoutTypesRoute({List<PageRouteInfo>? children})
      : super(WorkoutTypesRoute.name, initialChildren: children);

  static const String name = 'WorkoutTypesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WorkoutTypesScreen();
    },
  );
}
