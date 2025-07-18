import 'package:ai_fit_coach/generated/l10n.dart';
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final List<PrivacyOption> options = [
      PrivacyOption(
        icon: FontAwesomeIcons.locationArrow,
        label: S.of(context).locationAccess,
      ),
      PrivacyOption(
        icon: FontAwesomeIcons.shareNodes,
        label: S.of(context).shareProgress,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Text(S.of(context).privacy, style: theme.textTheme.labelMedium),
        centerTitle: true,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: List.generate(options.length, (index) {
              final option = options[index];
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
    );
  }
}
