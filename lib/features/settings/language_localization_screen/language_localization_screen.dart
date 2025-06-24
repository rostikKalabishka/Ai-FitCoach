import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LanguageLocalizationScreen extends StatelessWidget {
  const LanguageLocalizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeDark = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeDark.appBarTheme.backgroundColor,
        title: Text(
          'Language & Localization',
          style: themeDark.textTheme.labelMedium,
        ),
        centerTitle: true,
      ),
      backgroundColor: themeDark.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor: Colors.black,
                  title: Center(
                    child: Text(
                      'Please select language',
                      style: themeDark.textTheme.labelSmall,
                    ),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: InkWell(
                          onTap: () {},
                          child: ListTile(
                            leading: Image.asset(
                              'assets/images/languages/en.jpg',
                              scale: 1,
                              width: 32,
                              height: 32,
                              fit: BoxFit.contain,
                            ),
                            title: Text(
                              'English',
                              style: themeDark.textTheme.headlineMedium,
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 0.5,
                        color: Colors.white,
                      ),
                      Container(
                        child: InkWell(
                          onTap: () {},
                          child: ListTile(
                            leading: Image.asset(
                              'assets/images/languages/fr.png',
                              scale: 1,
                              width: 32,
                              height: 32,
                              fit: BoxFit.contain,
                            ),
                            title: Text(
                              'French',
                              style: themeDark.textTheme.headlineMedium,
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 0.5,
                        color: Colors.white,
                      ),
                      Container(
                        child: InkWell(
                          onTap: () {},
                          child: ListTile(
                            leading: Image.asset(
                              'assets/images/languages/de.jpg',
                              scale: 1,
                              width: 32,
                              height: 32,
                              fit: BoxFit.contain,
                            ),
                            title: Text(
                              'German',
                              style: themeDark.textTheme.headlineMedium,
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 0.5,
                        color: Colors.white,
                      ),
                      Container(
                        child: InkWell(
                          onTap: () {},
                          child: ListTile(
                            leading: Image.asset(
                              'assets/images/languages/jp.png',
                              scale: 1,
                              width: 32,
                              height: 32,
                              fit: BoxFit.contain,
                            ),
                            title: Text(
                              'Japanese',
                              style: themeDark.textTheme.headlineMedium,
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 0.5,
                        color: Colors.white,
                      ),
                      Container(
                        child: InkWell(
                          onTap: () {},
                          child: ListTile(
                            leading: Image.asset(
                              'assets/images/languages/pt.webp',
                              scale: 1,
                              width: 32,
                              height: 32,
                              fit: BoxFit.contain,
                            ),
                            title: Text(
                              'Portuguese',
                              style: themeDark.textTheme.headlineMedium,
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 0.5,
                        color: Colors.white,
                      ),
                      Container(
                        child: InkWell(
                          onTap: () {},
                          child: ListTile(
                            leading: Image.asset(
                              'assets/images/languages/es.png',
                              scale: 1,
                              width: 32,
                              height: 32,
                              fit: BoxFit.contain,
                            ),
                            title: Text(
                              'Spanish',
                              style: themeDark.textTheme.headlineMedium,
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 0.5,
                        color: Colors.white,
                      ),
                      Container(
                        child: InkWell(
                          onTap: () {},
                          child: ListTile(
                            leading: Image.asset(
                              'assets/images/languages/ua.png',
                              scale: 0.1,
                              width: 32,
                              height: 32,
                              fit: BoxFit.contain,
                            ),
                            title: Text(
                              'Ukrainian',
                              style: themeDark.textTheme.headlineMedium,
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 0.5,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            'OK',
                            style: themeDark.textTheme.headlineMedium,
                          ),
                        ),
                      ],
                );
              },
            );
          },
          child: AbsorbPointer(
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white24),
                    ),
                    suffixIcon: Icon(Icons.language),
                    hintText: 'Please select preferred language',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.white24),
                    ),
                  ),
                ),
              ),
          
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
