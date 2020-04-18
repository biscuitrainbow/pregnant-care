import 'package:flutter/material.dart';
import 'package:pregnantcare/ui/common/bordered_container.dart';
import 'package:pregnantcare/ui/common/button.dart';
import 'package:pregnantcare/ui/screen/home_screen.dart';
import 'package:pregnantcare/ui/style/text_styles.dart';
import 'package:pregnantcare/ui/style/widget_styles.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetStyles.buildAppBar(context, 'เข้าสู่ระบบ'),
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
                  decoration: InputDecoration(hintText: 'อีเมลล์', hintStyle: TextStyles.inputHint),
                  style: TextStyles.inputHint,
                ),
                SizedBox(height: 24),
                TextFormField(
                  decoration: InputDecoration(hintText: 'รหัสผ่าน', hintStyle: TextStyles.inputHint),
                  style: TextStyles.inputHint,
                ),
                SizedBox(height: 24),
                Button(
                  label: 'เข้าสู่ระบบ',
                  color: Color.fromRGBO(153, 204, 204, 1),
                  textStyle: TextStyles.labelWhite,
                  onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen())),
                ),
                SizedBox(height: 36),
                Button(
                  label: 'เข้าสู่ระบบด้วย Facebook',
                  color: Color.fromRGBO(46, 117, 182, 1),
                  textStyle: TextStyles.labelWhite,
                  onPressed: () => 'print',
                ),
                SizedBox(height: 24),
                Button(
                  label: 'เข้าสู่ระบบด้วย Google',
                  color: Color.fromRGBO(237, 125, 49, 1),
                  textStyle: TextStyles.labelWhite,
                  onPressed: () => 'print',
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () => 'register',
                      child: Text(
                        'ลืมรหัสผ่าน',
                        style: TextStyles.labelWhite.copyWith(color: Color.fromRGBO(171, 170, 170, 1)),
                      ),
                    ),
                    Text(
                      '/',
                      style: TextStyles.labelWhite.copyWith(color: Color.fromRGBO(171, 170, 170, 1)),
                    ),
                    FlatButton(
                      onPressed: () => 'register',
                      child: Text(
                        'สร้างบัญชี',
                        style: TextStyles.labelWhite.copyWith(color: Colors.green),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
