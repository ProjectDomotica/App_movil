import 'package:app_front_dark_solution/src/app.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHOme') ?? false;
  runApp(MyApp(
    showHome: showHome,
  ));
}
