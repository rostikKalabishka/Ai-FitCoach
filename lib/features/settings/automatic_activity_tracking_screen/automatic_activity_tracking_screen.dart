import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../ui/ui.dart';

@RoutePage()
class AutomaticActivityTrackingScreen extends StatelessWidget {
  const AutomaticActivityTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Text(S.of(context).automaticActivityTracking,
            style: theme.textTheme.labelMedium),
        centerTitle: true,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomActivityTrackingContainer(
              theme: theme,
              title: S.of(context).stepCount,
              subtitle: S.of(context).settings,
              selectedIcon: Icon(Icons.directions_walk_outlined),
            ),
            SizedBox(
              height: 10,
            ),
            CustomActivityTrackingContainer(
              theme: theme,
              title: S.of(context).gpsTracking,
              subtitle: S.of(context).settings,
              selectedIcon: Icon(Icons.gps_fixed),
            ),
            SizedBox(
              height: 10,
            ),
            CustomActivityTrackingContainer(
              theme: theme,
              title: S.of(context).heartRate,
              subtitle: S.of(context).settings,
              selectedIcon: Icon(Icons.monitor_heart),
            ),
          ],
        ),
      ),
    );
  }
}
