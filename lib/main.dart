import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pregnantcare/ui/screen/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'การคลอดบุตร ไม่น่ากลัว',
      theme: ThemeData(
        textTheme: GoogleFonts.sarabunTextTheme(),
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
