import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:ai_fit_coach/repositories/analytics_repository/abstract_analytics_repository.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

class FollowOnSocialNetworks extends StatelessWidget {
  final Function(String)? onSocialNetworkClick;

  const FollowOnSocialNetworks({super.key, this.onSocialNetworkClick});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final analyticsRepository = GetIt.instance<AbstractAnalyticsRepository>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            S.of(context).followOnName("AI FitCoach"),
            style: theme.textTheme.labelSmall,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            IconButton(
              onPressed: () async {
                const network = 'tiktok';
                final url = Uri.parse('https://www.tiktok.com');
                // Виклик колбеку для TrendingScreen
                onSocialNetworkClick?.call(network);
                // Логування натискання
                await analyticsRepository.logEvent(
                  name: 'social_network_click',
                  parameters: {
                    'screen_name': 'trending_screen',
                    'network': network,
                  },
                );
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  // Логування помилки
                  await analyticsRepository.logEvent(
                    name: 'social_network_error',
                    parameters: {
                      'screen_name': 'trending_screen',
                      'network': network,
                      'error_message': 'cannot_launch_url',
                    },
                  );
                  print(S.of(context).somethingHappenedPleaseTryAgain);
                }
              },
              icon: const Icon(FontAwesomeIcons.tiktok),
            ),
            IconButton(
              onPressed: () async {
                const network = 'facebook';
                final url = Uri.parse('https://www.facebook.com');
                onSocialNetworkClick?.call(network);
                await analyticsRepository.logEvent(
                  name: 'social_network_click',
                  parameters: {
                    'screen_name': 'trending_screen',
                    'network': network,
                  },
                );
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  await analyticsRepository.logEvent(
                    name: 'social_network_error',
                    parameters: {
                      'screen_name': 'trending_screen',
                      'network': network,
                      'error_message': 'cannot_launch_url',
                    },
                  );
                  print(S.of(context).somethingHappenedPleaseTryAgain);
                }
              },
              icon: const Icon(FontAwesomeIcons.facebook),
            ),
            IconButton(
              onPressed: () async {
                const network = 'x';
                final url = Uri.parse('https://x.com');
                onSocialNetworkClick?.call(network);
                await analyticsRepository.logEvent(
                  name: 'social_network_click',
                  parameters: {
                    'screen_name': 'trending_screen',
                    'network': network,
                  },
                );
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  await analyticsRepository.logEvent(
                    name: 'social_network_error',
                    parameters: {
                      'screen_name': 'trending_screen',
                      'network': network,
                      'error_message': 'cannot_launch_url',
                    },
                  );
                  print(S.of(context).somethingHappenedPleaseTryAgain);
                }
              },
              icon: const Icon(FontAwesomeIcons.xTwitter),
            ),
            IconButton(
              onPressed: () async {
                const network = 'instagram';
                final url = Uri.parse('https://www.instagram.com');
                onSocialNetworkClick?.call(network);
                await analyticsRepository.logEvent(
                  name: 'social_network_click',
                  parameters: {
                    'screen_name': 'trending_screen',
                    'network': network,
                  },
                );
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  await analyticsRepository.logEvent(
                    name: 'social_network_error',
                    parameters: {
                      'screen_name': 'trending_screen',
                      'network': network,
                      'error_message': 'cannot_launch_url',
                    },
                  );
                  print(S.of(context).somethingHappenedPleaseTryAgain);
                }
              },
              icon: const Icon(FontAwesomeIcons.instagram),
            ),
            IconButton(
              onPressed: () async {
                const network = 'whatsapp';
                final url = Uri.parse('https://www.whatsapp.com');
                onSocialNetworkClick?.call(network);
                await analyticsRepository.logEvent(
                  name: 'social_network_click',
                  parameters: {
                    'screen_name': 'trending_screen',
                    'network': network,
                  },
                );
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  await analyticsRepository.logEvent(
                    name: 'social_network_error',
                    parameters: {
                      'screen_name': 'trending_screen',
                      'network': network,
                      'error_message': 'cannot_launch_url',
                    },
                  );
                  print(S.of(context).somethingHappenedPleaseTryAgain);
                }
              },
              icon: const Icon(FontAwesomeIcons.whatsapp),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
