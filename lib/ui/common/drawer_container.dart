import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pregnantcare/ui/common/toast_message.dart';
import 'package:pregnantcare/ui/style/widget_styles.dart';

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
              SizedBox(height: 16),
              GestureDetector(
                child: Image.asset('assets/images/buttons/btn-main-007.png', height: 48),
                onTap: _signOut,
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
