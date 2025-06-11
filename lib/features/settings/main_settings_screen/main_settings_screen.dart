import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainSettingsScreen extends StatelessWidget {
  const MainSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeDark = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeDark.appBarTheme.backgroundColor,
      ),
      backgroundColor: themeDark.scaffoldBackgroundColor,
      body: Column(
        children: [Center(child: Text('8888888888'),)],
      ),
    );
  }
}
