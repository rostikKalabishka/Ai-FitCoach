import 'package:ai_fit_coach/ui/theme/app_const.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../ui/widgets/custom_challenge_card.dart';

@RoutePage()
class ExerciseChallengesScreen extends StatefulWidget {
  const ExerciseChallengesScreen({super.key});

  @override
  State<ExerciseChallengesScreen> createState() => _ExerciseChallengesScreenState();
}

class _ExerciseChallengesScreenState extends State<ExerciseChallengesScreen> {
  @override
  Widget build(BuildContext context) {
    final themeDark = Theme.of(context);
    return Scaffold(
      backgroundColor: themeDark.scaffoldBackgroundColor,
      body: ListView(children: [
        Column(
          children: [
            SizedBox(height: 10),
            CustomChallengeCard(
              title: 'Morning Movement',
              subtitle: '7 Days challenge',
              imagePath: AppConst.challengeExercise1Image,
              price: '3.99',
              onJoin: () {},
              onInfoTap: () {},
            ),
            SizedBox(
              height: 13,
            ),
            CustomChallengeCard(
              title: '5,000 Steps a Day',
              subtitle: '7 Days challenge',
              imagePath: AppConst.challengeExercise2Image,
              price: '4.69',
              onJoin: () {},
              onInfoTap: () {},
            ),
            SizedBox(
              height: 13,
            ),
            CustomChallengeCard(
              title: '1-Minute Plank Daily',
              subtitle: '21 Days challenge',
              imagePath: AppConst.challengeExercise3Image,
              price: '3.99',
              onJoin: () {},
              onInfoTap: () {},
            ),
            SizedBox(
              height: 13,
            ),
            CustomChallengeCard(
              title: '3 Workouts This Week',
              subtitle: '7 Days challenge',
              imagePath: AppConst.challengeExercise4Image,
              price: '4.59',
              onJoin: () {},
              onInfoTap: () {},
            ),
            SizedBox(
              height: 13,
            ),
            CustomChallengeCard(
              title: "Stretch Before Bed",
              subtitle: '14 Days challenge',
              imagePath: AppConst.challengeExercise5Image,
              price: '9.99',
              onJoin: () {},
              onInfoTap: () {},
            ),
            SizedBox(
              height: 13,
            ),
          ],
        ),
      ]),
    );
  }
}
