import 'package:flutter/material.dart';

class AutomaticActivityTrackingScreen extends StatelessWidget {
  const AutomaticActivityTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeDark = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeDark.appBarTheme.backgroundColor,
      ),
      backgroundColor: themeDark.scaffoldBackgroundColor,
      body: Column(
        children: [Center(child: Text('222222222222'),)],
      ),
    );
  }
}