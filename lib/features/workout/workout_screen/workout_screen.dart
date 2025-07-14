import 'package:ai_fit_coach/features/workout/bloc/workout_bloc.dart';
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../ui/widgets/custom_workout_card.dart';
import '../workout.dart';

@RoutePage()
class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  @override
  void initState() {
    context.read<WorkoutBloc>().add(LoadListWorkoutItemEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Text(S.of(context).workout, style: theme.textTheme.labelMedium),
        centerTitle: true,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: BlocBuilder<WorkoutBloc, WorkoutState>(
        builder: (context, state) {
          if (state is WorkoutLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      right: 16, left: 16, bottom: 8, top: 16),
                  child: Text(
                    'ALL CATEGORIES',
                    style: theme.textTheme.headlineLarge,
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      final workout = state.listWorkoutItem[index];
                      return Center(
                        child: Container(
                          height: 110,
                          width: MediaQuery.of(context).size.width * 0.97,
                          child: WorkoutCard(
                            title: workout.title,
                            subtitle: 'exercise: number',
                            imageUrl: workout.imageUrl,
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      DescriptionCategoryWorkout()));
                            },
                          ),
                        ),
                      );
                    },
                    itemCount: state.listWorkoutItem.length,
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Divider(thickness: 0.5),
                      );
                    },
                  ),
                ),
              ],
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
