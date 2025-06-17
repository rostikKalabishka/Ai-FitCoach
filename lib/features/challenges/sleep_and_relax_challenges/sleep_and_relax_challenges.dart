import 'package:flutter/material.dart';

import '../../../ui/widgets/custom_card.dart';

class SleepAndRelaxChallenges extends StatelessWidget {
  const SleepAndRelaxChallenges({super.key});

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
              title: 'No Screens Before Bed',
              subtitle: '5 Days challenge',
              imagePath: 'assets/images/challenges/sleep_and_relax/1.png',
              price: '3.99',
              onJoin: () {},
              onInfoTap: () {},
            ),
            SizedBox(
              height: 13,
            ),
            ChallengeCard(
              title: 'Bedtime Wind-Down Ritual',
              subtitle: '7 Days challenge',
              imagePath: 'assets/images/challenges/sleep_and_relax/2.png',
              price: '4.69',
              onJoin: () {},
              onInfoTap: () {},
            ),
            SizedBox(
              height: 13,
            ),
            ChallengeCard(
              title: 'Wake Up at the Same Time',
              subtitle: '7 Days challenge',
              imagePath: 'assets/images/challenges/sleep_and_relax/3.png',
              price: '3.99',
              onJoin: () {},
              onInfoTap: () {},
            ),
            SizedBox(
              height: 13,
            ),
            ChallengeCard(
              title: 'Try 5-Minute Breathing',
              subtitle: '5 Days challenge',
              imagePath: 'assets/images/challenges/sleep_and_relax/4.png',
              price: '4.59',
              onJoin: () {},
              onInfoTap: () {},
            ),
            SizedBox(
              height: 13,
            ),
            ChallengeCard(
              title: "Digital Sunset",
              subtitle: '7 Days challenge',
              imagePath: 'assets/images/challenges/sleep_and_relax/5.png',
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