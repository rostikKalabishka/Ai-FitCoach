import 'package:flutter/material.dart';

class CustomTrendingCard extends StatelessWidget {
  final String title;

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 65fafef (food, challenges methods, conn to ux/ui)
  const CustomTrendingCard({
    super.key,
    required this.title,
  });
<<<<<<< HEAD
=======
  const CustomTrendingCard(
      {super.key,
      required this.title,});
>>>>>>> a52f4f2 (methods, conn data to trending recommendations)
=======
>>>>>>> 65fafef (food, challenges methods, conn to ux/ui)

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 65fafef (food, challenges methods, conn to ux/ui)
    return Container(
        height: MediaQuery.of(context).size.height * 0.07,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          color: theme.colorScheme.tertiary,
<<<<<<< HEAD
=======
    return InkWell(
      onTap: () {},
      child: Container(
        height: MediaQuery.of(context).size.height * 0.10,
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
                      ],
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
          ],
>>>>>>> a52f4f2 (methods, conn data to trending recommendations)
=======
>>>>>>> 65fafef (food, challenges methods, conn to ux/ui)
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  title,
                  maxLines: 3,
                  softWrap: true,
                  overflow: TextOverflow.visible, 
                  style: theme.textTheme.displaySmall?.copyWith(
                    fontSize: 16,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
