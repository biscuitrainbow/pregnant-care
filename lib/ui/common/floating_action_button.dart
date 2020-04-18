import 'package:flutter/material.dart';

class DrawerFloatingActionButton extends StatelessWidget {
  final Function onPressed;

  const DrawerFloatingActionButton({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 80),
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: Color.fromRGBO(255, 255, 153, 1),
        child: Icon(Icons.menu, color: Color.fromRGBO(102, 51, 0, 1)),
      ),
    );
  }
}
