import 'dart:developer';

import 'package:ai_fit_coach/blocs/settings_cubit/settings_cubit.dart';
import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageOption {
  final String name;
  final String assetPath;
  final Locale locale;

  const LanguageOption({
    required this.name,
    required this.assetPath,
    required this.locale,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguageOption &&
          runtimeType == other.runtimeType &&
          locale == other.locale;

  @override
  int get hashCode => locale.hashCode;
}

@RoutePage()
class LanguageLocalizationScreen extends StatefulWidget {
  const LanguageLocalizationScreen({super.key});

  @override
  State<LanguageLocalizationScreen> createState() =>
      _LanguageLocalizationScreenState();
}

class _LanguageLocalizationScreenState
    extends State<LanguageLocalizationScreen> {
  // Static list of language options to ensure consistent instances
  static const List<LanguageOption> _languageOptions = [
    LanguageOption(
      name: 'English',
      assetPath: 'assets/images/languages/en.jpg',
      locale: Locale('en'),
    ),
    LanguageOption(
      name: 'French',
      assetPath: 'assets/images/languages/fr.png',
      locale: Locale('fr'),
    ),
    LanguageOption(
      name: 'German',
      assetPath: 'assets/images/languages/de.jpg',
      locale: Locale('de'),
    ),
    LanguageOption(
      name: 'Japanese',
      assetPath: 'assets/images/languages/jp.png',
      locale: Locale('ja'),
    ),
    LanguageOption(
      name: 'Portuguese',
      assetPath: 'assets/images/languages/pt.webp',
      locale: Locale('pt'),
    ),
    LanguageOption(
      name: 'Spanish',
      assetPath: 'assets/images/languages/es.png',
      locale: Locale('es'),
    ),
    LanguageOption(
      name: 'Ukrainian',
      assetPath: 'assets/images/languages/ua.png',
      locale: Locale('uk'),
    ),
  ];

  LanguageOption? _selectedLanguage;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final currentLocale = context.read<SettingsCubit>().state.locale;
    final supportedLocales = S.delegate.supportedLocales;

    // Перевіряємо, чи поточна локаль підтримується і є в _languageOptions
    try {
      if (supportedLocales.contains(currentLocale)) {
        _selectedLanguage = _languageOptions.firstWhere(
          (option) => option.locale == currentLocale,
          orElse: () {
            log('Locale $currentLocale not found in options, defaulting to Ukrainian');
            return _languageOptions
                .firstWhere((option) => option.locale == const Locale('uk'));
          },
        );
      } else {
        log('Unsupported locale: $currentLocale, defaulting to Ukrainian');
        _selectedLanguage = _languageOptions.firstWhere(
          (option) => option.locale == const Locale('uk'),
        );
      }
    } catch (e) {
      log('Error initializing selected language: $e, defaulting to Ukrainian');
      _selectedLanguage = _languageOptions.firstWhere(
        (option) => option.locale == const Locale('uk'),
      );
    }

    // Викликаємо setState, щоб оновити UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final supportedLocales = S.delegate.supportedLocales;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Text(
          S.of(context).languageLocalization,
          style: theme.textTheme.labelMedium,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.router.pop(),
        ),
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: DropdownButtonFormField<LanguageOption>(
              value: _selectedLanguage,
              decoration: InputDecoration(
                hintText: S.of(context).pleaseSelectPreferredLanguage,
                suffixIcon: const Icon(Icons.language),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),
                  borderSide: BorderSide(color: theme.colorScheme.onSurface),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: theme.colorScheme.onSurface),
                ),
              ),
              style: theme.dropdownMenuTheme.textStyle,
              dropdownColor: theme.scaffoldBackgroundColor,
              items: _languageOptions
                  .where((option) => supportedLocales.contains(option.locale))
                  .map((item) {
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
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.error),
                      ),
                      const SizedBox(width: 8),
                      Text(item.name),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (LanguageOption? newValue) async {
                if (newValue != null) {
                  try {
                    setState(() {
                      _selectedLanguage = newValue;
                    });

                    await context
                        .read<SettingsCubit>()
                        .changeLocale(newValue.locale);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Не вдалося змінити мову: $e')),
                    );
                  }
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
