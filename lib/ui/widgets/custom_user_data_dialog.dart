import 'package:flutter/material.dart';
import 'package:ai_fit_coach/generated/l10n.dart';

class CustomUserDataDialog extends StatelessWidget {
  final String hint;
  final IconData icon;
  final String dialogTitle;
  final List<DialogOption> options;
  final dynamic selectedValue; // String? or List<String>?
  final ValueChanged<dynamic> onSelected; // String or List<String>
  final bool isMultiSelect;

  const CustomUserDataDialog({
    super.key,
    required this.hint,
    required this.icon,
    required this.dialogTitle,
    required this.options,
    this.selectedValue,
    required this.onSelected,
    this.isMultiSelect = false,
  });

  void showSelectionDialog(BuildContext context, ThemeData theme) {
    if (isMultiSelect) {
      showDialog(
        context: context,
        builder: (_) => MultiSelectDialog(
          title: dialogTitle,
          options: options,
          initialSelected: selectedValue as List<String>? ?? [],
          theme: theme,
          onConfirm: (selected) => onSelected(selected),
        ),
      );
    } else {
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
                            onSelected(option.label);
                            Navigator.pop(context);
                          },
                          child: ListTile(
                            leading: Icon(option.icon),
                            title: Text(
                              option.label,
                              style: theme.textTheme.displaySmall,
                            ),
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
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final displayValue = isMultiSelect
        ? (selectedValue as List<String>?)?.join(', ') ??
            S.of(context).notSelected
        : (selectedValue as String?) ?? S.of(context).notSelected;
    return GestureDetector(
      onTap: () => showSelectionDialog(context, theme),
      child: AbsorbPointer(
        child: TextField(
          readOnly: true,
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon: Icon(icon),
            labelText: displayValue,
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

class MultiSelectDialog extends StatefulWidget {
  final String title;
  final List<DialogOption> options;
  final List<String> initialSelected;
  final ThemeData theme;
  final ValueChanged<List<String>> onConfirm;

  const MultiSelectDialog({
    super.key,
    required this.title,
    required this.options,
    required this.initialSelected,
    required this.theme,
    required this.onConfirm,
  });

  @override
  _MultiSelectDialogState createState() => _MultiSelectDialogState();
}

class _MultiSelectDialogState extends State<MultiSelectDialog> {
  late List<String> selected;

  @override
  void initState() {
    super.initState();
    selected = List.from(widget.initialSelected);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Colors.white, width: 1),
      ),
      backgroundColor: Colors.black,
      title: Text(
        widget.title,
        style: widget.theme.textTheme.displaySmall?.copyWith(fontSize: 16),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: widget.options
              .map((option) => CheckboxListTile(
                    title: Text(
                      option.label,
                      style: widget.theme.textTheme.displaySmall,
                    ),
                    secondary: Icon(option.icon),
                    value: selected.contains(option.label),
                    onChanged: (checked) {
                      setState(() {
                        if (checked == true) {
                          selected.add(option.label);
                        } else {
                          selected.remove(option.label);
                        }
                      });
                    },
                  ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            S.of(context).cancel,
            style: widget.theme.textTheme.displaySmall,
          ),
        ),
        TextButton(
          onPressed: () {
            widget.onConfirm(selected);
            Navigator.pop(context);
          },
          child: Text(
            S.of(context).confirm,
            style: widget.theme.textTheme.displaySmall,
          ),
        ),
      ],
    );
  }
}

class DialogOption {
  final String label;
  final IconData icon;

  const DialogOption({required this.label, required this.icon});
}
