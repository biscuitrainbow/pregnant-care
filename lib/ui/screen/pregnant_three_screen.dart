import 'package:flutter/material.dart';
import 'package:pregnantcare/ui/common/bordered_container.dart';
import 'package:pregnantcare/ui/common/button.dart';
import 'package:pregnantcare/ui/common/custom_app_bar.dart';
import 'package:pregnantcare/ui/common/drawer_container.dart';
import 'package:pregnantcare/ui/common/floating_action_button.dart';
import 'package:pregnantcare/ui/screen/video_list_screen.dart';
import 'package:pregnantcare/ui/style/text_styles.dart';
import 'package:pregnantcare/ui/style/widget_styles.dart';

class PregnantThreeScreen extends StatefulWidget {
  @override
  _PregnantThreeScreenState createState() => _PregnantThreeScreenState();
}

class _PregnantThreeScreenState extends State<PregnantThreeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'ธรรมชาติการคลอดบุตร'),
      floatingActionButton: Builder(builder: (context) => DrawerFloatingActionButton(onPressed: () => Scaffold.of(context).openDrawer())),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      drawer: AppDrawer(),
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
                Button(
                  label: 'สมาธิเบื้องต้น',
                  color: Color.fromRGBO(146, 208, 80, 1),
                  textStyle: TextStyles.labelBrown,
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => VideoListScreen())),
                ),
                SizedBox(height: 32),
                Button(
                  label: 'สมาธิผสมผสาน\nดนตรีผ่อนคลาย',
                  color: Color.fromRGBO(146, 208, 80, 1),
                  textStyle: TextStyles.labelBrown,
                  onPressed: () => print('tap'),
                ),
                SizedBox(height: 32),
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
