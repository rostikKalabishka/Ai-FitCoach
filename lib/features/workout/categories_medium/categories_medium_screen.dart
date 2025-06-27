import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../ui/widgets/widgets.dart';

@RoutePage()
class CategoriesMediumScreen extends StatefulWidget {
  const CategoriesMediumScreen({super.key});

  @override
  State<CategoriesMediumScreen> createState() => _CategoriesMediumScreenState();
}

class _CategoriesMediumScreenState extends State<CategoriesMediumScreen> {
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
        ],
      ),
    );
  }
}
