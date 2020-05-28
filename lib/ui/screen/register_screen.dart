import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pregnantcare/ui/common/bordered_container.dart';
import 'package:pregnantcare/ui/common/button.dart';
import 'package:pregnantcare/ui/common/custom_app_bar.dart';
import 'package:pregnantcare/ui/style/text_styles.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _loadingVisible = false;

  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _confirmPasswordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _passwordController = TextEditingController();

    super.initState();
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
                  Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(hintText: 'อีเมลล์', hintStyle: TextStyles.inputHint),
                        style: TextStyles.inputHint,
                      ),
                      SizedBox(height: 24),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(hintText: 'รหัสผ่าน', hintStyle: TextStyles.inputHint),
                        style: TextStyles.inputHint,
                        obscureText: true,
                      ),
                      SizedBox(height: 24),
                      TextFormField(
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(hintText: 'ยืนยันรหัสผ่าน', hintStyle: TextStyles.inputHint),
                        style: TextStyles.inputHint,
                        obscureText: true,
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
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _register() async {
    _showLoading();

    try {
      final email = _emailController.text;
      final password = _passwordController.text;

      final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      final uid = result.user.uid;

      await FirebaseDatabase.instance.reference().child('users/$uid').set({
        'name': '',
        'email': email,
        'age': '',
        'pregnantAgeWeek': '',
        'pregnantAgeDay': '',
      });

      _hideLoading();

      Navigator.of(context).pop();
    } catch (e) {
      print(e);
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
