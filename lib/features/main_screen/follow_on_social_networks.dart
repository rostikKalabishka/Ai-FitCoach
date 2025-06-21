import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class FollowOnSocialNetworks extends StatelessWidget {
  const FollowOnSocialNetworks({super.key});

  @override
  Widget build(BuildContext context) {
    final themeDark = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Follow AI FitCoach on',
            style: themeDark.textTheme.labelSmall,
          ),
        ),
        SizedBox(height: 8,),
        Row(
          children: [
            IconButton(
              onPressed: () async {
                final url = Uri.parse('https://www.tiktok.com');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  print('Something happened, please try again');
                }
              },
              icon: Icon(Icons.tiktok),
            ),
            IconButton(onPressed: () async {
                final url = Uri.parse('https://www.facebook.com/');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  print('Something happened, please try again');
                }
              }, icon: Icon(Icons.facebook)),
            IconButton(onPressed: () async {
                final url = Uri.parse('https://x.com');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  print('Something happened, please try again');
                }
              }, icon: Icon(FontAwesomeIcons.xTwitter)),
            IconButton(onPressed: () async {
                final url = Uri.parse('https://www.youtube.com');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  print('Something happened, please try again');
                }
              }, icon: Icon(FontAwesomeIcons.youtube)),
            IconButton(
              onPressed: () async {
                final url = Uri.parse('https://www.instagram.com');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  print('Something happened, please try again');
                }
              },
              icon: Icon(FontAwesomeIcons.instagram),
            ),
            IconButton(onPressed: () async {
                final url = Uri.parse('https://www.whatsapp.com');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  print('Something happened, please try again');
                }
              }, icon: Icon(FontAwesomeIcons.whatsapp)),
          ],
        ),
        SizedBox(height: 20,),
      ],
    );
  }
}