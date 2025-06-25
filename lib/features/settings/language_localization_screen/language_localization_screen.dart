import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LanguageLocalizationScreen extends StatelessWidget {
  const LanguageLocalizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Text(
          'Language & Localization',
          style: theme.textTheme.labelMedium,
        ),
        centerTitle: true,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
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
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        'Please select language',
                        style: theme.textTheme.displaySmall?.copyWith(fontSize: 16),
                      ),
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
                              style: theme.textTheme.displaySmall,
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 0.5,
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
                              style: theme.textTheme.displaySmall,
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 0.5,
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
                              style: theme.textTheme.displaySmall,
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 0.5,
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
                              style: theme.textTheme.displaySmall,
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 0.5,
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
                              style: theme.textTheme.displaySmall,
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 0.5,
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
                              style: theme.textTheme.displaySmall,
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 0.5,
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
                              style: theme.textTheme.displaySmall,
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 0.5,
                      ),
                    ],
                  ),
                  actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            'OK',
                            style: theme.textTheme.displaySmall,
                          ),
                        ),
                      ],
                );
              },
            );
          },
          child: AbsorbPointer(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: theme.colorScheme.onSurface),
                      ),
                      suffixIcon: Icon(Icons.language),
                      hintText: 'Please select preferred language',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: theme.colorScheme.onSurface),
                      ),
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
                    style: theme.textTheme.labelSmall,
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
                    style: theme.textTheme.labelSmall,
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
