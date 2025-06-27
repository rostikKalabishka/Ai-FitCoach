import 'package:flutter/material.dart';

class CustomActivityTrackingContainer extends StatelessWidget {
  const CustomActivityTrackingContainer({
    super.key,
    required this.theme,
    required this.title,
    required this.subtitle,
    required this.selectedIcon,
  });

  final ThemeData theme;
  final String title;
  final String subtitle;
  final Icon selectedIcon;

  @override
  Widget build(BuildContext context) {
    return Center(
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
                    selectedIcon,
                    SizedBox(width: 10),
                    Text(
                      title,
                      style: theme.textTheme.headlineLarge,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      subtitle,
                      style: theme.textTheme.headlineSmall,
                    ),
                    Icon(Icons.arrow_right_outlined)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}