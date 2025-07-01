import 'package:flutter/material.dart';

import '../../../ui/ui.dart';

class DescriptionCategoryWorkout extends StatelessWidget {
  const DescriptionCategoryWorkout({super.key});

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
                    height: 160,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: theme.colorScheme.tertiary,
                        borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(24),
                            topEnd: Radius.circular(24))),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(24),
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
