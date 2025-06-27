import 'package:ai_fit_coach/common/lib/chat_seen_messages.dart';
import 'package:flutter/material.dart';

import '../../../ui/ui.dart';

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
    final wasSeen = seenMessages.contains(message);
    if (!wasSeen && !isUser) {
      seenMessages.add(message);
    }

    return Column(
      children: [
        Material(
          color: isUser ? theme.scaffoldBackgroundColor : theme.primaryColor,
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
                      : TyperWithBoldText(
                          message: message.trim(),
                          shouldAnimate: !wasSeen,
                          textStyle: TextStyle(
                            color: theme.textTheme.headlineLarge?.color,
                            fontSize: 18,
                          ),
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
