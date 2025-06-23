import 'package:ai_fit_coach/ui/widgets/custom_workout_card.dart';
import 'package:flutter/material.dart';

class CategoriesAdvanced extends StatelessWidget {
  const CategoriesAdvanced({super.key});

  @override
  Widget build(BuildContext context) {
    final themeDark = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Number of existing workouts',
              style: themeDark.textTheme.headlineLarge,
            ),
          ),
          Center(
            child: Container(
              height: 110,
              width: MediaQuery.of(context).size.width * 0.97,
              child: WorkoutCard(
                title: 'HIIT (High Intensity)',
                subtitle: 'number of existing workouts',
                imageUrl: 'assets/images/challenges/exercise/1.png',
                onTap: () {},
              ),
            ),
          ),
          Divider(
            thickness: 0.5,
            color: const Color.fromARGB(255, 63, 63, 63),
          ),
          Center(
            child: Container(
              height: 110,
              width: MediaQuery.of(context).size.width * 0.97,
              child: WorkoutCard(
                title: 'HIIT (High Intensity)',
                subtitle: 'number of existing workouts',
                imageUrl: 'assets/images/challenges/exercise/1.png',
                onTap: () {},
              ),
            ),
          ),
          Divider(
            thickness: 0.5,
            color: const Color.fromARGB(255, 63, 63, 63),
          ),
          Center(
            child: Container(
              height: 110,
              width: MediaQuery.of(context).size.width * 0.97,
              child: WorkoutCard(
                title: 'HIIT (High Intensity)',
                subtitle: 'number of existing workouts',
                imageUrl: 'assets/images/challenges/exercise/1.png',
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
