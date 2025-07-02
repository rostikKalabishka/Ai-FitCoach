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
class LanguageLocalizationScreen extends StatefulWidget {
  const LanguageLocalizationScreen({super.key});

  @override
  State<LanguageLocalizationScreen> createState() => _LanguageLocalizationScreenState();
}

class _LanguageLocalizationScreenState extends State<LanguageLocalizationScreen> {
  final List<LanguageOption> languages = const [
    LanguageOption(name: 'English', assetPath: 'assets/images/languages/en.jpg'),
    LanguageOption(name: 'French', assetPath: 'assets/images/languages/fr.png'),
    LanguageOption(name: 'German', assetPath: 'assets/images/languages/de.jpg'),
    LanguageOption(name: 'Japanese', assetPath: 'assets/images/languages/jp.png'),
    LanguageOption(name: 'Portuguese', assetPath: 'assets/images/languages/pt.webp'),
    LanguageOption(name: 'Spanish', assetPath: 'assets/images/languages/es.png'),
    LanguageOption(name: 'Ukrainian', assetPath: 'assets/images/languages/ua.png'),
  ];

  LanguageOption? _selectedLanguage;

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: DropdownButtonFormField<LanguageOption>(
            value: _selectedLanguage,
            decoration: InputDecoration(
              hintText: 'Please select preferred language',
              suffixIcon: const Icon(Icons.language),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide(color: theme.colorScheme.onSurface),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: theme.colorScheme.onSurface),
              ),
            ),
            items: languages.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Row(
                  children: [
                    const SizedBox(width: 16),
                    Image.asset(
                      item.assetPath,
                      width: 24,
                      height: 24,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 8),
                    Text(item.name),
                  ],
                ),
              );
            }).toList(),
            onChanged: (LanguageOption? newValue) {
              setState(() {
                _selectedLanguage = newValue;
              });
            },
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
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
