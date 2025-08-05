import 'package:ai_fit_coach/features/workout/bloc/workout_bloc.dart';
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:ai_fit_coach/repositories/analytics_repository/abstract_analytics_repository.dart';
import 'package:ai_fit_coach/ui/widgets/custom_workout_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../workout.dart';

@RoutePage()
class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  final AbstractAnalyticsRepository _analyticsRepository =
      GetIt.instance<AbstractAnalyticsRepository>();
  late DateTime _screenEnterTime;

  @override
  void initState() {
    super.initState();
    _screenEnterTime = DateTime.now();
    // Логування перегляду екрану
    _analyticsRepository.logScreenView(
      screenName: 'workout_screen',
      screenClass: 'WorkoutScreen',
    );
    context.read<WorkoutBloc>().add(LoadListWorkoutItemEvent());
  }

  @override
  void dispose() {
    // Логування виходу з екрану з тривалістю
    final durationSeconds =
        DateTime.now().difference(_screenEnterTime).inSeconds;
    _analyticsRepository.logEvent(
      name: 'screen_exit',
      parameters: {
        'screen_name': 'workout_screen',
        'duration_seconds': durationSeconds,
      },
    );
    super.dispose();
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
                            subtitle: 'duration: ${workout.subtitle} minutes',
                            imageUrl: workout.imageUrl,
                            onTap: () {
                              // Логування натискання на картку тренування
                              _analyticsRepository.logEvent(
                                name: 'card_click',
                                parameters: {
                                  'screen_name': 'workout_screen',
                                  'category': 'workout',
                                  'item_id': workout.id,
                                  'item_title': workout.title,
                                  'duration_minutes': workout.subtitle,
                                },
                              );

                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DescriptionCategoryWorkout(
                                          workoutItem: workout),
                                ),
                              );
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
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}
