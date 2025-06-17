import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeDark = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeDark.appBarTheme.backgroundColor,
        title: Text('Privacy', style: themeDark.textTheme.labelMedium),
        centerTitle: true,
      ),
      backgroundColor: themeDark.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
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
                            Icon(FontAwesomeIcons.locationArrow),
                            const SizedBox(width: 10),
                            Text(
                              'Location Access',
                              style: themeDark.textTheme.headlineLarge,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Settings',
                              style: themeDark.textTheme.headlineSmall,
                            ),
                            const Icon(Icons.arrow_right_outlined)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
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
                            Icon(FontAwesomeIcons.shareNodes),
                            const SizedBox(width: 10),
                            Text(
                              'Share Progress',
                              style: themeDark.textTheme.headlineLarge,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Settings',
                              style: themeDark.textTheme.headlineSmall,
                            ),
                            const Icon(Icons.arrow_right_outlined)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 32),
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 110,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                  child: Text(
                    'Cancel',
                    style: themeDark.textTheme.labelSmall,
                  ),
                ),
              ),
              SizedBox(
                width: 110,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                  child: Text(
                    'Confirm',
                    style: themeDark.textTheme.labelSmall,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
