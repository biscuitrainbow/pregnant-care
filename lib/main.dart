import 'package:flutter/material.dart';
import 'package:pregnantcare/ui/screen/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Application',
      theme: ThemeData(
        fontFamily: 'Waffle',
        primarySwatch: Colors.blue,
      ),
    home: SplashScreen(),
    );
  }
}
