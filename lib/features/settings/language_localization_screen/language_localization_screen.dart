import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../ui/ui.dart';

class LanguageOption {
  final String name;
  final String assetPath;

  const LanguageOption({
    required this.name,
    required this.assetPath,
  });
}

@RoutePage()
class LanguageLocalizationScreen extends StatelessWidget {
  const LanguageLocalizationScreen({super.key});

  final List<LanguageOption> languages = const [
    LanguageOption(name: 'English', assetPath: 'assets/images/languages/en.jpg'),
    LanguageOption(name: 'French', assetPath: 'assets/images/languages/fr.png'),
    LanguageOption(name: 'German', assetPath: 'assets/images/languages/de.jpg'),
    LanguageOption(name: 'Japanese', assetPath: 'assets/images/languages/jp.png'),
    LanguageOption(name: 'Portuguese', assetPath: 'assets/images/languages/pt.webp'),
    LanguageOption(name: 'Spanish', assetPath: 'assets/images/languages/es.png'),
    LanguageOption(name: 'Ukrainian', assetPath: 'assets/images/languages/ua.png'),
  ];

  void _showLanguage(BuildContext context, ThemeData theme) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: Colors.white, width: 1),
          ),
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              'Please select language',
              style: theme.textTheme.displaySmall?.copyWith(fontSize: 16),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(languages.length, (index) {
              final lang = languages[index];
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      print('Selected: ${lang.name}');
                    },
                    child: ListTile(
                      leading: Image.asset(
                        lang.assetPath,
                        width: 32,
                        height: 32,
                        fit: BoxFit.contain,
                      ),
                      title: Text(
                        lang.name,
                        style: theme.textTheme.displaySmall,
                      ),
                    ),
                  ),
                  if (index != languages.length - 1)
                    const Divider(thickness: 0.5),
                ],
              );
            }),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK', style: theme.textTheme.displaySmall),
            ),
          ],
        );
      },
    );
  }

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
          onTap: () => _showLanguage(context, theme),
          child: AbsorbPointer(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'Please select preferred language',
                  suffixIcon: const Icon(Icons.language),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: theme.colorScheme.onSurface),
                  ),
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
        padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomConfirmCancelButton(
              label: 'Cancel',
              onPressed: () => Navigator.pop(context),
            ),
            CustomConfirmCancelButton(
              label: 'Confirm',
              onPressed: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}
