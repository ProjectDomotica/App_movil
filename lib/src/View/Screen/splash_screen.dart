// ignore_for_file: camel_case_types

// import 'package:app_front_dark_solution/src/View/Screen/Home.dart';
import 'package:app_front_dark_solution/src/View/Screen/Home.dart';
import 'package:app_front_dark_solution/src/View/intro_ScreenS/intro_screens_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash_Screen extends StatefulWidget {
  // final bool showHome;
  const Splash_Screen({
    Key? key,
    // required this.showHome,
  }) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 4)).then(
      (value) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const OnBordingScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage('assets/image/logo.png'),
              // width: 700,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Dark Solution',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  // fontFamily: FontStyle.italic,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 90,
            ),
            SpinKitCubeGrid(
              color: Colors.white,
              size: 60,
            )
          ],
        ),
      ),
    );
  }
}
