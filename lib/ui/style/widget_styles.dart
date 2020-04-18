import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pregnantcare/ui/common/button.dart';
import 'package:pregnantcare/ui/screen/pregnan_four_screen.dart';
import 'package:pregnantcare/ui/screen/pregnant_one_screen.dart';
import 'package:pregnantcare/ui/screen/pregnant_three_screen.dart';
import 'package:pregnantcare/ui/screen/pregnant_two_screen.dart';
import 'package:pregnantcare/ui/style/text_styles.dart';

class WidgetStyles {
  static buildAppBar(BuildContext context, String title) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: Color.fromRGBO(102, 51, 0, 1),
          fontSize: 32,
        ),
      ),
      automaticallyImplyLeading: false,
      leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop()),
      elevation: 0,
      backgroundColor: Color.fromRGBO(255, 255, 153, 1),
      iconTheme: Theme.of(context)
          .iconTheme
          .copyWith(color: Color.fromRGBO(102, 51, 0, 1)),
    );
  }

  static buildHomeMenuButtons(BuildContext context, [bool drawerMode = false]) {
    return [
      // GestureDetector(
      //   child: Image.asset('assets/images/buttons/btn-001.png'),
      //   onTap: () => navigate(PregnantOneScreen(), context, drawerMode),
      // ),
      Button(
        label: 'การคลอดบุตร\nไม่ใช่เรื่องน่ากลัว',
        image: 'assets/images/mom/mom-001.png',
        color: Color.fromRGBO(166, 204, 200, 1),
        textStyle: TextStyles.labelBrown,
        onPressed: () => navigate(PregnantOneScreen(), context, drawerMode),
      ),
      SizedBox(height: 32),
      Button(
        label: 'ธรรมชาติ\nการคลอดบุตร',
        image: 'assets/images/mom/mom-004.png',
        imageHeight: 100,
        left: -25,
        color: Color.fromRGBO(235, 152, 157, 1),
        textStyle: TextStyles.labelBrown,
        onPressed: () => navigate(PregnantTwoScreen(), context, drawerMode),
      ),
      SizedBox(height: 32),
      Button(
        label: 'เทคนิคการผ่อนคลาย',
        image: 'assets/images/mom/mom-002.png',
        imageHeight: 75,
        top: -20,
        left: -15,
        color: Color.fromRGBO(146, 208, 80, 1),
        textStyle: TextStyles.labelBrown,
        onPressed: () => navigate(PregnantThreeScreen(), context, drawerMode),
      ),
      SizedBox(height: 32),
      Button(
        label: 'ติดต่อพยาบาล',
        image: 'assets/images/mom/mom-003.png',
        imageHeight: 80,
        top: -20,
        left: -15,
        color: Color.fromRGBO(255, 217, 80, 1),
        textStyle: TextStyles.labelBrown,
        onPressed: () => navigate(PregnantFourScreen(), context, drawerMode),
      ),
    ];
  }

  static navigate(Widget screen, BuildContext context, [bool drawerMode]) {
    if (drawerMode) {
      Navigator.of(context).pop();
    }

    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
  }
}
