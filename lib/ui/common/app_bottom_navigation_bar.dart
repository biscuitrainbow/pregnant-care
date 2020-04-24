import 'package:flutter/material.dart';

import '../screen/register_screen.dart';

class AppBottomNavigatioBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int index) => _navigateToScreen(index, context),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.help, color: Color.fromRGBO(102, 51, 0, 1)),
          title: Container(),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.menu,
            color: Color.fromRGBO(102, 51, 0, 1),
          ),
          title: Container(),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: Color.fromRGBO(102, 51, 0, 1)),
          title: Container(),
        ),
      ],
    );
  }

  void _navigateToScreen(int index, BuildContext context) {
    switch (index) {
      case 0:
        break;
      case 1:
        Scaffold.of(context).openDrawer();
        break;
      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => RegisterScreen()));
        break;
      default:
    }
  }
}
