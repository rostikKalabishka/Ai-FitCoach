import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RateUsScreen extends StatelessWidget {
  const RateUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeDark = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeDark.appBarTheme.backgroundColor,
        title: Text(
          'Rate Us',
          style: themeDark.textTheme.labelMedium,
        ),
        centerTitle: true,
      ),
      backgroundColor: themeDark.scaffoldBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: text10.map((e) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 12, right: 12),
                child: Text(
                  e,
                  style: themeDark.textTheme.headlineMedium,
                ),
              );
            }).toList(),
          ),
          SizedBox(
            height: 16,
          ),
          Divider(
            thickness: 0.5,
            color: Colors.white,
          ),
          SizedBox(
            height: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: text11.map((e) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 12, right: 12),
                child: Text(
                  e,
                  style: themeDark.textTheme.headlineMedium,
                ),
              );
            }).toList(),
          ),
          SizedBox(
            height: 16,
          ),
          Divider(
            thickness: 0.5,
            color: Colors.white,
          ),
          SizedBox(
            height: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: text12.map((e) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 12, right: 12),
                child: Text(
                  e,
                  style: themeDark.textTheme.headlineMedium,
                ),
              );
            }).toList(),
          ),
          SizedBox(
            height: 16,
          ),
          Divider(
            thickness: 0.5,
            color: Colors.white,
          ),
          SizedBox(
            height: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: text13.map((e) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 12, right: 12),
                child: Text(
                  e,
                  style: themeDark.textTheme.headlineMedium,
                ),
              );
            }).toList(),
          ),
          SizedBox(
            height: 16,
          ),
          Divider(
            thickness: 0.5,
            color: Colors.white,
          ),
          SizedBox(
            height: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: text14.map((e) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 12, right: 12),
                child: Text(
                  e,
                  style: themeDark.textTheme.headlineMedium,
                ),
              );
            }).toList(),
          ),
        ],
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

List<String> text10 = [
  'We appreciate your feedback! The "Rate Us" feature helps us improve the quality of our app, gather user insights, and provide a better experience for everyone.',
];
List<String> text11 = [
  '1. How the "Rate Us" Feature Works',
  'When you use the "Rate Us" option:',
  'You may be redirected to our app’s page on the App Store or Google Play to leave a review or rating.',
  'We do not collect any personal information through this feature without your explicit consent.',
];
List<String> text12 = [
  '2. Data Collection During Rating',
  'If you are simply redirected to the app store — no data is collected by us.',
  'If you leave a review or rating, it is submitted through the App Store or Google Play platforms and governed by their own privacy policies, not ours.',
];
List<String> text13 = [
  '3. Why Your Rating Matters',
  'Your ratings and reviews:',
  'Help other users discover and trust our app',
  'Provide us with valuable feedback to improve features or fix issues',
  'Support the ongoing development and improvement of the app',
];
List<String> text14 = [
  '4. Contact Us Directly',
  'Having issues or suggestions? Instead of leaving a negative review, feel free to reach out to us directly — we’re always happy to help!',
  'Support Email: [Your Contact Email]',
];
