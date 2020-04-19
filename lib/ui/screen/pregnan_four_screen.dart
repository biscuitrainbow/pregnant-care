import 'package:flutter/material.dart';
import 'package:pregnantcare/ui/common/app_bottom_navigation_bar.dart';
import 'package:pregnantcare/ui/common/bordered_container.dart';
import 'package:pregnantcare/ui/common/button.dart';
import 'package:pregnantcare/ui/common/custom_app_bar.dart';
import 'package:pregnantcare/ui/common/drawer_container.dart';
import 'package:pregnantcare/ui/common/floating_action_button.dart';
import 'package:pregnantcare/ui/style/text_styles.dart';

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
                Image.asset('assets/images/contents/content-004.png'),
                SizedBox(height: 32),
                Button(
                  label: 'คลิกที่นี่เพื่อติดต่อพยาบาล',
                  color: Color.fromRGBO(255, 217, 80, 1),
                  textStyle: TextStyles.labelBrown,
                  onPressed: () => print('dasd'),
                  // onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => PregnantFourScreen())),
                ),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.info_outline,
                      size: 32,
                      color: Colors.red,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'กรณีเหตุฉุกเฉิน โทร. 1669',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.red,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Positioned(
              right: -40,
              bottom: -25,
              child: Image.asset(
                'assets/images/mom/mom-008.png',
                height: 220,
              ),
            )
          ],
        ),
      ),
    );
  }
}
