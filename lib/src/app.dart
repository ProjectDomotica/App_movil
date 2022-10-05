import 'package:app_front_dark_solution/src/View/Screen/Home.dart';
import 'package:app_front_dark_solution/src/provider/datos_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          '/home': (context) => const Home(),
        },
      ),
    );
  }
}
