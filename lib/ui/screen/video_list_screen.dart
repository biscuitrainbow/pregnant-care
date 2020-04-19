import 'package:flutter/material.dart';
import 'package:pregnantcare/ui/common/bordered_container.dart';
import 'package:pregnantcare/ui/screen/video_player_screen.dart';
import 'package:pregnantcare/ui/style/widget_styles.dart';

class VideoListScreen extends StatefulWidget {
  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  final List<String> _videoUrls = [
    'assets/videos/video-002.webm',
    'assets/videos/video-001.webm'
  ];

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
                GestureDetector(
                  child:
                      Image.asset('assets/images/buttons/btn-003-001-001.png'),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => VideoPlayerScreen(
                        title: 'เพลงดั่งดอกไม้บาน',
                        videoUrls: _videoUrls,
                        videoStartIndex: 0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32),
                GestureDetector(
                  child:
                      Image.asset('assets/images/buttons/btn-003-001-002.png'),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => VideoPlayerScreen(
                        title: 'เพลงดั่งดอกไม้บาน',
                        videoUrls: _videoUrls,
                        videoStartIndex: 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32),
                Image.asset('assets/images/mom/mom-016.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
