import 'package:flutter/material.dart';

class Video {
  final String url;
  final String title;
  final String credit;

  Video({
    @required this.url,
    @required this.title,
    this.credit,
  });
}
