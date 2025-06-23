import 'package:ai_fit_coach/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomSubcategoryWorkout extends StatelessWidget {
  final String title;
  final String imagePath;
  final String repsNumber;

  const CustomSubcategoryWorkout(
      {super.key,
      required this.title,
      required this.imagePath,
      required this.repsNumber});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        height: 95,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: const Color.fromARGB(255, 0, 0, 0)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    imagePath,
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: themeDark.textTheme.headlineLarge,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '$repsNumber times',
                      style: themeDark.textTheme.headlineMedium,
                    ),
                  ],
                ),
              ],
            ),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
