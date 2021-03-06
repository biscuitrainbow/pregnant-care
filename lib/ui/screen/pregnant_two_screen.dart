import 'package:flutter/material.dart';
import 'package:pregnantcare/ui/common/app_bottom_navigation_bar.dart';
import 'package:pregnantcare/ui/common/bordered_container.dart';
import 'package:pregnantcare/ui/common/custom_app_bar.dart';
import 'package:pregnantcare/ui/common/drawer_container.dart';
import 'package:pregnantcare/ui/screen/pregnant_two_one_screen.dart';
import 'package:pregnantcare/ui/screen/pregnant_two_two_screen.dart';
import 'package:pregnantcare/ui/screen/pregnant_two_three_screen.dart';
import 'package:pregnantcare/ui/screen/pregnant_two_four_screen.dart';
import 'package:pregnantcare/ui/screen/pregnant_two_five_screen.dart';

class PregnantTwoScreen extends StatefulWidget {
  @override
  _PregnantTwoScreenState createState() => _PregnantTwoScreenState();
}

class _PregnantTwoScreenState extends State<PregnantTwoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'ธรรมชาติการคลอดบุตร'),
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
          overflow: Overflow.visible,
          children: [
            BorderedContainer(
              children: [
                SizedBox(
                  height: 220,
                  child: Image.asset(
                    'assets/images/mom/mom-006.png',
                  ),
                ),
                GestureDetector(
                  child: Image.asset('assets/images/buttons/btn-002-001.png'),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => PregnantTwoOneScreen()),
                  ),
                ),
                SizedBox(height: 16),
                GestureDetector(
                  child: Image.asset('assets/images/buttons/btn-002-002.png'),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => PregnantTwoTwoScreen()),
                  ),
                ),
                SizedBox(height: 16),
                GestureDetector(
                  child: Image.asset('assets/images/buttons/btn-002-003.png'),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => PregnantTwoThreeScreen()),
                  ),
                ),
                SizedBox(height: 16),
                GestureDetector(
                  child: Image.asset('assets/images/buttons/btn-002-004.png'),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => PregnantTwoFourScreen()),
                  ),
                ),
                SizedBox(height: 16),
                GestureDetector(
                  child: Image.asset('assets/images/buttons/btn-002-005.png'),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => PregnantTwoFiveScreen()),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
