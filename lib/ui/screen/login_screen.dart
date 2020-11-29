import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pregnantcare/ui/common/bordered_container.dart';
import 'package:pregnantcare/ui/common/button.dart';
import 'package:pregnantcare/ui/common/custom_app_bar.dart';
import 'package:pregnantcare/ui/screen/forget_password_screen.dart';
import 'package:pregnantcare/ui/style/text_styles.dart';
import 'package:pregnantcare/ui/screen/register_screen.dart';
import 'package:pregnantcare/util/date_time_util.dart';
import 'package:pregnantcare/data/model/user.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:firebase_database/firebase_database.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _loadingVisible = false;

  FirebaseAuth _auth;
  FirebaseDatabase _database;
  DatabaseReference _usageRef;
  DatabaseReference _userRef;

  @override
  void initState() {
    _auth = FirebaseAuth.instance;
    _database = FirebaseDatabase.instance;

    _usageRef = _database.reference().child('usages');
    _userRef = _database.reference().child('users');

    createUsage();
    super.initState();
  }

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
                        decoration: InputDecoration(
                            hintText: 'อีเมลล์',
                            hintStyle: TextStyles.inputHint),
                        style: TextStyles.inputHint,
                      ),
                      SizedBox(height: 24),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                            hintText: 'รหัสผ่าน',
                            hintStyle: TextStyles.inputHint),
                        style: TextStyles.inputHint,
                        obscureText: true,
                      ),
                      SizedBox(height: 24),
                      Button(
                        label: 'เข้าสู่ระบบ',
                        color: Color.fromRGBO(153, 204, 204, 1),
                        textStyle: TextStyles.labelWhite,
                        onPressed: _signIn,
                      ),
                      SizedBox(height: 36),
                      Button(
                        label: 'เข้าสู่ระบบด้วย Facebook',
                        color: Color.fromRGBO(46, 117, 182, 1),
                        textStyle: TextStyles.labelWhite,
                        onPressed: _signInWithFacebook,
                      ),
                      SizedBox(height: 24),
                      Button(
                        label: 'เข้าสู่ระบบด้วย Google',
                        color: Color.fromRGBO(237, 125, 49, 1),
                        textStyle: TextStyles.labelWhite,
                        onPressed: _signInWithGoogle,
                      ),
                      SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) => ForgetPasswordScreen())),
                            child: Text(
                              'ลืมรหัสผ่าน',
                              style: TextStyles.labelWhite.copyWith(
                                  color: Color.fromRGBO(171, 170, 170, 1)),
                            ),
                          ),
                          Text(
                            '/',
                            style: TextStyles.labelWhite.copyWith(
                                color: Color.fromRGBO(171, 170, 170, 1)),
                          ),
                          FlatButton(
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) => RegisterScreen())),
                            child: Text(
                              'สร้างบัญชี',
                              style: TextStyles.labelWhite
                                  .copyWith(color: Colors.green),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
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

  void _signInWithFacebook() async {
    final FacebookLogin facebookLogin = FacebookLogin();

    _showLoading();

    try {
      final result = await facebookLogin.logIn(['email', 'public_profile']);
      final graphResponse = await http.get(
          'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${result.accessToken.token}');
      final profile = jsonDecode(graphResponse.body);

      final credential = FacebookAuthProvider.getCredential(
          accessToken: result.accessToken.token);
      final user = await _auth.signInWithCredential(credential);

      if (user.additionalUserInfo.isNewUser) {
        FirebaseDatabase.instance
            .reference()
            .child('users/${user.user.uid}')
            .set({
          'name': profile['name'],
          'email': profile['email'],
          'age': '',
          'pregnantAgeWeek': '',
          'pregnantAgeDay': '',
        });
      }

      createUsage();

      _hideLoading();
    } catch (e) {
      _hideLoading();

      print(e);
    }
  }

  void _signInWithGoogle() async {
    _showLoading();

    final GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    try {
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final user = await _auth.signInWithCredential(credential);
      await user.user.updateEmail(googleSignIn.currentUser.email);

      if (user.additionalUserInfo.isNewUser) {
        FirebaseDatabase.instance
            .reference()
            .child('users/${user.user.uid}')
            .set({
          'name': user.user.displayName,
          'email': googleSignIn.currentUser.email,
          'age': '',
          'pregnantAgeWeek': '',
          'pregnantAgeDay': '',
        });
      }

      createUsage();

      _hideLoading();
    } catch (e) {
      print(e);
      _hideLoading();
    }
  }

  void _signIn() async {
    _showLoading();

    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      _hideLoading();

      createUsage();
      // Navigator.of(context).pop();
    } catch (e) {
      _hideLoading();

      print(e);
    }
  }

  void createUsage() async {
    final firebaseUser = await _auth.currentUser();

    if (firebaseUser != null) {
      _userRef.child('${firebaseUser.uid}').once().then((snapshot) {
        final user = snapshot.value;

        final regisertedDateTime =
            fromMysqlDateTime(user[User.keyPregnantAgeUpdatedAt]);
        final now = DateTime.now();

        final diffInWeeks =
            (regisertedDateTime.difference(now).inDays / 7).abs().toInt();

        final currentPregnantAgeWeek =
            num.parse(user[User.keyPregnantAgeWeek]) + diffInWeeks;

        _usageRef.push().set({
          'uid': firebaseUser.uid,
          'timestamp': DateTime.now().toIso8601String(),
          'email': user[User.keyEmail],
          'name': user[User.keyName],
          'pregnantAgeWeek': user[User.keyPregnantAgeWeek],
          'pregnantAgeDay': user[User.keyPregnantAgeDay],
          'currentPregnantAgeWeek': currentPregnantAgeWeek,
        }).catchError((error) {
          print(error);
        });
      });
    }
  }
}
