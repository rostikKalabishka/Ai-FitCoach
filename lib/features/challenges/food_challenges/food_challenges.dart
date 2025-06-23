import 'package:ai_fit_coach/ui/widgets/custom_challenge_card.dart';
import 'package:flutter/material.dart';

import '../challenges.dart';

class FoodChallenges extends StatelessWidget {
  const FoodChallenges({super.key});

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
              title: 'No Sugar',
              subtitle: '3 Days challenge',
              imagePath: 'assets/images/challenges/food/1.png',
              price: '3.99',
              onJoin: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => JoinNowScreen()));
              },
              onInfoTap: () {},
            ),
            SizedBox(
              height: 13,
            ),
            CustomChallengeCard(
              title: 'Eat Breakfast Every Morning',
              subtitle: '7 Days challenge',
              imagePath: 'assets/images/challenges/food/2.png',
              price: '4.69',
              onJoin: () {},
              onInfoTap: () {},
            ),
            SizedBox(
              height: 13,
            ),
            CustomChallengeCard(
              title: 'Add Vegetables to Every Meal',
              subtitle: '7 Days challenge',
              imagePath: 'assets/images/challenges/food/3.png',
              price: '3.99',
              onJoin: () {},
              onInfoTap: () {},
            ),
            SizedBox(
              height: 13,
            ),
            CustomChallengeCard(
              title: 'Drink Water Before Every Meal',
              subtitle: '7 Days challenge',
              imagePath: 'assets/images/challenges/food/4.png',
              price: '4.59',
              onJoin: () {},
              onInfoTap: () {},
            ),
            SizedBox(
              height: 13,
            ),
            CustomChallengeCard(
              title: "Don't Eat After 8:00 PM",
              subtitle: '21 Days challenge',
              imagePath: 'assets/images/challenges/food/5.png',
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
