import 'package:flutter/material.dart';
import 'package:pregnantcare/ui/common/app_bottom_navigation_bar.dart';
import 'package:pregnantcare/ui/common/bordered_container.dart';
import 'package:pregnantcare/ui/common/custom_app_bar.dart';
import 'package:pregnantcare/ui/common/drawer_container.dart';
import 'package:pregnantcare/ui/screen/video_list_screen.dart';

class PregnantThreeScreen extends StatefulWidget {
  @override
  _PregnantThreeScreenState createState() => _PregnantThreeScreenState();
}

class _PregnantThreeScreenState extends State<PregnantThreeScreen> {
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
              fit: BoxFit.cover),
        ),
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 24),
        child: Stack(
          overflow: Overflow.visible,
          children: [
            BorderedContainer(
              children: [
                SizedBox(height: 16),
                GestureDetector(
                  child: Image.asset('assets/images/buttons/btn-003-001.png'),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => VideoListScreen()),
                  ),
                ),
                SizedBox(height: 16),
                GestureDetector(
                  child: Image.asset('assets/images/buttons/btn-003-002.png'),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 220,
                  child: Image.asset(
                    'assets/images/mom/mom-007.png',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
