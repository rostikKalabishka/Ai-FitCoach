import 'package:ai_fit_coach/ui/widgets/text_widget.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    super.key,
    required this.message,
    required this.isUser,
  });

  final String message;
  final bool isUser;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Material(
          color: isUser ? theme.scaffoldBackgroundColor : theme.cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // isUser
                //     ? MyCircleAvatar(
                //         userImage: userUmage,
                //         radius: 15,
                //       )
                //     : Image.asset(
                //         AssetsManager.chatLogoImage,
                //         width: 30,
                //         height: 30,
                //       ),
                const SizedBox(width: 10),
                Expanded(
                  child: isUser
                      ? TextWidget(
                          label: message,
                          color: theme.textTheme.titleSmall?.color,
                        )
                      : DefaultTextStyle(
                          style: TextStyle(
                              color: theme.textTheme.titleSmall?.color,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          child: AnimatedTextKit(
                              isRepeatingAnimation: false,
                              repeatForever: true,
                              displayFullTextOnTap: true,
                              totalRepeatCount: 1,
                              animatedTexts: [
                                TyperAnimatedText(message.trim())
                              ]),
                        ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
