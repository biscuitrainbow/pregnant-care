import 'package:flutter/cupertino.dart';

class Music {
  final String title;
  final String url;
  final String thumbnail;
  final String credit;

  Music({
    @required this.title,
    @required this.url,
    this.thumbnail,
    this.credit,
  });

  String toString() {
    return "title $title, duration $url";
  }
}
