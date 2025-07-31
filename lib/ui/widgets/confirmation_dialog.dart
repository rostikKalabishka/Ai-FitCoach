import 'package:ai_fit_coach/ui/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    super.key,
    required this.title,
    this.content,
    required this.onConfirm,
    this.confirmText = 'Yes',
    this.cancelText = 'No',
  });

  final String title;
  final Widget? content;
  final VoidCallback onConfirm;
  final String confirmText;
  final String cancelText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (theme.isAndroid) {
      return AlertDialog(
        title: Text(title, style: theme.textTheme.headlineSmall),
        content: content,
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(cancelText,
                style: theme.textTheme.headlineSmall?.copyWith(fontSize: 24)),
          ),
          TextButton(
            onPressed: () {
              onConfirm.call();
              // Navigator.of(context).pop();
            },
            child: Text(confirmText,
                style: theme.textTheme.headlineSmall?.copyWith(fontSize: 24)),
          ),
        ],
      );
    }

    return CupertinoAlertDialog(
      title: Text(title),
      content: content,
      actions: [
        CupertinoDialogAction(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(cancelText,
              style: TextStyle(color: theme.cupertinoAlertColor)),
        ),
        CupertinoDialogAction(
          onPressed: () {
            onConfirm.call();
            // Navigator.of(context).pop();
          },
          isDestructiveAction: true,
          child: Text(
            confirmText,
            style: TextStyle(color: theme.cupertinoActionColor),
          ),
        ),
      ],
    );
  }
}
