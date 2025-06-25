import 'package:ai_fit_coach/ui/theme/app_const.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../ui/widgets/custom_challenge_card.dart';

@RoutePage()
class MentalChallengesScreen extends StatefulWidget {
  const MentalChallengesScreen({super.key});

  @override
  State<MentalChallengesScreen> createState() => _MentalChallengesScreenState();
}

class _MentalChallengesScreenState extends State<MentalChallengesScreen> {
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
              title: '3-Minute Daily Journal',
              subtitle: '7 Days challenge',
              imagePath: AppConst.challengeMental1Image,
              price: '3.99',
              onJoin: () {},
              onInfoTap: () {},
            ),
            SizedBox(
              height: 13,
            ),
            CustomChallengeCard(
              title: 'Screen-Free Time',
              subtitle: '5 Days challenge',
              imagePath: AppConst.challengeMental2Image,
              price: '4.69',
              onJoin: () {},
              onInfoTap: () {},
            ),
            SizedBox(
              height: 13,
            ),
            CustomChallengeCard(
              title: 'Daily Positive Thought',
              subtitle: '7 Days challenge',
              imagePath: AppConst.challengeMental3Image,
              price: '3.99',
              onJoin: () {},
              onInfoTap: () {},
            ),
            SizedBox(
              height: 13,
            ),
            CustomChallengeCard(
              title: 'Nightly Gratitude',
              subtitle: '14 days challenge',
              imagePath: AppConst.challengeMental4Image,
              price: '4.59',
              onJoin: () {},
              onInfoTap: () {},
            ),
            SizedBox(
              height: 13,
            ),
            CustomChallengeCard(
              title: "One Real Talk",
              subtitle: '7 days challenge',
              imagePath: AppConst.challengeMental5Image,
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
