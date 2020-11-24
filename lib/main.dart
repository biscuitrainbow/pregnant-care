import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pregnantcare/data/model/user.dart';
import 'package:pregnantcare/ui/screen/splash_screen.dart';
import 'package:pregnantcare/util/date_time_util.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  FirebaseAuth _auth;
  FirebaseDatabase _database;
  DatabaseReference _usageRef;
  DatabaseReference _userRef;

  @override
  void initState() async {
    WidgetsBinding.instance.addObserver(this);

    _auth = FirebaseAuth.instance;
    _database = FirebaseDatabase.instance;

    _database.setPersistenceEnabled(true);
    _database.setPersistenceCacheSizeBytes(10000);

    _usageRef = _database.reference().child('usages');
    _userRef = _database.reference().child('users');

    createUsage();
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {

    if (state == AppLifecycleState.resumed) {
      createUsage();
    }
  }

  void initFirebaseDatabase() async {}

  void createUsage() async {
    final firebaseUser = await _auth.currentUser();

    if (firebaseUser != null) {
      _userRef.child('${firebaseUser.uid}').onValue.listen((event) {
        final user = event.snapshot.value;

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
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'การคลอดบุตร ไม่น่ากลัว',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.sarabunTextTheme(),
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
