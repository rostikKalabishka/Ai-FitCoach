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
        title: Text('Automatic Activity Tracking',
            style: theme.textTheme.labelMedium),
        centerTitle: true,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomActivityTrackingContainer(
              theme: theme,
              title: 'Step Count',
              subtitle: 'Settings',
              selectedIcon: Icon(Icons.directions_walk_outlined),
            ),
            SizedBox(
              height: 10,
            ),
            CustomActivityTrackingContainer(
              theme: theme,
              title: 'GPS Tracking',
              subtitle: 'Settings',
              selectedIcon: Icon(Icons.gps_fixed),
            ),
            SizedBox(
              height: 10,
            ),
            CustomActivityTrackingContainer(
              theme: theme,
              title: 'Heart Rate',
              subtitle: 'Settings',
              selectedIcon: Icon(Icons.monitor_heart),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomConfirmCancelButton(
              label: 'Cancel',
              onPressed: () => Navigator.pop(context),
            ),
            CustomConfirmCancelButton(
              label: 'Confirm',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}


