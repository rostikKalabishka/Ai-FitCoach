import 'package:flutter/material.dart';

class DifficultyLevelScreen extends StatelessWidget {
  const DifficultyLevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeDark = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeDark.appBarTheme.backgroundColor,
      ),
      backgroundColor: themeDark.scaffoldBackgroundColor,
      body: Column(
        children: [Center(child: Text('555555555555'),)],
      ),
    );
  }
}