import 'package:flutter/material.dart';

class DoNotDisturbModeScreen extends StatelessWidget {
  const DoNotDisturbModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeDark = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeDark.appBarTheme.backgroundColor,
      ),
      backgroundColor: themeDark.scaffoldBackgroundColor,
      body: Column(
        children: [Center(child: Text('6666666666666'),)],
      ),
    );
  }
}