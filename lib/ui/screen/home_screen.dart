import 'package:flutter/material.dart';
import 'package:pregnantcare/ui/common/bordered_container.dart';
import 'package:pregnantcare/ui/common/custom_app_bar.dart';
import 'package:pregnantcare/ui/common/drawer_container.dart';
import 'package:pregnantcare/ui/screen/pregnan_four_screen.dart';
import 'package:pregnantcare/ui/screen/pregnant_one_screen.dart';
import 'package:pregnantcare/ui/screen/pregnant_three_screen.dart';
import 'package:pregnantcare/ui/screen/pregnant_two_screen.dart';
import 'package:pregnantcare/ui/style/widget_styles.dart';

import '../common/app_bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(135, 202, 204, 1),
      appBar: CustomAppBar(
        title: 'หน้าหลัก',
        leadingType: LeadingType.menu,
      ),
      drawer: AppDrawer(),
      bottomNavigationBar: AppBottomNavigatioBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg-primary.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 48),
        child: BorderedContainer(
          children: [
            GestureDetector(
              child: Image.asset('assets/images/buttons/btn-main-001.jpg'),
              onTap: () => navigate(PregnantOneScreen(), context, false),
            ),
            SizedBox(height: 16),
            GestureDetector(
              child: Image.asset('assets/images/buttons/btn-main-002.jpg'),
              onTap: () => navigate(PregnantTwoScreen(), context, false),
            ),
            SizedBox(height: 16),
            GestureDetector(
              child: Image.asset('assets/images/buttons/btn-main-003.jpg'),
              onTap: () => navigate(PregnantThreeScreen(), context, false),
            ),
            SizedBox(height: 16),
            GestureDetector(
              child: Image.asset('assets/images/buttons/btn-main-004.jpg'),
              onTap: () => navigate(PregnantFourScreen(), context, false),
            ),
          ],
        ),
      ),
    );
  }

  navigate(Widget screen, BuildContext context, [bool drawerMode]) {
    if (drawerMode) {
      Navigator.of(context).pop();
    }

    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
  }
}
