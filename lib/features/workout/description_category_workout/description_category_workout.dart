import 'package:ai_fit_coach/blocs/workout_exercise_bloc/workout_exercise_bloc.dart';
import 'package:ai_fit_coach/common/api/model/workout/workout_item.dart';
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:ai_fit_coach/repositories/analytics_repository/abstract_analytics_repository.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../ui/ui.dart';

class DescriptionCategoryWorkout extends StatefulWidget {
  const DescriptionCategoryWorkout({super.key, required this.workoutItem});
  final WorkoutItem workoutItem;

  @override
  State<DescriptionCategoryWorkout> createState() =>
      _DescriptionCategoryWorkoutState();
}

class _DescriptionCategoryWorkoutState
    extends State<DescriptionCategoryWorkout> {
  int selectedIndex = 0;
  final AbstractAnalyticsRepository _analyticsRepository =
      GetIt.instance<AbstractAnalyticsRepository>();
  late DateTime _screenEnterTime;

  final List<String> sections = [
    'All',
    'Newbie',
    'Medium',
    'Advanced',
  ];

  @override
  void initState() {
    super.initState();
    _screenEnterTime = DateTime.now();
    _analyticsRepository.logScreenView(
      screenName: 'workout_details_screen',
      screenClass: 'DescriptionCategoryWorkout',
    );
    context.read<WorkoutExerciseBloc>().add(WorkoutExerciseItemEvent(
          workoutCategoryType: WorkoutCategoryType.all,
          workoutId: widget.workoutItem.id,
        ));
  }

  @override
  void dispose() {
    final durationSeconds =
        DateTime.now().difference(_screenEnterTime).inSeconds;
    _analyticsRepository.logEvent(
      name: 'screen_exit',
      parameters: {
        'screen_name': 'workout_details_screen',
        'duration_seconds': durationSeconds,
        'workout_id': widget.workoutItem.id,
        'workout_title': widget.workoutItem.title,
      },
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final workoutItem = widget.workoutItem;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: BlocBuilder<WorkoutExerciseBloc, WorkoutExerciseState>(
        builder: (context, state) {
          if (state is WorkoutExerciseLoaded) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 350,
                  flexibleSpace: FlexibleSpaceBar(
                    background: CachedNetworkImage(
                      imageUrl: workoutItem.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  leading: IconButton(
                    onPressed: () {
                      _analyticsRepository.logButtonClick(
                        buttonName: 'back_button',
                        screenName: 'workout_details_screen',
                      );
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: theme.bottomNavigationBarTheme.unselectedItemColor,
                      size: 32,
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.colorScheme.tertiary,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: SizedBox(
                            height: 30,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: sections.length,
                              itemBuilder: (context, index) {
                                final isSelected = index == selectedIndex;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                      _analyticsRepository.logEvent(
                                        name: 'tab_select',
                                        parameters: {
                                          'screen_name':
                                              'workout_details_screen',
                                          'tab_name':
                                              sections[index].toLowerCase(),
                                          'workout_id': workoutItem.id,
                                          'workout_title': workoutItem.title,
                                        },
                                      );
                                      context
                                          .read<WorkoutExerciseBloc>()
                                          .add(WorkoutExerciseItemEvent(
                                            workoutCategoryType:
                                                _getCategoryType(index),
                                            workoutId: workoutItem.id,
                                          ));
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? theme.colorScheme.primary
                                          : const Color.fromARGB(
                                              255, 39, 39, 39),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      sections[index],
                                      style: theme.textTheme.headlineMedium,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Text(
                          workoutItem.title,
                          style: theme.textTheme.displaySmall?.copyWith(
                            fontSize: 24,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Text(
                            'duration: ${workoutItem.subtitle} minutes',
                            style: theme.textTheme.displaySmall?.copyWith(
                              fontSize: 16,
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {
                                _analyticsRepository.logEvent(
                                  name: 'add_to_favorites',
                                  parameters: {
                                    'screen_name': 'workout_details_screen',
                                    'workout_id': workoutItem.id,
                                    'workout_title': workoutItem.title,
                                  },
                                );
                              },
                              icon: const Icon(Icons.favorite_border_outlined),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: theme.colorScheme.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                onPressed: () {
                                  _analyticsRepository.logButtonClick(
                                    buttonName: 'start_workout',
                                    screenName: 'workout_details_screen',
                                    parameters: {
                                      'workout_id': workoutItem.id,
                                      'workout_title': workoutItem.title,
                                      'duration_minutes': workoutItem.subtitle,
                                    },
                                  );
                                },
                                child: Text(
                                  S.of(context).startWorkout,
                                  style: theme.textTheme.displaySmall
                                      ?.copyWith(fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),

                // Заголовок "Exercises"
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Text(
                      'Exercises',
                      style: theme.textTheme.labelSmall,
                    ),
                  ),
                ),

                // Список вправ
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final exercise = state.workoutExercise[index];
                      _analyticsRepository.logExerciseViewed(
                        exerciseName: exercise.exerciseName,
                        category: sections[selectedIndex].toLowerCase(),
                      );
                      return CustomSubcategoryWorkout(
                        title: exercise.exerciseName,
                        imagePath: exercise.imageUrl,
                        repsNumber: exercise.exerciseReps,
                      );
                    },
                    childCount: state.workoutExercise.length,
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

  WorkoutCategoryType _getCategoryType(int index) {
    switch (index) {
      case 0:
        return WorkoutCategoryType.all;
      case 1:
        return WorkoutCategoryType.newbie;
      case 2:
        return WorkoutCategoryType.medium;
      case 3:
        return WorkoutCategoryType.advanced;
      default:
        return WorkoutCategoryType.all;
    }
  }
}
