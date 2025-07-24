import 'package:ai_fit_coach/blocs/bloc/workout_exercise_bloc.dart';
import 'package:ai_fit_coach/common/api/model/workout/workout_item.dart';

import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  final List<String> sections = [
    'All',
    'Newbie',
    'Medium',
    'Advanced',
  ];

  @override
  void initState() {
    context.read<WorkoutExerciseBloc>().add(WorkoutExerciseItemEvent(
        workoutCategoryType: WorkoutCategoryType.all,
        workoutId: widget.workoutItem.id));
    super.initState();
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
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                          height: 350,
                          width: MediaQuery.of(context).size.width,
                          child: Image(
                            image: CachedNetworkImageProvider(
                              workoutItem.imageUrl,
                            ),
                            fit: BoxFit.cover,
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 40),
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: theme
                                  .bottomNavigationBarTheme.unselectedItemColor,
                              size: 32,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 310),
                        child: Container(
                          height: 190,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: theme.colorScheme.tertiary,
                              borderRadius: BorderRadiusDirectional.only(
                                  topStart: Radius.circular(24),
                                  topEnd: Radius.circular(24))),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 8, left: 16, top: 16),
                                child: SizedBox(
                                  height: 30,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: sections.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final isSelected = index == selectedIndex;
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedIndex = index;
                                          });
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 1),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          decoration: BoxDecoration(
                                            color: isSelected
                                                ? theme.colorScheme.primary
                                                : const Color.fromARGB(
                                                    255, 39, 39, 39),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(sections[index],
                                              style: themeDark
                                                  .textTheme.headlineMedium),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: Text(
                                      workoutItem.title,
                                      style: theme.textTheme.displaySmall
                                          ?.copyWith(
                                        fontSize: 24,
                                        color: theme.colorScheme.onSurface,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: Text(
                                      'duration: ${workoutItem.subtitle} minutes',
                                      style: theme.textTheme.displaySmall
                                          ?.copyWith(
                                        fontSize: 16,
                                        color: theme.colorScheme.onSurface,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.favorite_border_outlined),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.width *
                                        0.12,
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            theme.colorScheme.primary,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Text(S.of(context).startWorkout,
                                          style: theme.textTheme.displaySmall
                                              ?.copyWith(fontSize: 18)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Exercises',
                          style: theme.textTheme.labelSmall,
                        ),
                        Container(
                            height: 400,
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount: state.workoutExercise.length,
                              itemBuilder: (context, index) =>
                                  CustomSubcategoryWorkout(
                                title:
                                    state.workoutExercise[index].exerciseName,
                                imagePath:
                                    state.workoutExercise[index].imageUrl,
                                repsNumber:
                                    state.workoutExercise[index].exerciseReps,
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              ),
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
