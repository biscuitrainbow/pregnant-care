import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pregnantcare/ui/common/bordered_container.dart';
import 'package:pregnantcare/ui/common/button.dart';
import 'package:pregnantcare/ui/common/custom_app_bar.dart';
import 'package:pregnantcare/ui/style/text_styles.dart';
import 'package:pregnantcare/data/model/user.dart';
import 'package:firebase_database/firebase_database.dart';

import 'forget_password_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

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

  bool _loadingVisible = false;

  @override
  void initState() {
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _ageController = TextEditingController();
    _pregnantAgeMonthController = TextEditingController();
    _pregnantAgeDayController = TextEditingController();

    _fetchUser();
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
                if (_loadingVisible)
                  Column(
                    children: [
                      Center(child: CircularProgressIndicator()),
                    ],
                  )
                else
                  Column(children: [
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
                      controller: _nameController,
                      decoration: InputDecoration(hintText: 'ชื่อ - สกุล', hintStyle: TextStyles.inputHint, labelText: 'ชื่อ - สกุล', labelStyle: TextStyle(color: Colors.black)),
                      style: TextStyles.inputHint,
                    ),
                    SizedBox(height: 24),
                    TextFormField(
                      controller: _ageController,
                      decoration: InputDecoration(hintText: 'อายุ', hintStyle: TextStyles.inputHint, labelText: 'อายุ', labelStyle: TextStyle(color: Colors.black)),
                      style: TextStyles.inputHint,
                    ),
                    SizedBox(height: 24),
                    Text('อายุครรภ์'),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            controller: _pregnantAgeMonthController,
                            decoration: InputDecoration(hintText: 'สัปดาห์', hintStyle: TextStyles.inputHint),
                            style: TextStyles.inputHint,
                          ),
                        ),
                        SizedBox(width: 32),
                        Expanded(
                          child: TextFormField(
                            controller: _pregnantAgeDayController,
                            decoration: InputDecoration(hintText: 'วัน', hintStyle: TextStyles.inputHint),
                            style: TextStyles.inputHint,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    TextFormField(
                      enabled: false,
                      controller: _emailController,
                      decoration: InputDecoration(hintText: 'อีเมล', hintStyle: TextStyles.inputHint),
                      style: TextStyles.inputHint,
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Button(
                            label: 'บันทึก',
                            color: Color.fromRGBO(99, 173, 177, 1),
                            textStyle: TextStyles.labelWhite,
                            onPressed: _updateUser,
                          ),
                        ),
                        SizedBox(width: 8),
                        // Expanded(
                        //   child: Button(
                        //     label: 'แก้ไข',
                        //     color: Color.fromRGBO(255, 151, 203, 1),
                        //     textStyle: TextStyles.labelWhite,
                        //     onPressed: _signOut,
                        //   ),
                        // ),
                      ],
                    ),
                    Button(
                      label: 'ออกจากระบบ',
                      color: Colors.grey.shade500,
                      textStyle: TextStyles.labelWhite,
                      onPressed: _signOut,
                    ),
                    SizedBox(height: 12),
                  ]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _fetchUser() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser();
    final uid = firebaseUser.uid;

    FirebaseDatabase.instance.reference().child('users/$uid').onValue.listen((event) {
      final user = event.snapshot.value;

      setState(() {
        _emailController = TextEditingController(text: user['email']);
        _nameController = TextEditingController(text: user['name']);
        _ageController = TextEditingController(text: user['age']);
        _pregnantAgeMonthController = TextEditingController(text: user['pregnantAgeWeek']);
        _pregnantAgeDayController = TextEditingController(text: user['pregnantAgeDay']);
      });
    });
  }

  void _updateUser() async {
    _showLoading();

    try {
      final firebaseUser = await FirebaseAuth.instance.currentUser();
      final uid = firebaseUser.uid;
      FirebaseDatabase.instance.reference().child('users/$uid').update({
        'name': _nameController.text,
        'age': _ageController.text,
        'pregnantAgeWeek': _pregnantAgeMonthController.text,
        'pregnantAgeDay': _pregnantAgeDayController.text,
      });

      _hideLoading();
    } catch (e) {
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

  void _signOut() {
    _auth.signOut();
  }
}
