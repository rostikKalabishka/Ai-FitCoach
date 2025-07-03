import 'package:ai_fit_coach/features/workout/workout.dart';
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:flutter/material.dart';

class CategoriesWorkout extends StatefulWidget {
  const CategoriesWorkout({super.key});

  @override
  State<CategoriesWorkout> createState() => _CategoriesWorkoutState();
}

class _CategoriesWorkoutState extends State<CategoriesWorkout> {
  int selectedIndex = 0;

  final List<Widget> screens = [
    CategoriesNewbiesScreen(),
    CategoriesMediumScreen(),
    CategoriesAdvancedScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<String> sections = [
      S.of(context).newbie,
      S.of(context).medium,
      S.of(context).advanced,
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Text(S.of(context).nameOfWorkoutWhatYoullChoose,
            style: theme.textTheme.labelMedium),
        centerTitle: true,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Column(
        children: [
          SizedBox(
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
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color.fromARGB(255, 39, 1, 21)
                          : const Color.fromARGB(255, 39, 39, 39),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: Text(sections[index],
                        style: theme.textTheme.displaySmall),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: screens[selectedIndex],
          ),
        ],
      ),
    );
  }
}
