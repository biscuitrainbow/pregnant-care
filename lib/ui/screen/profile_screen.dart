import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pregnantcare/ui/common/bordered_container.dart';
import 'package:pregnantcare/ui/common/button.dart';
import 'package:pregnantcare/ui/common/custom_app_bar.dart';
import 'package:pregnantcare/ui/style/text_styles.dart';
import 'package:pregnantcare/data/model/user.dart';

import 'forget_password_screen.dart';

class ProfileScreen extends StatefulWidget {
  final User user;

  const ProfileScreen({Key key, this.user}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _nameController;
  TextEditingController _ageController;
  TextEditingController _pregnantAgeMonthController;
  TextEditingController _pregnantAgeDayController;
  TextEditingController _emailController;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    _emailController = TextEditingController(text: widget.user.email);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'โปรไฟล์ของฉัน'),
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
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/mom/mom-009.png',
                      width: 150,
                    )
                  ],
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(hintText: 'ชื่อ - สกุล', hintStyle: TextStyles.inputHint, labelText: 'ชื่อ - สกุล', labelStyle: TextStyle(color: Colors.black)),
                  style: TextStyles.inputHint,
                ),
                SizedBox(height: 24),
                TextFormField(
                  decoration: InputDecoration(hintText: 'อายุ', hintStyle: TextStyles.inputHint, labelText: 'อายุ', labelStyle: TextStyle(color: Colors.black)),
                  style: TextStyles.inputHint,
                ),
                SizedBox(height: 24),

                Text('อายุครรภ์'),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(hintText: 'สัปดาห์', hintStyle: TextStyles.inputHint),
                        style: TextStyles.inputHint,
                      ),
                    ),
                    SizedBox(width: 32),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(hintText: 'วัน', hintStyle: TextStyles.inputHint),
                        style: TextStyles.inputHint,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),

                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(hintText: 'อีเมลล์', hintStyle: TextStyles.inputHint),
                  style: TextStyles.inputHint,
                ),
                SizedBox(height: 24),
                Button(
                  label: 'ออกจากระบบ',
                  color: Colors.grey.shade500,
                  textStyle: TextStyles.labelWhite,
                  onPressed: _signOut,
                ),
                // TextFormField(
                //   controller: _passwordController,
                //   decoration: InputDecoration(hintText: 'รหัสผ่าน', hintStyle: TextStyles.inputHint),
                //   style: TextStyles.inputHint,
                //   obscureText: true,
                // ),
                // SizedBox(height: 24),
                // Button(
                //   label: 'เข้าสู่ระบบ',
                //   color: Color.fromRGBO(153, 204, 204, 1),
                //   textStyle: TextStyles.labelWhite,
                //   onPressed: _signIn,
                // ),
                // SizedBox(height: 36),
                // Button(
                //   label: 'เข้าสู่ระบบด้วย Facebook',
                //   color: Color.fromRGBO(46, 117, 182, 1),
                //   textStyle: TextStyles.labelWhite,
                //   onPressed: _signInWithFacebook,
                // ),
                // SizedBox(height: 24),
                // Button(
                //   label: 'เข้าสู่ระบบด้วย Google',
                //   color: Color.fromRGBO(237, 125, 49, 1),
                //   textStyle: TextStyles.labelWhite,
                //   onPressed: _signInWithGoogle,
                // ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Button(
                        label: 'บันทึก',
                        color: Color.fromRGBO(99, 173, 177, 1),
                        textStyle: TextStyles.labelWhite,
                        onPressed: _signOut,
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Button(
                        label: 'แก้ไข',
                        color: Color.fromRGBO(255, 151, 203, 1),
                        textStyle: TextStyles.labelWhite,
                        onPressed: _signOut,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32),
              ],
            ),
          ],
        ),
      ),
    );
    ;
  }

  void _signOut() {
    _auth.signOut();
  }
}
