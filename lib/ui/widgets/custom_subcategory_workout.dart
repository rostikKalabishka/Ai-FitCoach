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
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {},
      child: Container(
        height: MediaQuery.of(context).size.height * 0.13,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: theme.colorScheme.tertiary),
        child: Column(
          children: [
            Row(
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
                        height: MediaQuery.of(context).size.height * 0.09,
                        width: MediaQuery.of(context).size.width * 0.2,
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
                          maxLines: 2,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                fontSize: 16,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '$repsNumber times',
                          style: theme.textTheme.displaySmall?.copyWith(
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
