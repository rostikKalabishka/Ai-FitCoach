import 'package:ai_fit_coach/features/main_screen/follow_on_social_networks.dart';
import 'package:ai_fit_coach/ui/theme/app_const.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../ui/widgets/custom_main_screen_card.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeDark = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeDark.appBarTheme.backgroundColor,
        title: Text('Main Screen', style: themeDark.textTheme.labelMedium),
        centerTitle: true,
      ),
      backgroundColor: themeDark.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Trending workout',
                style: themeDark.textTheme.labelSmall,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 250,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: CustomMainScreenCard(
                        title: 'Massive Arm Workout',
                        subtitle: '28 Days',
                        description:
                            'Build serious size and strength in your biceps, triceps, and forearms with this intense arm-blasting workout. Designed to maximize hypertrophy and definition, this session targets all angles of your arm muscles through a mix of isolation and compound movements. Expect supersets, slow negatives, and high volume to fully fatigue your arms and spark growth. ',
                        imagePath: AppConst.challengeExercise4Image,
                        onJoin: () {},
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Food recommendation',
                style: themeDark.textTheme.labelSmall,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 250,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: CustomMainScreenCard(
                        title: 'Power Bowl Perfection',
                        subtitle: 'Popular',
                        description:
                            'Salmon & Avocado Grain Bowl — a nutrient-packed meal combining omega-3-rich grilled salmon, creamy avocado, fiber-loaded quinoa, and fresh greens. Topped with a drizzle of lemon-tahini dressing, this bowl supports brain function, balances blood sugar, and keeps you full and energized. Ideal for a nourishing lunch or dinner that satisfies without slowing you down.',
                        imagePath: AppConst.challengeFood1Image,
                        onJoin: () {},
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Trending challenges',
                style: themeDark.textTheme.labelSmall,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 250,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: CustomMainScreenCard(
                        title: 'Screen-Free Time',
                        subtitle: '5 Days',
                        description:
                            'Screens overload the brain with stimuli. A short break resets your attention span, reduces anxiety, and helps you feel calmer.',
                        imagePath: AppConst.challengeMental4Image,
                        onJoin: () {},
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Text(
                    'About us',
                    style: themeDark.textTheme.labelSmall,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FollowOnSocialNetworks(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
