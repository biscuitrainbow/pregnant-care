import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pregnantcare/ui/screen/login_screen.dart';
import 'package:pregnantcare/ui/screen/profile_screen.dart';
import 'package:pregnantcare/data/model/user.dart';
import 'package:firebase_database/firebase_database.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool checkingLoggedIn = true;
  bool loggedIn = false;
  User _user = User();

  @override
  void initState() {
    _checkLoggedIn();

    _auth.onAuthStateChanged.listen((event) {
      print(event);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return ProfileScreen(user: _user);

    return StreamBuilder(
        stream: _auth.onAuthStateChanged,
        builder: (context, user) {
          if (user.data != null) {
            return ProfileScreen();
          } else {
            return LoginScreen();
          }
        });
  }

  void _checkLoggedIn() async {
    setState(() {
      checkingLoggedIn = true;
    });

    final user = await _auth.currentUser();

    setState(() {
      loggedIn = user != null;
      checkingLoggedIn = false;

      if (user != null) {
        _user = _user.copyWith(email: user.email);
      }
    });
  }
}
