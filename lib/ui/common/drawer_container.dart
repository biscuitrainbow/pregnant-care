import 'package:flutter/material.dart';
import 'package:pregnantcare/ui/style/widget_styles.dart';
import 'package:pregnantcare/ui/style/text_styles.dart';
import 'package:pregnantcare/ui/common/button.dart';
import 'package:pregnantcare/ui/common/toast_message.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppDrawer extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(255, 185, 208, 1),
                Color.fromRGBO(182, 229, 230, 1),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0.1,
                0.6,
              ],
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12),
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
                label: 'ออกจากระบบ',
                color: Colors.white,
                textStyle: TextStyles.labelBrown.copyWith(color: Colors.black, fontSize: 12),
                onPressed: _signOut,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signOut() async {
    await _auth.signOut();
    ToastMessage.showMessage('ออกจากระบบแล้ว');
  }
}
