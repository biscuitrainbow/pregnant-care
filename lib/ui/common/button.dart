import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String image;
  final double imageHeight;

  final String label;
  final TextStyle textStyle;
  final Color color;
  final Function onPressed;

  final double top;
  final double left;

  const Button({
    Key key,
    this.image,
    this.imageHeight = 90,
    this.color,
    this.label,
    this.onPressed,
    this.textStyle,
    this.top = -10,
    this.left = -25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.centerLeft,
      children: [
        SizedBox(
          width: double.infinity,
          child: RaisedButton(
            splashColor: Colors.white,
            color: color,
            onPressed: onPressed,
            padding: EdgeInsets.symmetric(horizontal: 42, vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26.0)),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: textStyle,
                ),
              ],
            ),
          ),
        ),
        if (image != null)
          Positioned(
            top: top,
            left: left,
            child: Image.asset(
              image,
              height: imageHeight,
              width: imageHeight,
            ),
          )
      ],
    );
  }
}
