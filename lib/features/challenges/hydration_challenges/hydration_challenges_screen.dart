import 'package:ai_fit_coach/ui/theme/app_const.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../ui/widgets/custom_challenge_card.dart';

@RoutePage()
class HydrationChallengesScreen extends StatefulWidget {
  const HydrationChallengesScreen({super.key});

  @override
  State<HydrationChallengesScreen> createState() => _HydrationChallengesScreenState();
}

class _HydrationChallengesScreenState extends State<HydrationChallengesScreen> {
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
              imagePath: AppConst.challengeHydration1Image,
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
              imagePath: AppConst.challengeHydration1Image,
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
              imagePath: AppConst.challengeHydration1Image,
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
              imagePath: AppConst.challengeHydration1Image,
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
              imagePath: AppConst.challengeHydration1Image,
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
