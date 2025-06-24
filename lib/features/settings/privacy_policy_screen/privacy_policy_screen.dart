import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeDark = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeDark.appBarTheme.backgroundColor,
        title: Text(
          'Privacy Policy',
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
            children: text0.map((e) {
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
            children: text1.map((e) {
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
            children: text2.map((e) {
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
            children: text3.map((e) {
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
            children: text4.map((e) {
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
            children: text5.map((e) {
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
            children: text6.map((e) {
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
            children: text7.map((e) {
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
            children: text8.map((e) {
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
            children: text9.map((e) {
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

List<String> text0 = [
  'Effective Date: [Insert Date].',
  'Last Updated: [Insert Date].',
  '[Your App Name] ("we", "our", or "us") operates the [Your App Name] mobile application (the "App"). This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our App.',
  'Please read this Privacy Policy carefully. If you do not agree with the terms, please do not access the App.',
];

List<String> text1 = [
  '1. Information We Collect',
  'We may collect and process the following types of information:',
  'a. Personal Data',
  'Information you voluntarily provide when you:',
  'Register or create an account (e.g., name, email address, age, etc.)',
  'Contact us for support',
  'b. Usage Data',
  'Automatically collected when using the App:',
  'Device information (e.g., device model, OS version)',
  'Log information (e.g., IP address, crash logs)',
  'App usage statistics and interactions',
  'c. Location Data',
  'We may collect precise or approximate location information if you grant us permission.',
];
List<String> text2 = [
  '2. How We Use Your Information',
  'We use your information to:',
  'Provide and maintain the App',
  'Improve the App’s performance and user experience',
  'Send notifications and important updates',
  'Respond to user inquiries and support requests',
  'Analyze usage and trends to enhance features',
];
List<String> text3 = [
  '3. Sharing Your Information',
  'We do not sell your personal data. We may share data with:',
  'Service Providers: To perform services on our behalf (e.g., analytics, crash reporting)',
  'Legal Requirements: If required by law or in response to legal processes',
  'Business Transfers: In connection with a merger, sale, or acquisition',
];
List<String> text4 = [
  '',
  '4. Third-Party Services',
  'Our App may include links or integrate with third-party services (e.g., Firebase, Google Analytics). These third parties have their own privacy policies, and we are not responsible for their practices.',
];
List<String> text5 = [
  '5. Data Security',
  'We implement appropriate technical and organizational measures to protect your information. However, no method of transmission over the Internet or method of electronic storage is 100% secure.',
];
List<String> text6 = [
  '6. Your Rights',
  'Depending on your location, you may have rights under applicable data protection laws, such as:',
  'Access or update your personal data',
  'Request deletion of your data',
  'Withdraw consent',
  'To exercise these rights, please contact us at: [Your Contact Email]',
];
List<String> text7 = [
  '7. Children’s Privacy',
  'Our App is not intended for children under the age of 13 (or the equivalent minimum age in your jurisdiction), and we do not knowingly collect data from such users.',
];
List<String> text8 = [
  '8. Changes to This Privacy Policy',
  'We may update this Privacy Policy from time to time. Changes will be posted on this page with an updated "Last Updated" date.',
];
List<String> text9 = [
  '9. Contact Us',
  'If you have any questions or concerns about this Privacy Policy, please contact us at:',
  'Email: [Your Contact Email]',
  'Address: [Optional Company Address]',
];
