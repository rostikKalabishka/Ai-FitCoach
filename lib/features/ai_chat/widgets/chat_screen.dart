import 'package:ai_fit_coach/ui/widgets/widgets.dart';
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
          color: isUser ? Colors.black : Colors.blueAccent,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCircleAvatar(
                  radius: 20,
                  isUser: isUser,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: isUser
                      ? TextWidget(
                          label: message,
                          color: theme.textTheme.headlineLarge?.color,
                        )
                      : DefaultTextStyle(
                          style: TextStyle(
                              color: theme.textTheme.headlineLarge?.color,
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
