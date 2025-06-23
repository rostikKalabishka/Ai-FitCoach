import 'package:flutter/material.dart';

class SelectionButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final Color selectedColor;

  const SelectionButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    this.selectedColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Material(
        color: isSelected ? selectedColor : Colors.grey[800],
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTap,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
