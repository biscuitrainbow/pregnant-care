import 'package:flutter/material.dart';
import 'package:pregnantcare/data/model/music.dart';
import 'package:pregnantcare/ui/common/app_bottom_navigation_bar.dart';
import 'package:pregnantcare/ui/common/custom_app_bar.dart';
import 'package:pregnantcare/ui/common/drawer_container.dart';
import 'package:pregnantcare/ui/screen/audio_player_screen.dart';

import '../common/bordered_container.dart';
import '../style/widget_styles.dart';

class MusicListScreen extends StatefulWidget {
  @override
  _MusicListScreenState createState() => _MusicListScreenState();
}

class _MusicListScreenState extends State<MusicListScreen> {
  final List<Music> _musics = [
    Music(
      title: 'Sundial dream',
      url: 'musics/sundial-dreams.mp3',
      thumbnail: 'assets/musics/sundial-dreams.jpg',
      credit: 'assets/musics/sundial-dreams-credit.jpg',
    ),
    Music(
      title: 'Relaxation Piano Music 1',
      url: 'musics/relaxing-piano-1.mp3',
      thumbnail: 'assets/musics/relaxing-piano-1.jpg',
      credit: 'assets/musics/relaxing-piano-1-credit.jpg',
    ),
    Music(
      title: 'Relaxation Piano Music 2',
      url: 'musics/relaxing-piano-2.mp3',
      thumbnail: 'assets/musics/relaxing-piano-2.jpg',
      credit: 'assets/musics/relaxing-piano-2-credit.jpg',
    ),
    Music(
      title: 'เพลงนิพพาน',
      url: 'musics/nipphan.mp3',
      thumbnail: 'assets/musics/nipphan.jpg',
      credit: 'assets/musics/nipphan-credit.jpg',
    ),
    Music(
      title: 'เพลงดั่งดอกไม้บ้าน',
      url: 'musics/dung-dok-mai-barn.mp3',
      thumbnail: 'assets/musics/dung-dok-mai-barn.jpg',
      credit: 'assets/musics/dung-dok-mai-barn-credit.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'ดนตรีเพื่อการผ่อนคลาย (สมาธิผสมผสาน)'),
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
                Image.asset('assets/images/music.png'),
                SizedBox(height: 16),
                GestureDetector(
                  child: Image.asset('assets/images/buttons/btn-003-003-001.png'),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => AudioPlayerScreen(
                        musics: _musics,
                        musicStartIndex: 0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                GestureDetector(
                  child: Image.asset('assets/images/buttons/btn-003-003-002.png'),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => AudioPlayerScreen(
                        musics: _musics,
                        musicStartIndex: 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                GestureDetector(
                  child: Image.asset('assets/images/buttons/btn-003-003-003.png'),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => AudioPlayerScreen(
                        musics: _musics,
                        musicStartIndex: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                GestureDetector(
                  child: Image.asset('assets/images/buttons/btn-003-003-004.png'),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => AudioPlayerScreen(
                        musics: _musics,
                        musicStartIndex: 3,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                GestureDetector(
                  child: Image.asset('assets/images/buttons/btn-003-003-005.png'),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => AudioPlayerScreen(
                        musics: _musics,
                        musicStartIndex: 4,
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
