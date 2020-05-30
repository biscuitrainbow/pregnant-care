import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pregnantcare/ui/common/bordered_container.dart';
import 'package:pregnantcare/ui/common/button.dart';
import 'package:pregnantcare/ui/common/custom_app_bar.dart';
import 'package:pregnantcare/ui/style/text_styles.dart';
import 'package:pregnantcare/ui/common/toast_message.dart';

class ForgetPasswordScreen extends StatefulWidget {
  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  FirebaseAuth _auth;
  TextEditingController _emailController;

  bool _loadingVisible;

  @override
  void initState() {
    _auth = FirebaseAuth.instance;
    _emailController = TextEditingController();

    _loadingVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'ลืมรหัสผ่าน'),
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
                if (_loadingVisible)
                  Column(
                    children: [
                      Center(child: CircularProgressIndicator()),
                    ],
                  )
                else
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(hintText: 'อีเมลล์', hintStyle: TextStyles.inputHint),
                          style: TextStyles.inputHint,
                          validator: (value) {
                            if (value.isEmpty) return "กรุณากรอกอีเมลล์";
                          },
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
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _resetPassword() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    try {
      _showLoading();
      await _auth.sendPasswordResetEmail(email: _emailController.text);
      _hideLoading();

      ToastMessage.showMessage('ตรวจสอบอีเมลล์เพื่อทำการตั้งรหัสผ่านใหม่');
    } catch (e) {
      print(e);
      ToastMessage.showMessage('ตั้งรหัสผ่านใหม่ไม่สำเร็จ');
      _hideLoading();
    }
  }

  void _showLoading() {
    setState(() {
      _loadingVisible = true;
    });
  }

  void _hideLoading() {
    setState(() {
      _loadingVisible = false;
    });
  }
}
