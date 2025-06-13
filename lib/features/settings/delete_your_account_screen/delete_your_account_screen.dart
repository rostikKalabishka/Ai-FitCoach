import 'package:flutter/material.dart';

class DeleteYourAccountScreen extends StatelessWidget {
  const DeleteYourAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeDark = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeDark.appBarTheme.backgroundColor,
        title:
            Text('Delete Your Account', style: themeDark.textTheme.labelMedium),
        centerTitle: true,
      ),
      backgroundColor: themeDark.scaffoldBackgroundColor,
      body: ListView(
        children: [
          Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: text15.map((e) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(bottom: 8, left: 12, right: 12),
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
                children: text16.map((e) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(bottom: 8, left: 12, right: 12),
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
                children: text17.map((e) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(bottom: 8, left: 12, right: 12),
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
                children: text18.map((e) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(bottom: 8, left: 12, right: 12),
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
                children: text19.map((e) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(bottom: 8, left: 12, right: 12),
                    child: Text(
                      e,
                      style: themeDark.textTheme.headlineMedium,
                    ),
                  );
                }).toList(),
              ),
            ],
          )
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
