import 'package:ai_fit_coach/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class FollowOnSocialNetworks extends StatelessWidget {
  const FollowOnSocialNetworks({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
        SizedBox(
          height: 8,
        ),
        Row(
          children: [
            IconButton(
              onPressed: () async {
                final url = Uri.parse('https://www.tiktok.com');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  print(S.of(context).somethingHappenedPleaseTryAgain);
                }
              },
              icon: Icon(FontAwesomeIcons.tiktok),
            ),
            IconButton(
                onPressed: () async {
                  final url = Uri.parse('https://www.facebook.com/');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  } else {
                    print(S.of(context).somethingHappenedPleaseTryAgain);
                  }
                },
                icon: Icon(FontAwesomeIcons.facebook)),
            IconButton(
                onPressed: () async {
                  final url = Uri.parse('https://x.com');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  } else {
                    print(S.of(context).somethingHappenedPleaseTryAgain);
                  }
                },
                icon: Icon(FontAwesomeIcons.xTwitter)),
            IconButton(
              onPressed: () async {
                final url = Uri.parse('https://www.instagram.com');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  print(S.of(context).somethingHappenedPleaseTryAgain);
                }
              },
              icon: Icon(FontAwesomeIcons.instagram),
            ),
            IconButton(
                onPressed: () async {
                  final url = Uri.parse('https://www.whatsapp.com');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  } else {
                    print(S.of(context).somethingHappenedPleaseTryAgain);
                  }
                },
                icon: Icon(FontAwesomeIcons.whatsapp)),
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
