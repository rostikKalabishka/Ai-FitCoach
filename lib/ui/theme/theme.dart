import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final themeDark = ThemeData.dark().copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.black,
    primary: const Color.fromARGB(255, 11, 29, 81),
    secondary: Colors.deepOrange,
    tertiary: Colors.black,
    onTertiary: Colors.grey,
    brightness: Brightness.dark,
  ),
  cardTheme: CardThemeData(
    color: const Color.fromARGB(255, 26, 33, 48),
  ),
  dropdownMenuTheme: DropdownMenuThemeData(
    textStyle: TextStyle(color: const Color.fromARGB(255, 255, 255, 255))
  ),
  dividerTheme: DividerThemeData(color: Colors.white),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(color: Colors.white),
    unselectedItemColor: const Color.fromARGB(255, 131, 180, 255),
    selectedItemColor: Colors.white,
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  appBarTheme: const AppBarTheme(
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    backgroundColor: Colors.black,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  scaffoldBackgroundColor: Colors.black,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateColor.resolveWith(
        (states) => const Color.fromARGB(255, 11, 29, 81),
      ),
    ),
  ),
  textTheme: const TextTheme(
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
    displaySmall: TextStyle(
        fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
  ),
);

final themeLight = ThemeData.light().copyWith(
  primaryColor: Colors.grey[400],
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.white,
    primary: const Color.fromARGB(255, 11, 29, 81),
    secondary: Colors.deepOrange,
    tertiary: Colors.white,
    onTertiary: Colors.grey,
    brightness: Brightness.light,
  ),
  cardTheme: CardThemeData(
    color: const Color.fromARGB(255, 26, 33, 48),
  ),
  dropdownMenuTheme: DropdownMenuThemeData(
    textStyle: TextStyle(color: Colors.black)),
  dividerTheme: DividerThemeData(color: Colors.white),
  iconTheme: const IconThemeData(color: Colors.black),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(color: const Color.fromARGB(255, 0, 0, 0)),
    unselectedItemColor: const Color.fromARGB(255, 131, 180, 255),
    selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
  ),
  scaffoldBackgroundColor: Colors.white,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateColor.resolveWith(
        (states) => const Color.fromARGB(255, 11, 29, 81),
      ),
    ),
  ),
  textTheme: const TextTheme(
    labelLarge: TextStyle(
        fontSize: 32, color: Colors.black, fontWeight: FontWeight.bold),
    labelMedium: TextStyle(
        fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
    labelSmall: TextStyle(
        fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
    headlineLarge: TextStyle(
        fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(
        fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
    headlineSmall: TextStyle(
        fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
    displaySmall: TextStyle(
        fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
  ),
);

extension ThemePlatformExtension on ThemeData {
  bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;
  bool get isCupertino => [TargetPlatform.iOS, TargetPlatform.macOS]
      .contains(defaultTargetPlatform);
  Color get cupertinoAlertColor => const Color(0xFFF82B10);
  Color get cupertinoActionColor => const Color(0xFF3478F7);
}
