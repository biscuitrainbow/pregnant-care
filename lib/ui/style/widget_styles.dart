import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pregnantcare/ui/screen/poeple_screen.dart';
import 'package:pregnantcare/ui/screen/pregnan_four_screen.dart';
import 'package:pregnantcare/ui/screen/pregnant_one_screen.dart';
import 'package:pregnantcare/ui/screen/pregnant_three_screen.dart';
import 'package:pregnantcare/ui/screen/pregnant_two_screen.dart';

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
        child: Image.asset('assets/images/buttons/btn-main-001.png', height: 48),
        onTap: () => navigate(PregnantOneScreen(), context, false),
      ),
      SizedBox(height: 16),
      GestureDetector(
        child: Image.asset('assets/images/buttons/btn-main-002.png', height: 48),
        onTap: () => navigate(PregnantTwoScreen(), context, false),
      ),
      SizedBox(height: 16),
      GestureDetector(
        child: Image.asset('assets/images/buttons/btn-main-003.png', height: 48),
        onTap: () => navigate(PregnantThreeScreen(), context, false),
      ),
      SizedBox(height: 16),
      GestureDetector(
        child: Image.asset('assets/images/buttons/btn-main-004.png', height: 48),
        onTap: () => navigate(PregnantFourScreen(), context, false),
      ),
      SizedBox(height: 16),
      GestureDetector(
        child: Image.asset('assets/images/buttons/btn-main-005.png', height: 48),
        onTap: () => navigate(PeopleScreen(), context, false),
      ),
      SizedBox(height: 16),
      GestureDetector(
        child: Image.asset('assets/images/buttons/btn-main-006.png', height: 48),
        onTap: () => navigate(PregnantFourScreen(), context, false),
      ),
      SizedBox(height: 16),
      GestureDetector(
        child: Image.asset('assets/images/buttons/btn-main-007.png', height: 48),
        onTap: () => navigate(PregnantFourScreen(), context, false),
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
