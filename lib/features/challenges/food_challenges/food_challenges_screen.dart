import 'package:ai_fit_coach/features/challenges/join_now_screen/join_now_screen.dart';
import 'package:ai_fit_coach/ui/theme/app_const.dart';
import 'package:ai_fit_coach/ui/widgets/custom_challenge_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class FoodChallengesScreen extends StatefulWidget {
  const FoodChallengesScreen({super.key});

  @override
  State<FoodChallengesScreen> createState() => _FoodChallengesScreenState();
}

class _FoodChallengesScreenState extends State<FoodChallengesScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: ListView(children: [
        Column(
          children: [
            SizedBox(height: 10),
            CustomChallengeCard(
              title: 'No Sugar',
              subtitle: '3 Days challenge',
              imagePath: AppConst.challengeFood1Image,
              price: 3.99,
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
              imagePath: AppConst.challengeFood2Image,
              price: 4.69,
              onJoin: () {},
              onInfoTap: () {},
            ),
            SizedBox(
              height: 13,
            ),
            CustomChallengeCard(
              title: 'Add Vegetables to Every Meal',
              subtitle: '7 Days challenge',
              imagePath: AppConst.challengeFood3Image,
              price: 3.99,
              onJoin: () {},
              onInfoTap: () {},
            ),
            SizedBox(
              height: 13,
            ),
            CustomChallengeCard(
              title: 'Drink Water Before Every Meal',
              subtitle: '7 Days challenge',
              imagePath: AppConst.challengeFood4Image,
              price: 4.59,
              onJoin: () {},
              onInfoTap: () {},
            ),
            SizedBox(
              height: 13,
            ),
            CustomChallengeCard(
              title: "Don't Eat After 8:00 PM",
              subtitle: '21 Days challenge',
              imagePath: AppConst.challengeFood5Image,
              price: 9.99,
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
