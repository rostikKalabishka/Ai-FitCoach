import 'package:flutter/material.dart';

import '../../../ui/widgets/custom_challenge_card.dart';

class HydrationChallenges extends StatelessWidget {
  const HydrationChallenges({super.key});

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
              title: 'Drink a Water Before Meal',
              subtitle: '7 Days challenge',
              imagePath: 'assets/images/challenges/hydration/1.png',
              price: '3.99',
              onJoin: () {},
              onInfoTap: () {},
            ),
            SizedBox(
              height: 13,
            ),
            CustomChallengeCard(
              title: '2 Liters a Day',
              subtitle: '7 Days challenge',
              imagePath: 'assets/images/challenges/hydration/2.png',
              price: '4.69',
              onJoin: () {},
              onInfoTap: () {},
            ),
            SizedBox(
              height: 13,
            ),
            CustomChallengeCard(
              title: 'Morning Hydration Ritual',
              subtitle: '5 Days challenge',
              imagePath: 'assets/images/challenges/hydration/3.png',
              price: '3.99',
              onJoin: () {},
              onInfoTap: () {},
            ),
            SizedBox(
              height: 13,
            ),
            CustomChallengeCard(
              title: 'Replace One Soda with Water',
              subtitle: '7 Days challenge',
              imagePath: 'assets/images/challenges/hydration/4.png',
              price: '4.59',
              onJoin: () {},
              onInfoTap: () {},
            ),
            SizedBox(
              height: 13,
            ),
            CustomChallengeCard(
              title: "Evening with Herbal Tea",
              subtitle: '5 Days challenge',
              imagePath: 'assets/images/challenges/hydration/5.png',
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