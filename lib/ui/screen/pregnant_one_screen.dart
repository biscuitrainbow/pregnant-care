import 'package:flutter/material.dart';
import 'package:pregnantcare/ui/common/app_bottom_navigation_bar.dart';
import 'package:pregnantcare/ui/common/bordered_container.dart';
import 'package:pregnantcare/ui/common/button.dart';
import 'package:pregnantcare/ui/common/custom_app_bar.dart';
import 'package:pregnantcare/ui/common/drawer_container.dart';
import 'package:pregnantcare/ui/common/floating_action_button.dart';
import 'package:pregnantcare/ui/screen/pregnant_one_one_screen.dart';
import 'package:pregnantcare/ui/style/text_styles.dart';

class PregnantOneScreen extends StatefulWidget {
  @override
  _PregnantOneScreenState createState() => _PregnantOneScreenState();
}

class _PregnantOneScreenState extends State<PregnantOneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'การคลอดบุตรไม่ใช่เรื่องน่ากลัว',
        automaticallyImplyLeading: false,
      ),
      drawer: AppDrawer(),
      bottomNavigationBar: AppBottomNavigatioBar(),
      backgroundColor: Color.fromRGBO(135, 202, 204, 1),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg-primary.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 24),
        child: Stack(
          alignment: Alignment.topLeft,
          overflow: Overflow.visible,
          children: [
            BorderedContainer(
              children: [
                GestureDetector(
                  child: Image.asset('assets/images/buttons/btn-001-001.png'),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => PregnantOneOneScreen())),
                ),
                SizedBox(height: 16),
                GestureDetector(
                  child: Image.asset('assets/images/buttons/btn-001-002.png'),
                ),
                SizedBox(height: 16),
                GestureDetector(
                  child: Image.asset('assets/images/buttons/btn-001-003.png'),
                ),
                SizedBox(height: 16),
                GestureDetector(
                  child: Image.asset('assets/images/buttons/btn-001-004.png'),
                ),
              ],
            ),
            Positioned(
              right: -15,
              bottom: 0,
              child: Image.asset(
                'assets/images/mom/mom-005.png',
                width: 125,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
