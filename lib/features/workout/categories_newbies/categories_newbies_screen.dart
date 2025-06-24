import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../ui/widgets/widgets.dart';
import '../workout.dart';

@RoutePage()
class CategoriesNewbiesScreen extends StatefulWidget {
  const CategoriesNewbiesScreen({super.key});

  @override
  State<CategoriesNewbiesScreen> createState() => _CategoriesNewbiesScreenState();
}

class _CategoriesNewbiesScreenState extends State<CategoriesNewbiesScreen> {
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
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DescriptionCategoryWorkout()));
                },
              ),
            ),
          ),
          Divider(
            thickness: 0.5,
            color: const Color.fromARGB(255, 63, 63, 63),
          ),
        ],
      ),
    );
  }
}
