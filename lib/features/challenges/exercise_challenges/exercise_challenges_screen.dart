import 'package:ai_fit_coach/features/challenges/bloc/challenge_bloc.dart';
import 'package:ai_fit_coach/features/challenges/challenges.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../ui/widgets/custom_challenge_card.dart';

@RoutePage()
class ExerciseChallengesScreen extends StatefulWidget {
  const ExerciseChallengesScreen({super.key, required this.categoryType});
  final String categoryType;

  @override
  State<ExerciseChallengesScreen> createState() => _ExerciseChallengesScreenState();
}

class _ExerciseChallengesScreenState extends State<ExerciseChallengesScreen> {
 @override
  void initState() {
    context.read<ChallengeBloc>().add(LoadListChallengeItemEvent(categoryType: widget.categoryType));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: BlocBuilder<ChallengeBloc, ChallengeState>(
        builder: (context, state) {
          if (state is ChallengeLoaded) {
            return ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(height: 8);
              },
              itemCount: state.listChallengeSectorItem.length,
              itemBuilder: (context, index) {
                final foodChallenge = state.listChallengeSectorItem[index];
                return CustomChallengeCard(
                  title: foodChallenge.title,
                  subtitle: foodChallenge.subtitle,
                  imagePath: foodChallenge.imageUrl,
                  price: foodChallenge.price,
                  onJoin: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => JoinNowScreen(challengeItem: foodChallenge)));
                  },
                  onInfoTap: () {},
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}
