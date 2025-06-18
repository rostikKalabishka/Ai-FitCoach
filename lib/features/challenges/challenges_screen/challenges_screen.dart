import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../challenges.dart';

@RoutePage()
class ChallengesScreen extends StatefulWidget {
  const ChallengesScreen({super.key});

  @override
  State<ChallengesScreen> createState() => _ChallengesScreenState();
}

class _ChallengesScreenState extends State<ChallengesScreen> {
  int selectedIndex = 0;

  final List<String> sections = [
    'Food',
    'Exercise',
    'Sleep and Relax',
    'Hydration',
    'Mental',
  ];

  final List<Widget> screens = [
    FoodChallenges(),
    ExerciseChallenges(),
    SleepAndRelaxChallenges(),
    HydrationChallenges(),
    MentalChallenges(),
  ];

  @override
  Widget build(BuildContext context) {
    final themeDark = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeDark.appBarTheme.backgroundColor,
        title: Text('Challenges', style: themeDark.textTheme.labelMedium),
        centerTitle: true,
      ),
      backgroundColor: themeDark.scaffoldBackgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: 30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sections.length,
              itemBuilder: (BuildContext context, int index) {
                final isSelected = index == selectedIndex;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color.fromARGB(255, 55, 0, 255)
                          : const Color.fromARGB(255, 39, 39, 39),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: Text(sections[index],
                        style: themeDark.textTheme.headlineMedium),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: screens[selectedIndex],
          ),
        ],
      ),
    );
  }
}
