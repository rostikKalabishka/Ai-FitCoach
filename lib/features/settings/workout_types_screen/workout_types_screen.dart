import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class WorkoutTypesScreen extends StatefulWidget {
  const WorkoutTypesScreen({super.key});

  @override
  State<WorkoutTypesScreen> createState() => _WorkoutTypesScreenState();
}

class _WorkoutTypesScreenState extends State<WorkoutTypesScreen> {
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
        title: Text('Workout Types', style: theme.textTheme.labelMedium),
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
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.directions_run),
                            SizedBox(width: 10),
                            Text(
                              'Cardio',
                              style: theme.textTheme.headlineLarge,
                            ),
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
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.fitness_center),
                            SizedBox(width: 10),
                            Text(
                              'Strength',
                              style: theme.textTheme.headlineLarge,
                            ),
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
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.self_improvement),
                            SizedBox(width: 10),
                            Text(
                              'Yoga',
                              style: theme.textTheme.headlineLarge,
                            ),
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
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.flash_on),
                            SizedBox(width: 10),
                            Text(
                              'HIIT',
                              style: theme.textTheme.headlineLarge,
                            ),
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
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 32),
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 110,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                  child: Text(
                    'Cancel',
                    style: theme.textTheme.labelSmall,
                  ),
                ),
              ),
              SizedBox(
                width: 110,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                  child: Text(
                    'Confirm',
                    style: theme.textTheme.labelSmall,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
