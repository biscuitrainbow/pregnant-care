import 'package:flutter/material.dart';
import 'package:pregnantcare/ui/common/bordered_container.dart';
import 'package:pregnantcare/ui/common/button.dart';
import 'package:pregnantcare/ui/screen/video_player_screen.dart';
import 'package:pregnantcare/ui/style/text_styles.dart';
import 'package:pregnantcare/ui/style/widget_styles.dart';

class VideoListScreen extends StatefulWidget {
  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetStyles.buildAppBar(context, 'เทคนิคการผ่อนคลาย'),
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
                Button(
                  label: 'เพลงดั่งดอกไม้บาน',
                  color: Color.fromRGBO(146, 208, 80, 1),
                  textStyle: TextStyles.labelBrown,
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => VideoPlayerScreen(
                        url: 'assets/videos/video-002.webm',
                        title: 'เพลงดั่งดอกไม้บาน',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32),
                Button(
                  label: 'เพลงแผ่เมตตา',
                  color: Color.fromRGBO(146, 208, 80, 1),
                  textStyle: TextStyles.labelBrown,
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => VideoPlayerScreen(
                        url: 'assets/videos/video-001.webm',
                        title: 'เพลงแผ่เมตตา',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
