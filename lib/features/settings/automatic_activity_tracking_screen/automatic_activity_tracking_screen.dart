import 'package:flutter/material.dart';

class AutomaticActivityTrackingScreen extends StatelessWidget {
  const AutomaticActivityTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeDark = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeDark.appBarTheme.backgroundColor,
        title: Text('Automatic Activity Tracking',
            style: themeDark.textTheme.labelMedium),
        centerTitle: true,
      ),
      backgroundColor: themeDark.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 60,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.directions_walk),
                            SizedBox(width: 10),
                            Text(
                              'Step Count',
                              style: themeDark.textTheme.headlineLarge,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Settings',
                              style: themeDark.textTheme.headlineSmall,
                            ),
                            Icon(Icons.arrow_right_outlined)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 60,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.gps_fixed),
                            SizedBox(width: 10),
                            Text(
                              'GPS Tracking',
                              style: themeDark.textTheme.headlineLarge,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Settings',
                              style: themeDark.textTheme.headlineSmall,
                            ),
                            Icon(Icons.arrow_right_outlined)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 60,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.monitor_heart),
                            SizedBox(width: 10),
                            Text(
                              'Heart Rate',
                              style: themeDark.textTheme.headlineLarge,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Settings',
                              style: themeDark.textTheme.headlineSmall,
                            ),
                            Icon(Icons.arrow_right_outlined)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
