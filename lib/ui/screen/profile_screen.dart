import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pregnantcare/ui/common/bordered_container.dart';
import 'package:pregnantcare/ui/common/button.dart';
import 'package:pregnantcare/ui/common/custom_app_bar.dart';
import 'package:pregnantcare/ui/common/toast_message.dart';
import 'package:pregnantcare/ui/style/text_styles.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:pregnantcare/data/model/user.dart';
import 'package:pregnantcare/util/date_time_util.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _nameController;
  TextEditingController _dateOfBirthController;
  TextEditingController _ageController;
  TextEditingController _pregnantAgeWeekController;
  TextEditingController _pregnantAgeDayController;
  TextEditingController _emailController;

  int _currentPregnantAgeWeek = 0;
  int _currentPregnantAgeDay = 0;
  int _age = 0;

  FirebaseAuth _auth;
  FirebaseDatabase _database;
  DatabaseReference _usageRef;
  DatabaseReference _userRef;

  bool _loadingVisible;

  @override
  void initState() {
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _dateOfBirthController = TextEditingController();
    _ageController = TextEditingController();
    _pregnantAgeWeekController = TextEditingController();
    _pregnantAgeDayController = TextEditingController();

    _auth = FirebaseAuth.instance;
    _database = FirebaseDatabase.instance;

    _usageRef = _database.reference().child('usages');
    _userRef = _database.reference().child('users');

    _loadingVisible = false;

    _fetchUser();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _dateOfBirthController.dispose();
    _pregnantAgeWeekController.dispose();
    _pregnantAgeDayController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'โปรไฟล์ของฉัน'),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('assets/images/mom/mom-009.png',
                              width: 150),
                        ],
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                            hintText: 'ชื่อ - สกุล',
                            hintStyle: TextStyles.inputHint,
                            labelText: 'ชื่อ - สกุล',
                            labelStyle: TextStyle(color: Colors.black)),
                        style: TextStyles.inputHint,
                      ),
                      SizedBox(height: 24),
                      TextFormField(
                        onTap: _pickDateOfBirth,
                        controller: _dateOfBirthController,
                        decoration: InputDecoration(
                            hintText: 'วันเกิด',
                            hintStyle: TextStyles.inputHint,
                            labelText: 'วันเกิด',
                            labelStyle: TextStyle(color: Colors.black)),
                        style: TextStyles.inputHint,
                      ),
                      SizedBox(height: 24),
                      Text('อายุ',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(color: Colors.black)),
                      SizedBox(height: 12),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text('${_ageController.text}',
                                style: TextStyles.inputHint),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      Text('อายุครรภ์ที่บันทึกครั้งแรก',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(color: Colors.black)),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: TextFormField(
                              controller: _pregnantAgeWeekController,
                              decoration: InputDecoration(
                                  hintText: 'สัปดาห์',
                                  hintStyle: TextStyles.inputHint),
                              style: TextStyles.inputHint,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          SizedBox(width: 32),
                          Expanded(
                            child: TextFormField(
                              controller: _pregnantAgeDayController,
                              decoration: InputDecoration(
                                  hintText: 'วัน',
                                  hintStyle: TextStyles.inputHint),
                              style: TextStyles.inputHint,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      Text('อายุครรภ์ปัจจุบัน',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(color: Colors.black)),
                      SizedBox(height: 12),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text('$_currentPregnantAgeWeek สัปดาห์',
                                style: TextStyles.inputHint),
                          ),
                          // SizedBox(width: 32),
                          // Expanded(
                          //   child: Text('23 วัน', style: TextStyles.inputHint),
                          // ),
                        ],
                      ),
                      SizedBox(height: 24),
                      TextFormField(
                        enabled: false,
                        controller: _emailController,
                        decoration: InputDecoration(
                            hintText: 'อีเมล', hintStyle: TextStyles.inputHint),
                        style: TextStyles.inputHint,
                      ),
                      SizedBox(height: 24),
                      Button(
                        label: 'บันทึก',
                        color: Color.fromRGBO(99, 173, 177, 1),
                        textStyle: TextStyles.labelWhite,
                        onPressed: _updateUser,
                      ),
                      Button(
                        label: 'ออกจากระบบ',
                        color: Colors.grey.shade500,
                        textStyle: TextStyles.labelWhite,
                        onPressed: _signOut,
                      ),
                      SizedBox(height: 12),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _pickDateOfBirth() {
    DatePicker.showDatePicker(
      context,
      initialDateTime: DateTime(1950, 1, 1),
      dateFormat: 'yyyy-MM-dd',
      onChange: (date, index) {},
      onConfirm: (date, index) {
        final dateFormat = DateFormat('yyyy-MM-dd');
        final dateText = dateFormat.format(date);
        final age = _dateStringToAge(dateText);

        setState(() {
          _dateOfBirthController = TextEditingController(text: "$dateText");
          _ageController = TextEditingController(text: "$age ปี");
        });
      },
      pickerTheme: DateTimePickerTheme(
        confirm: Text('ยืนยัน'),
        cancel: Text('ยกเลิก'),
      ),
    );
  }

  void _fetchUser() async {
    final user = await _auth.currentUser();

    _userRef.child('${user.uid}').onValue.listen((event) {
      final user = event.snapshot.value;

      setState(() {
        _emailController = TextEditingController(text: user[User.keyEmail]);
        _nameController = TextEditingController(text: user[User.keyName]);
        _ageController = (user[User.keyDateOfBirth] as String).isNotEmpty
            ? TextEditingController(
                text: '${_dateStringToAge(user[User.keyDateOfBirth])} ปี')
            : TextEditingController();
        _dateOfBirthController =
            TextEditingController(text: user[User.keyDateOfBirth]);
        _pregnantAgeWeekController =
            TextEditingController(text: user[User.keyPregnantAgeWeek]);
        _pregnantAgeDayController =
            TextEditingController(text: user[User.keyPregnantAgeDay]);

        _currentPregnantAgeWeek = toPregnantAge(
          user[User.keyPregnantAgeUpdatedAt],
          num.parse(user[User.keyPregnantAgeWeek]),
        );
      });
    });
  }

  void _updateUser() async {
    _showLoading();

    final user = await _auth.currentUser();

    try {
      await _userRef.child('${user.uid}').update({
        User.keyName: _nameController.text,
        User.keyDateOfBirth: _dateOfBirthController.text,
        User.keyPregnantAgeWeek: _pregnantAgeWeekController.text,
        User.keyPregnantAgeDay: _pregnantAgeDayController.text,
        User.keyPregnantAgeUpdatedAt: toMysqlDateTime(DateTime.now()),
      });

      _hideLoading();

      createUsage();

      ToastMessage.showMessage('บันทึกแล้ว');
    } catch (e) {
      ToastMessage.showMessage('บันทึกไม่สำเร็จ');

      _hideLoading();
    }
  }

  int _dateStringToAge(date) {
    final dateFormat = DateFormat('yyyy-MM-dd');
    final dateOfBirth = dateFormat.parse(date);
    final now = DateTime.now();
    final age = (now.difference(dateOfBirth).inDays ~/ 365);

    return age;
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

  void _signOut() async {
    await _auth.signOut();
    ToastMessage.showMessage('ออกจากระบบแล้ว');
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
