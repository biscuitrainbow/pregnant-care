import 'package:flutter/material.dart';
import 'package:pregnantcare/data/model/video.dart';
import 'package:pregnantcare/ui/common/app_bottom_navigation_bar.dart';
import 'package:pregnantcare/ui/common/bordered_container.dart';
import 'package:pregnantcare/ui/common/custom_app_bar.dart';
import 'package:pregnantcare/ui/common/drawer_container.dart';
import 'package:pregnantcare/ui/screen/video_player_screen.dart';
import 'package:pregnantcare/ui/style/widget_styles.dart';

class VideoListScreen extends StatefulWidget {
  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  final List<Video> _videos = [
    Video(
      title: 'เพลงดั่งดอกไม้บาน',
      url: 'assets/videos/video-002.mp4',
    ),
    Video(
      title: 'เพลงแผ่เมตตา',
      url: 'assets/videos/video-001.mp4',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'การฝึกสมาธิเบื้องต้น'),
      backgroundColor: Color.fromRGBO(135, 202, 204, 1),
      drawer: AppDrawer(),
      bottomNavigationBar: AppBottomNavigatioBar(),
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
                  child: Image.asset('assets/images/buttons/btn-003-001-001.png'),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => VideoPlayerScreen(
                        videos: _videos,
                        videoStartIndex: 0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32),
                GestureDetector(
                  child: Image.asset('assets/images/buttons/btn-003-001-002.png'),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => VideoPlayerScreen(
                        videos: _videos,
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
