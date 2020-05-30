import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pregnantcare/ui/common/bordered_container.dart';
import 'package:pregnantcare/ui/common/button.dart';
import 'package:pregnantcare/ui/common/custom_app_bar.dart';
import 'package:pregnantcare/ui/style/text_styles.dart';
import 'package:pregnantcare/data/model/user.dart';
import 'package:pregnantcare/ui/common/toast_message.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _confirmPasswordController;

  FirebaseAuth _auth;
  FirebaseDatabase _database;
  DatabaseReference _userRef;

  bool _loadingVisible;

  @override
  void initState() {
    _emailController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _passwordController = TextEditingController();

    _auth = FirebaseAuth.instance;

    _database = FirebaseDatabase.instance;
    _userRef = _database.reference().child('users');

    _loadingVisible = false;

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _confirmPasswordController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'สร้างบัญชี'),
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
                      children: [
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(hintText: 'อีเมลล์', hintStyle: TextStyles.inputHint),
                          style: TextStyles.inputHint,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value.isEmpty) return "กรุณากรอกอีเมลล์";
                          },
                        ),
                        SizedBox(height: 24),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(hintText: 'รหัสผ่าน', hintStyle: TextStyles.inputHint),
                          style: TextStyles.inputHint,
                          obscureText: true,
                          validator: (value) {
                            if (value.isEmpty) return "กรุณากรอกรหัสผ่าน";
                          },
                        ),
                        SizedBox(height: 24),
                        TextFormField(
                          controller: _confirmPasswordController,
                          decoration: InputDecoration(hintText: 'ยืนยันรหัสผ่าน', hintStyle: TextStyles.inputHint),
                          style: TextStyles.inputHint,
                          obscureText: true,
                          validator: (value) {
                            if (value.isEmpty) return "กรุณากรอกยืนยันรหัสผ่าน";

                            if (value != _passwordController.text) return "กรุณากรอกรหัสผ่าน 2 ครั้งให้ตรงกัน";
                          },
                        ),
                        SizedBox(height: 24),
                        Button(
                          label: 'ลงทะเบียน',
                          color: Color.fromRGBO(153, 204, 204, 1),
                          textStyle: TextStyles.labelWhite,
                          onPressed: _register,
                        ),
                        SizedBox(height: 36),
                      ],
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _register() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    try {
      _showLoading();

      final email = _emailController.text;
      final password = _passwordController.text;

      final createdUser = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _userRef.child('${createdUser.user.uid}').set({
        User.keyName: '',
        User.keyEmail: createdUser.user.email,
        User.keyDateOfBirth: '',
        User.keyPregnantAgeDay: '',
        User.keyPregnantAgeWeek: '',
      });

      _hideLoading();

      ToastMessage.showMessage('ลงทะเบียนแล้ว');
      Navigator.of(context).pop();
    } catch (e) {
      ToastMessage.showMessage('ลงทะเบียนไม่สำเร็จ');
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
