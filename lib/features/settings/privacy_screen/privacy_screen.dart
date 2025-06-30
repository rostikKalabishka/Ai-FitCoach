import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../ui/ui.dart';

class PrivacyOption {
  final IconData icon;
  final String label;

  const PrivacyOption({
    required this.icon,
    required this.label,
  });
}

@RoutePage()
class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  final List<PrivacyOption> _options = const [
    PrivacyOption(
      icon: FontAwesomeIcons.locationArrow,
      label: 'Location Access',
    ),
    PrivacyOption(
      icon: FontAwesomeIcons.shareNodes,
      label: 'Share Progress',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Text('Privacy', style: theme.textTheme.labelMedium),
        centerTitle: true,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: List.generate(_options.length, (index) {
              final option = _options[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: CustomPrivacyCard(
                  icon: option.icon,
                  label: option.label,
                  onTap: () {
                    print('Tapped on ${option.label}');
                  },
                ),
              );
            }),
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

