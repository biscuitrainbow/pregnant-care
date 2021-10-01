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
                Color.fromRGBO(197, 228, 229, 1),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
              SizedBox(height: 24),
              ...WidgetStyles.buildHomeMenuButtons(context, true),
              Center(
                child: Image.asset(
                  'assets/images/baby-bottom.jpg',
                  width: 90,
                ),
              )
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
