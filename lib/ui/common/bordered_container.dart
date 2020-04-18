import 'package:flutter/material.dart';

class BorderedContainer extends StatelessWidget {
  const BorderedContainer({Key key, this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 580,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(64),
        border: Border.all(
          color: Colors.white,
          width: 8,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(46),
          color: Colors.white,
        ),
        margin: EdgeInsets.all(12),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 2),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: children,
          ),
        ),
      ),
    );
  }
}
