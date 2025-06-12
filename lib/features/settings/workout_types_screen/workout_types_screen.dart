import 'package:flutter/material.dart';

class WorkoutTypesScreen extends StatelessWidget {
  const WorkoutTypesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeDark = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeDark.appBarTheme.backgroundColor,
      ),
      backgroundColor: themeDark.scaffoldBackgroundColor,
      body: Column(
        children: [Center(child: Text('1515151515'),)],
      ),
    );
  }
}