import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../ui/widgets/custom_workout_card.dart';
import '../workout.dart';

@RoutePage()
class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Text('Workout', style: theme.textTheme.labelMedium),
        centerTitle: true,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'FOR YOU',
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
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CategoriesWorkout()));
                  },
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
                  title: 'Calisthenics',
                  subtitle: 'number of existing workouts',
                  imageUrl: 'assets/images/challenges/exercise/2.png',
                  onTap: () {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 16, left: 16, bottom: 8, top: 16),
              child: Text(
                'ALL CATEGORIES',
                style: theme.textTheme.headlineLarge,
              ),
            ),
            Center(
              child: Container(
                height: 110,
                width: MediaQuery.of(context).size.width * 0.97,
                child: WorkoutCard(
                  title: 'Gym Workouts',
                  subtitle: 'number of existing workouts',
                  imageUrl: 'assets/images/challenges/exercise/3.png',
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
                  title: 'Abs & Core',
                  subtitle: 'number of existing workouts',
                  imageUrl: 'assets/images/challenges/exercise/4.png',
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
                  title: 'Micro Workouts',
                  subtitle: 'number of existing workouts',
                  imageUrl: 'assets/images/challenges/exercise/5.png',
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
                  title: 'Home Workouts',
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
                  title: 'Wall Pilates',
                  subtitle: 'number of existing workouts',
                  imageUrl: 'assets/images/challenges/exercise/2.png',
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
                  title: 'Stretching & Flexibility',
                  subtitle: 'number of existing workouts',
                  imageUrl: 'assets/images/challenges/exercise/3.png',
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
                  title: 'Yoga',
                  subtitle: 'number of existing workouts',
                  imageUrl: 'assets/images/challenges/exercise/4.png',
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
                  title: 'Walking Workouts',
                  subtitle: 'number of existing workouts',
                  imageUrl: 'assets/images/challenges/exercise/5.png',
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
                  title: 'Running Workouts',
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
                  title: 'Treadmill Workouts',
                  subtitle: 'number of existing workouts',
                  imageUrl: 'assets/images/challenges/exercise/2.png',
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
                  title: 'Kegel & Pelvic Floor',
                  subtitle: 'number of existing workouts',
                  imageUrl: 'assets/images/challenges/exercise/3.png',
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
                  title: 'Back Pain Relief',
                  subtitle: 'number of existing workouts',
                  imageUrl: 'assets/images/challenges/exercise/4.png',
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
                  title: 'Senior Workouts',
                  subtitle: 'number of existing workouts',
                  imageUrl: 'assets/images/challenges/exercise/5.png',
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
                  title: 'Wheelchair Workouts',
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
                  title: 'Bodyweight Only',
                  subtitle: 'number of existing workouts',
                  imageUrl: 'assets/images/challenges/exercise/2.png',
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
                  title: 'Dance Workouts',
                  subtitle: 'number of existing workouts',
                  imageUrl: 'assets/images/challenges/exercise/3.png',
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
                  title: 'Balance & Stability',
                  subtitle: 'number of existing workouts',
                  imageUrl: 'assets/images/challenges/exercise/4.png',
                  onTap: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
