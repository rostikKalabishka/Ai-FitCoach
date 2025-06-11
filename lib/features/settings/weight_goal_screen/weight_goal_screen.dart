import 'package:flutter/material.dart';

class WeightGoalScreen extends StatelessWidget {
  const WeightGoalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeDark = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeDark.appBarTheme.backgroundColor,
      ),
      backgroundColor: themeDark.scaffoldBackgroundColor,
      body: Column(
        children: [Center(child: Text('1414141414'),)],
      ),
    );
  }
}