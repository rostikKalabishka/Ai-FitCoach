import 'package:flutter/material.dart';

class CustomUserDataDialog extends StatelessWidget {
  final String hint;
  final IconData icon;
  final String dialogTitle;
  final List<DialogOption> options;

  const CustomUserDataDialog({
    required this.hint,
    required this.icon,
    required this.dialogTitle,
    required this.options,
  });

  void showSelectionDialog(BuildContext context, ThemeData theme) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: Colors.white, width: 1),
          ),
          backgroundColor: Colors.black,
          title: Text(
            dialogTitle,
            style: theme.textTheme.displaySmall?.copyWith(fontSize: 16),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: options
                .expand((option) => [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: ListTile(
                          leading: Icon(option.icon),
                          title: Text(option.label,
                              style: theme.textTheme.displaySmall),
                        ),
                      ),
                      const Divider(thickness: 0.5),
                    ])
                .toList(),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK', style: theme.textTheme.displaySmall),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => showSelectionDialog(context, theme),
      child: AbsorbPointer(
        child: TextField(
          readOnly: true,
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon: Icon(icon),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: theme.colorScheme.onSurface),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: theme.colorScheme.onSurface),
            ),
          ),
        ),
      ),
    );
  }
}

class DialogOption {
  final String label;
  final IconData icon;

  const DialogOption({required this.label, required this.icon});
}
