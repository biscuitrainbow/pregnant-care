import 'package:flutter/material.dart';

import '../common/bordered_container.dart';
import '../style/widget_styles.dart';
import 'video_player_screen.dart';

class MusicListScreen extends StatefulWidget {
  @override
  _MusicListScreenState createState() => _MusicListScreenState();
}

class _MusicListScreenState extends State<MusicListScreen> {
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
                SizedBox(height: 16),
                Image.asset('assets/images/music.png'),
                SizedBox(height: 16),
                GestureDetector(
                  child:
                      Image.asset('assets/images/buttons/btn-003-002-001.png'),
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
                SizedBox(height: 16),
                GestureDetector(
                  child:
                      Image.asset('assets/images/buttons/btn-003-002-002.png'),
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
                SizedBox(height: 16),
                GestureDetector(
                  child:
                      Image.asset('assets/images/buttons/btn-003-002-003.png'),
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
                SizedBox(height: 16),
                GestureDetector(
                  child:
                      Image.asset('assets/images/buttons/btn-003-002-004.png'),
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
                SizedBox(height: 16),
                GestureDetector(
                  child:
                      Image.asset('assets/images/buttons/btn-003-002-005.png'),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
