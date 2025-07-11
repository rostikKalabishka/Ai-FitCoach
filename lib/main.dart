import 'package:ai_fit_coach/app/ai_fit_coach_app.dart';
import 'package:ai_fit_coach/config/firebase_options.dart';
import 'package:ai_fit_coach/common/di/di.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final prefs = await _initPrefs();

  initDI(sharedPreferences: prefs);

  runApp(const AiFitCoachApp());
}

Future<SharedPreferences> _initPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs;
}
