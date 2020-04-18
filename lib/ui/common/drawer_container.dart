import 'package:flutter/material.dart';
import 'package:pregnantcare/ui/screen/pregnant_one_screen.dart';
import 'package:pregnantcare/ui/screen/register_screen.dart';
import 'package:pregnantcare/ui/style/text_styles.dart';
import 'package:pregnantcare/ui/style/widget_styles.dart';

import 'button.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(255, 255, 153, 1),
              Color.fromRGBO(183, 220, 219, 1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.1,
              0.6,
            ],
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 38),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
            SizedBox(height: 24),
            ...WidgetStyles.buildHomeMenuButtons(context, true),
            SizedBox(height: 64),
            Button(
              label: 'เข้าสู่ระบบ',
              color: Color.fromRGBO(153, 204, 204, 1),
              textStyle: TextStyles.labelWhite,
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => RegisterScreen())),
            ),
          ],
        ),
      ),
    );
  }
}
