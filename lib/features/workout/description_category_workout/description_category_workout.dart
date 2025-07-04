import 'package:flutter/material.dart';

import '../../../ui/ui.dart';

class DescriptionCategoryWorkout extends StatefulWidget {
  const DescriptionCategoryWorkout({super.key});

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
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/images/challenges/exercise/2.png',
                      fit: BoxFit.cover,
                    )),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
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
                              itemBuilder: (BuildContext context, int index) {
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
                                          ? const Color.fromARGB(255, 85, 0, 0)
                                          : const Color.fromARGB(
                                              255, 39, 39, 39),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(sections[index],
                                        style:
                                            themeDark.textTheme.headlineMedium),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 24),
                          child: Text(
                            'HIIT (High Intensity)',
                            style: theme.textTheme.displaySmall?.copyWith(
                              fontSize: 24,
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.favorite_border_outlined),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.width * 0.12,
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 39, 1, 21),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text('START WORKOUT',
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Exercises',
                        style: theme.textTheme.labelSmall,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomSubcategoryWorkout(
                        title: 'Push Ups',
                        imagePath: 'assets/images/challenges/exercise/2.png',
                        repsNumber: '15',
                      ),
                      CustomSubcategoryWorkout(
                        title: 'Push Ups',
                        imagePath: 'assets/images/challenges/exercise/2.png',
                        repsNumber: '15',
                      ),
                      CustomSubcategoryWorkout(
                        title: 'Push Ups',
                        imagePath: 'assets/images/challenges/exercise/2.png',
                        repsNumber: '15',
                      ),
                    ],
                  ),
                  Text(
                    'You might also like',
                    style: theme.textTheme.labelSmall,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      CustomSubcategoryWorkout(
                        title: 'Push Ups',
                        imagePath: 'assets/images/challenges/exercise/2.png',
                        repsNumber: '15',
                      ),
                      CustomSubcategoryWorkout(
                        title: 'Push Ups',
                        imagePath: 'assets/images/challenges/exercise/2.png',
                        repsNumber: '15',
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
