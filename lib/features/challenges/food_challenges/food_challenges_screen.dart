import 'package:ai_fit_coach/features/challenges/bloc/challenge_bloc.dart';
import 'package:ai_fit_coach/features/challenges/join_now_screen/join_now_screen.dart';
import 'package:ai_fit_coach/ui/widgets/custom_challenge_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class FoodChallengesScreen extends StatefulWidget {
  const FoodChallengesScreen({super.key, required this.categoryType});
  final String categoryType;

  @override
  State<FoodChallengesScreen> createState() => _FoodChallengesScreenState();
}

class _FoodChallengesScreenState extends State<FoodChallengesScreen> {
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
                return SizedBox(height: 13);
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
                        builder: (context) => JoinNowScreen()));
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
