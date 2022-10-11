// import 'package:app_front_dark_solution/src/View/Screen/Home.dart';
// import 'package:app_front_dark_solution/src/View/Screen/splash_screen.dart';
import 'package:app_front_dark_solution/src/View/Screen/Home.dart';
import 'package:app_front_dark_solution/src/View/Screen/splash_screen.dart';
import 'package:app_front_dark_solution/src/View/intro_ScreenS/intro_screens_library.dart';
import 'package:app_front_dark_solution/src/provider/datos_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatefulWidget {
  final bool showHome;
  const MyApp({
    Key? key,
    required this.showHome,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final prefs = await SharedPreferences.getInstance();
  // final showHome = prefs.getBool('showHOme');

  @override
  void initState() {
    super.initState();
    // _showHome;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DatosProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.light().copyWith(brightness: Brightness.dark),
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        routes: {
          '/home': (context) => Splash_Screen()
          //     showHome: _showHome,
          //   )
          // : OnBordingScreen(),
        },
      ),
    );
  }
}
