import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool automaticallyImplyLeading;
  final LeadingType leadingType;

  CustomAppBar({
    Key key,
    this.title,
    this.automaticallyImplyLeading = true,
    this.leadingType = LeadingType.back,
  })  : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.title,
        style: TextStyle(
          color: Color.fromRGBO(102, 51, 0, 1),
          fontSize: 32,
        ),
      ),
      elevation: 0,
      backgroundColor: Color.fromRGBO(255, 255, 153, 1),
      iconTheme: Theme.of(context).iconTheme.copyWith(color: Color.fromRGBO(102, 51, 0, 1)),
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      leading: widget.leadingType == LeadingType.back
          ? IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            )
          : IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
    );
  }
}

enum LeadingType { menu, back }
