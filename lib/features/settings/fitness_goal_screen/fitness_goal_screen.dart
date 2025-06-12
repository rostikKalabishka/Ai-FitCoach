import 'package:flutter/material.dart';

class FitnessGoalScreen extends StatelessWidget {
  const FitnessGoalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeDark = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeDark.appBarTheme.backgroundColor,
        title: Text('Fitness Goal', style: themeDark.textTheme.labelMedium),
        centerTitle: true,
      ),
      backgroundColor: themeDark.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: InkWell(
                onTap: (){},
                child: Container(
                  height: 60,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          spacing: 15,
                          children: [
                            Icon(Icons.scale),
                            Text('Weight Loss',
                                textAlign: TextAlign.start,
                                style: themeDark.textTheme.headlineLarge),
                            SizedBox(width: 180),
                          ],
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: InkWell(
                onTap: (){},
                child: Container(
                  height: 60,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          spacing: 15,
                          children: [
                            Icon(Icons.fitness_center),
                            Text('Muscle Gain',
                                textAlign: TextAlign.start,
                                style: themeDark.textTheme.headlineLarge),
                            SizedBox(width: 180),
                          ],
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: InkWell(
                onTap: (){},
                child: Container(
                  height: 60,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          spacing: 15,
                          children: [
                            Icon(Icons.accessibility_new),
                            Text('Stay Fit',
                                textAlign: TextAlign.start,
                                style: themeDark.textTheme.headlineLarge),
                            SizedBox(width: 215),
                          ],
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: InkWell(
                onTap: (){},
                child: Container(
                  height: 60,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          spacing: 15,
                          children: [
                            Icon(Icons.more_horiz),
                            Text('Other',
                                textAlign: TextAlign.start,
                                style: themeDark.textTheme.headlineLarge),
                            SizedBox(width: 230),
                          ],
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
