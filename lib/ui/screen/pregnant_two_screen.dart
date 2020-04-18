import 'package:flutter/material.dart';
import 'package:pregnantcare/ui/common/bordered_container.dart';
import 'package:pregnantcare/ui/common/button.dart';
import 'package:pregnantcare/ui/common/custom_app_bar.dart';
import 'package:pregnantcare/ui/common/drawer_container.dart';
import 'package:pregnantcare/ui/common/floating_action_button.dart';
import 'package:pregnantcare/ui/style/text_styles.dart';
import 'package:pregnantcare/ui/style/widget_styles.dart';

class PregnantTwoScreen extends StatefulWidget {
  @override
  _PregnantTwoScreenState createState() => _PregnantTwoScreenState();
}

class _PregnantTwoScreenState extends State<PregnantTwoScreen> {
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
                SizedBox(
                  height: 220,
                  child: Image.asset(
                    'assets/images/mom/mom-006.png',
                  ),
                ),
                Button(
                  label: 'การคลอดบุตร',
                  color: Color.fromRGBO(235, 152, 157, 1),
                  textStyle: TextStyles.labelBrown,
                  onPressed: () => print('tap'),
                ),
                SizedBox(height: 32),
                Button(
                  label: 'สัญญาณของการคลอด',
                  color: Color.fromRGBO(235, 152, 157, 1),
                  textStyle: TextStyles.labelBrown,
                  onPressed: () => print('tap'),
                ),
                SizedBox(height: 32),
                Button(
                  label: 'เจ็บครรภ์เตือน /\n เจ็บครรภ์จริง',
                  color: Color.fromRGBO(235, 152, 157, 1),
                  textStyle: TextStyles.labelBrown,
                  onPressed: () => print('tap'),
                ),
                SizedBox(height: 32),
                Button(
                  label: 'อาการผิดปกติที่ควรมาโรงพยาบาลทันที',
                  color: Color.fromRGBO(235, 152, 157, 1),
                  textStyle: TextStyles.labelBrown.copyWith(color: Color.fromRGBO(255, 255, 0, 1)),
                  onPressed: () => print('tap'),
                ),
                SizedBox(height: 32),
                Button(
                  label: 'การเตรียมความพร้อมเพื่อการคลอด',
                  color: Color.fromRGBO(235, 152, 157, 1),
                  textStyle: TextStyles.labelBrown,
                  onPressed: () => print('tap'),
                ),
                SizedBox(height: 32),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
