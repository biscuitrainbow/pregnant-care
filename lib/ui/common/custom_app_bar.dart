import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          color: Colors.black,
          fontSize: 18,
          fontFamily: GoogleFonts.sarabun().fontFamily
        ),
      ),
      elevation: 0,
      backgroundColor: Color.fromRGBO(255, 151, 203, 1),
      iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.black),
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
