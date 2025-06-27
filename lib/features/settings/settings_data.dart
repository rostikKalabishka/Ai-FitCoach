import 'package:flutter/material.dart';

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

List<String> text15 = [
  'We respect your right to control your personal data. If you wish to delete your account, we provide an easy way to request full removal of your information.',
];

List<String> text16 = [
  '1. How to Delete Your Account',
  'You can request to delete your account by:',
  'Using the “Delete Account” option in the app (if available), or',
  'Contacting us directly at [Your Contact Email] with the subject line “Account Deletion Request”',
];

List<String> text17 = [
  '2. What Happens When You Delete Your Account',
  'Once we receive your request:',
  'We will permanently delete your account and associated personal data from our systems (unless retention is required by law).',
  'Your app usage history, preferences, and any stored data will be removed and cannot be restored.',
  'Some anonymized or aggregated data may be retained for internal analysis and legal purposes, but it cannot be linked back to you.',
];

List<String> text18 = [
  '3. Data Retention Exceptions',
  'We may retain certain information if:',
  'Required by law or legal obligations (e.g., fraud prevention, accounting)',
  'Necessary for resolving disputes or enforcing our policies',
  'In such cases, we ensure the data is kept securely and only for as long as needed.',
];

List<String> text19 = [
  '4. Need Help?',
  'If you have questions or need help with account deletion, please contact us at:',
  'Email: [Your Contact Email]',
];

List<Widget> buildSection(ThemeData theme, List<String> texts) {
    return [
      const SizedBox(height: 16),
      ...texts.map(
        (text) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Text(
            text,
            style: theme.textTheme.headlineMedium,
          ),
        ),
      ),
      const SizedBox(height: 16),
    ];
  }
