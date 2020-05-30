import 'package:flutter/material.dart';
import 'package:pregnantcare/ui/common/bordered_container.dart';
import 'package:pregnantcare/ui/common/button.dart';
import 'package:pregnantcare/ui/screen/home_screen.dart';
import 'package:pregnantcare/ui/style/text_styles.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController = new AnimationController(duration: Duration(seconds: 3), vsync: this)
      ..forward()
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
        }
      });
      

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(135, 202, 204, 1),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg-primary.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 48,
        ),
        child: BorderedContainer(
          children: [
            Container(
              constraints: BoxConstraints(maxHeight: 250),
              child: Image.asset(
                'assets/images/text-logo.png',
              ),
            ),
            SizedBox(height: 16),
            Container(
              constraints: BoxConstraints(maxHeight: 450),
              child: Image.asset(
                'assets/images/family.png',
              ),
            ),
            SizedBox(height: 32),
            LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(135, 202, 204, 1)),
              backgroundColor: Color.fromRGBO(135, 202, 204, .3),
            ),
          ],
        ),
      ),
    );
  }
}
