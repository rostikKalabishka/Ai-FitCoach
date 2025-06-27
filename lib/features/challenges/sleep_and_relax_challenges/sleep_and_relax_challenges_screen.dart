import 'package:ai_fit_coach/ui/theme/app_const.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../ui/widgets/custom_challenge_card.dart';

@RoutePage()
class SleepAndRelaxChallengesScreen extends StatefulWidget {
  const SleepAndRelaxChallengesScreen({super.key});

  @override
  State<SleepAndRelaxChallengesScreen> createState() => _SleepAndRelaxChallengesScreenState();
}

class _SleepAndRelaxChallengesScreenState extends State<SleepAndRelaxChallengesScreen> {
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
              title: 'No Screens Before Bed',
              subtitle: '5 Days challenge',
              imagePath: AppConst.challengeSleepAndRelax1Image,
              price: '3.99',
              onJoin: () {},
              onInfoTap: () {},
            ),
            SizedBox(
              height: 13,
            ),
            CustomChallengeCard(
              title: 'Bedtime Wind-Down Ritual',
              subtitle: '7 Days challenge',
              imagePath: AppConst.challengeSleepAndRelax2Image,
              price: '4.69',
              onJoin: () {},
              onInfoTap: () {},
            ),
            SizedBox(
              height: 13,
            ),
            CustomChallengeCard(
              title: 'Wake Up at the Same Time',
              subtitle: '7 Days challenge',
              imagePath: AppConst.challengeSleepAndRelax3Image,
              price: '3.99',
              onJoin: () {},
              onInfoTap: () {},
            ),
            SizedBox(
              height: 13,
            ),
            CustomChallengeCard(
              title: 'Try 5-Minute Breathing',
              subtitle: '5 Days challenge',
              imagePath: AppConst.challengeSleepAndRelax4Image,
              price: '4.59',
              onJoin: () {},
              onInfoTap: () {},
            ),
            SizedBox(
              height: 13,
            ),
            CustomChallengeCard(
              title: "Digital Sunset",
              subtitle: '7 Days challenge',
              imagePath: AppConst.challengeSleepAndRelax5Image,
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
