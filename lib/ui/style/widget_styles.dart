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
      leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.of(context).pop()),
      elevation: 0,
      backgroundColor: Color.fromRGBO(255, 255, 153, 1),
      iconTheme: Theme.of(context).iconTheme.copyWith(color: Color.fromRGBO(102, 51, 0, 1)),
    );
  }

  static buildHomeMenuButtons(BuildContext context, [bool drawerMode = false]) {
    return [
      GestureDetector(
        child: Image.asset('assets/images/buttons/btn-drawer-001.png'),
        onTap: () => navigate(PregnantOneScreen(), context, drawerMode),
      ),
      SizedBox(height: 24),
      GestureDetector(
        child: Image.asset('assets/images/buttons/btn-drawer-002.png'),
        onTap: () => navigate(PregnantTwoScreen(), context, drawerMode),
      ),
      SizedBox(height: 24),
      GestureDetector(
        child: Image.asset('assets/images/buttons/btn-drawer-003.png'),
        onTap: () => navigate(PregnantThreeScreen(), context, drawerMode),
      ),
      SizedBox(height: 24),
      GestureDetector(
        child: Image.asset('assets/images/buttons/btn-drawer-004.png'),
        onTap: () => navigate(PregnantFourScreen(), context, drawerMode),
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
