import 'package:circket_live_score/screens/Splash_Screen.dart';
import 'package:circket_live_score/screens/matchdetial.dart';
import 'package:flutter/material.dart';
import 'package:circket_live_score/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/home': (context) => Home(),
      },
    );
  }
}
