import 'package:flutter/material.dart';

final themeDark = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    iconTheme: IconThemeData(
      color: Colors.white
    ),
    appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white)),
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.black,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: WidgetStateColor.resolveWith(
                (states) => const Color.fromARGB(255, 66, 66, 66)))),
    textTheme: TextTheme(
      labelLarge: TextStyle(
          fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
      labelMedium: TextStyle(
          fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
      labelSmall: TextStyle(
          fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          headlineLarge: TextStyle(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(
          fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(
          fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
    ));
