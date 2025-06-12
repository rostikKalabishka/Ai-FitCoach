import 'package:flutter/material.dart';

class DifficultyLevelScreen extends StatelessWidget {
  const DifficultyLevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeDark = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: themeDark.appBarTheme.backgroundColor,
          title:
              Text('Difficulty Level', style: themeDark.textTheme.labelMedium),
          centerTitle: true,
        ),
        backgroundColor: themeDark.scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: 60,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.looks_one),
                              SizedBox(width: 10),
                              Text(
                                'Beginner',
                                style: themeDark.textTheme.headlineLarge,
                              ),
                            ],
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: 60,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.looks_two),
                              SizedBox(width: 10),
                              Text(
                                'Intermediate',
                                style: themeDark.textTheme.headlineLarge,
                              ),
                            ],
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: 60,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.looks_one),
                              SizedBox(width: 10),
                              Text(
                                'Advanced',
                                style: themeDark.textTheme.headlineLarge,
                              ),
                            ],
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
