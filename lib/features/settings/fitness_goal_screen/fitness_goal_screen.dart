import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../ui/ui.dart';

@RoutePage()
class FitnessGoalScreen extends StatefulWidget {
  const FitnessGoalScreen({super.key});

  @override
  State<FitnessGoalScreen> createState() => _FitnessGoalScreenState();
}

class _FitnessGoalScreenState extends State<FitnessGoalScreen> {
  bool isSwitched = false;
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool isSwitched3 = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Text('Fitness Goal', style: theme.textTheme.labelMedium),
        centerTitle: true,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
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
                    borderRadius: BorderRadiusDirectional.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          spacing: 10,
                          children: [
                            Icon(Icons.scale),
                            Text('Weight Loss',
                                textAlign: TextAlign.start,
                                style: theme.textTheme.headlineLarge),
                            SizedBox(width: 170),
                          ],
                        ),
                        Switch.adaptive(
                          value: isSwitched,
                          onChanged: (bool value) {
                            setState(() {
                              isSwitched = value;
                            });
                          },
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
                    borderRadius: BorderRadiusDirectional.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          spacing: 10,
                          children: [
                            Icon(Icons.fitness_center),
                            Text('Muscle Gain',
                                textAlign: TextAlign.start,
                                style: theme.textTheme.headlineLarge),
                            SizedBox(width: 170),
                          ],
                        ),
                        Switch.adaptive(
                          value: isSwitched1,
                          onChanged: (bool value) {
                            setState(() {
                              isSwitched1 = value;
                            });
                          },
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
                    borderRadius: BorderRadiusDirectional.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          spacing: 10,
                          children: [
                            Icon(Icons.accessibility_new),
                            Text('Stay Fit',
                                textAlign: TextAlign.start,
                                style: theme.textTheme.headlineLarge),
                            SizedBox(width: 200),
                          ],
                        ),
                        Switch.adaptive(
                          value: isSwitched2,
                          onChanged: (bool value) {
                            setState(() {
                              isSwitched2 = value;
                            });
                          },
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
                    borderRadius: BorderRadiusDirectional.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          spacing: 10,
                          children: [
                            Icon(Icons.more_horiz),
                            Text('Other',
                                textAlign: TextAlign.start,
                                style: theme.textTheme.headlineLarge),
                            SizedBox(width: 210),
                          ],
                        ),
                        Switch.adaptive(
                          value: isSwitched3,
                          onChanged: (bool value) {
                            setState(() {
                              isSwitched3 = value;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
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
              onPressed: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}
