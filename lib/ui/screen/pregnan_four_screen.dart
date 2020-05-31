import 'package:flutter/material.dart';
import 'package:pregnantcare/ui/common/app_bottom_navigation_bar.dart';
import 'package:pregnantcare/ui/common/bordered_container.dart';
import 'package:pregnantcare/ui/common/button.dart';
import 'package:pregnantcare/ui/common/custom_app_bar.dart';
import 'package:pregnantcare/ui/common/drawer_container.dart';
import 'package:pregnantcare/ui/style/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class PregnantFourScreen extends StatefulWidget {
  @override
  _PregnantFourScreenState createState() => _PregnantFourScreenState();
}

class _PregnantFourScreenState extends State<PregnantFourScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'ติดต่อพยาบาล'),
      drawer: AppDrawer(),
      backgroundColor: Color.fromRGBO(135, 202, 204, 1),
      bottomNavigationBar: AppBottomNavigatioBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg-primary.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 24),
        child: Stack(
          overflow: Overflow.visible,
          children: [
            BorderedContainer(
              children: [
                SizedBox(height: 48),
                Image.asset('assets/images/contents/content-004-001.PNG'),
                Button(
                  label: 'คลิกที่นี่เพื่อติดต่อพยาบาล',
                  color: Color.fromRGBO(255, 217, 80, 1),
                  textStyle: TextStyles.labelBrown.copyWith(fontSize: 14),
                  onPressed: () => launch('https://line.me/R/ti/p/%40387gerkd'),
                ),
                SizedBox(height: 32),
                Image.asset('assets/images/contents/content-004-002.PNG'),
                SizedBox(height: 72),
              ],
            ),
            Positioned(
              right: -40,
              bottom: -25,
              child: Image.asset(
                'assets/images/mom/mom-008.png',
                height: 160,
              ),
            )
          ],
        ),
      ),
    );
  }
}
