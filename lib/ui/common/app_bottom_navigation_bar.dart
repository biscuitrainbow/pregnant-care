import 'package:flutter/material.dart';

import '../screen/register_screen.dart';

class AppBottomNavigatioBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int index) => _navigateToScreen(index, context),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: Color.fromRGBO(102, 51, 0, 1)),
          title: Text(
            'ข้อมูลส่วนตัว',
            style: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(102, 51, 0, 1),
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.menu,
            color: Color.fromRGBO(102, 51, 0, 1),
          ),
          title: Text(
            'เมนูหลัก',
            style: TextStyle(
              fontSize: 24,
              color: Color.fromRGBO(102, 51, 0, 1),
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.help, color: Color.fromRGBO(102, 51, 0, 1)),
          title: Text(
            'วิธ๊ใช้งาน',
            style: TextStyle(
              fontSize: 24,
              color: Color.fromRGBO(102, 51, 0, 1),
            ),
          ),
        ),
      ],
    );
  }

  void _navigateToScreen(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => RegisterScreen()));
        break;
      case 1:
        Scaffold.of(context).openDrawer();
        break;
      case 2:
        break;
      default:
    }
  }
}
