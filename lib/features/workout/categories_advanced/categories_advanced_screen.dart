import 'package:ai_fit_coach/ui/widgets/custom_workout_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CategoriesAdvancedScreen extends StatefulWidget {
  const CategoriesAdvancedScreen({super.key});

  @override
  State<CategoriesAdvancedScreen> createState() => _CategoriesAdvancedScreenState();
}

class _CategoriesAdvancedScreenState extends State<CategoriesAdvancedScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Number of existing workouts',
              style: theme.textTheme.headlineLarge,
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
