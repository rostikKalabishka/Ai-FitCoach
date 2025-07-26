import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomSubcategoryWorkout extends StatelessWidget {
  final String title;
  final String? imagePath;
  final String repsNumber;

  const CustomSubcategoryWorkout({
    super.key,
    required this.title,
    this.imagePath,
    required this.repsNumber,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {},
      child: Container(
        height: MediaQuery.of(context).size.height * 0.115,
        width: double.infinity,
        decoration: BoxDecoration(color: theme.colorScheme.tertiary),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (imagePath != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image(
                      image: CachedNetworkImageProvider(imagePath!),
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: screenWidth * 0.2,
                      fit: BoxFit.cover,
                    ),
                  ),
                const SizedBox(width: 16),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: screenWidth * 0.65, 
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.displaySmall?.copyWith(
                          fontSize: 16,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        repsNumber,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.displaySmall?.copyWith(
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
