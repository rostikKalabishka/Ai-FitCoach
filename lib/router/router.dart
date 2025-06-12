import 'package:ai_fit_coach/features/loader/view/loader_screen.dart';
import 'package:auto_route/auto_route.dart';

import '../features/onboarding/onboarding.dart';
import '../features/settings/main_settings_screen/main_settings_screen.dart';
import '../features/settings/settings_screen/view.dart';
part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: LoaderRoute.page,
          path: '/',
        ),
        AutoRoute(
          page: OnboardingRoute.page,
          path: '/onboarding',
        ),
        AutoRoute(
          page: SettingsRoute.page,
          path: '/settings',
        ),
        AutoRoute(
          page: MainSettingsRoute.page,
          path: '/settings/main_settings',
        ),
      ];
}
