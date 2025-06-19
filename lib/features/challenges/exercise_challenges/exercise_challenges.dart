import 'package:flutter/material.dart';

import '../../../ui/widgets/custom_challenge_card.dart';

class ExerciseChallenges extends StatelessWidget {
  const ExerciseChallenges({super.key});

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
              imagePath: 'assets/images/challenges/exercise/1.png',
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
              imagePath: 'assets/images/challenges/exercise/2.png',
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
              imagePath: 'assets/images/challenges/exercise/3.png',
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
              imagePath: 'assets/images/challenges/exercise/4.png',
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
              imagePath: 'assets/images/challenges/exercise/5.png',
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