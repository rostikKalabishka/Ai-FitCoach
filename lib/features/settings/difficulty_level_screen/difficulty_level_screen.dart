import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DifficultyLevelScreen extends StatefulWidget {
  const DifficultyLevelScreen({super.key});

  @override
  State<DifficultyLevelScreen> createState() => _DifficultyLevelScreenState();
}

class _DifficultyLevelScreenState extends State<DifficultyLevelScreen> {
  bool isSwitched = false;
  bool isSwitched1 = false;
  bool isSwitched2 = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Text('Difficulty Level', style: theme.textTheme.labelMedium),
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
                            Icon(Icons.looks_one),
                            SizedBox(width: 10),
                            Text(
                              'Beginner',
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
                            Icon(Icons.looks_two),
                            SizedBox(width: 10),
                            Text(
                              'Intermediate',
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
                            Icon(Icons.looks_one),
                            SizedBox(width: 10),
                            Text(
                              'Advanced',
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
