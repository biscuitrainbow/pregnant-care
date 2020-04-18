import 'package:flutter/material.dart';
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
      // floatingActionButton: Builder(builder: (context) => DrawerFloatingActionButton(onPressed: () => Scaffold.of(context).openDrawer())),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
          alignment: Alignment.topLeft,
          overflow: Overflow.visible,
          children: [
            BorderedContainer(
              children: [
                Button(
                  label: 'ความกลัวการคลอดบุตร\nคืออะไร',
                  color: Color.fromRGBO(166, 204, 200, 1),
                  textStyle: TextStyles.labelBrown,
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => PregnantOneOneScreen())),
                ),
                SizedBox(height: 32),
                Button(
                  label: 'ความกลัวการคลอดบุตร\nเกิดขึ้นได้อย่างไร',
                  color: Color.fromRGBO(166, 204, 200, 1),
                  textStyle: TextStyles.labelBrown,
                  onPressed: () => print('tap'),
                ),
                SizedBox(height: 32),
                Button(
                  label: 'ผลกระทบกับคุณแม่',
                  color: Color.fromRGBO(166, 204, 200, 1),
                  textStyle: TextStyles.labelBrown,
                  onPressed: () => print('tap'),
                ),
                SizedBox(height: 32),
                Button(
                  label: 'ผลกระทบกับลูกน้อย',
                  color: Color.fromRGBO(166, 204, 200, 1),
                  textStyle: TextStyles.labelBrown,
                  onPressed: () => print('tap'),
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
            Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(255, 255, 153, 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 1,
                  ),
                ],
              ),
              child: Icon(Icons.menu, color: Color.fromRGBO(102, 51, 0, 1)),
            ),
          ],
        ),
      ),
    );
  }
}
