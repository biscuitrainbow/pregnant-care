import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pregnantcare/ui/common/bordered_container.dart';
import 'package:pregnantcare/ui/common/button.dart';
import 'package:pregnantcare/ui/common/custom_app_bar.dart';
import 'package:pregnantcare/ui/style/text_styles.dart';

class ForgetPasswordScreen extends StatefulWidget {
  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'เข้าสู่ระบบ'),
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
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(hintText: 'อีเมลล์', hintStyle: TextStyles.inputHint),
                  style: TextStyles.inputHint,
                ),
                SizedBox(height: 24),
                Button(
                  label: 'ตั้งรหัสผ่านใหม่',
                  color: Color.fromRGBO(153, 204, 204, 1),
                  textStyle: TextStyles.labelWhite,
                  onPressed: _resetPassword,
                ),
                SizedBox(height: 36),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _resetPassword() {
    _auth.sendPasswordResetEmail(email: _emailController.text);
  }
}
