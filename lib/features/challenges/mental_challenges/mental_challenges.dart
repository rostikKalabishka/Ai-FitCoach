import 'package:flutter/material.dart';

import '../../../ui/widgets/custom_card.dart';

class MentalChallenges extends StatelessWidget {
  const MentalChallenges({super.key});

 @override
  Widget build(BuildContext context) {
    final themeDark = Theme.of(context);
    return Scaffold(
      backgroundColor: themeDark.scaffoldBackgroundColor,
      body: ListView(children: [
        Column(
          children: [
            SizedBox(height: 10),
            ChallengeCard(
              title: '3-Minute Daily Journal',
              subtitle: '7 Days challenge',
              imagePath: 'assets/images/challenges/food/background_food.png',
              price: '3.99',
              onJoin: () {},
              onInfoTap: () {},
            ),
            SizedBox(
              height: 13,
            ),
            ChallengeCard(
              title: 'Screen-Free Time',
              subtitle: '5 Days challenge',
              imagePath: 'assets/images/challenges/food/background_food.png',
              price: '4.69',
              onJoin: () {},
              onInfoTap: () {},
            ),
            SizedBox(
              height: 13,
            ),
            ChallengeCard(
              title: 'Daily Positive Thought',
              subtitle: '7 Days challenge',
              imagePath: 'assets/images/challenges/food/background_food.png',
              price: '3.99',
              onJoin: () {},
              onInfoTap: () {},
            ),
            SizedBox(
              height: 13,
            ),
            ChallengeCard(
              title: 'Nightly Gratitude',
              subtitle: '14 days challenge',
              imagePath: 'assets/images/challenges/food/background_food.png',
              price: '4.59',
              onJoin: () {},
              onInfoTap: () {},
            ),
            SizedBox(
              height: 13,
            ),
            ChallengeCard(
              title: "One Real Talk",
              subtitle: '7 days challenge',
              imagePath: 'assets/images/challenges/food/background_food.png',
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