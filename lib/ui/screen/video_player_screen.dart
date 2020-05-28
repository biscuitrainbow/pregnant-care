import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:pregnantcare/data/model/video.dart';
import 'package:pregnantcare/ui/common/app_bottom_navigation_bar.dart';
import 'package:pregnantcare/ui/common/custom_app_bar.dart';
import 'package:pregnantcare/ui/common/drawer_container.dart';
import 'package:pregnantcare/ui/style/widget_styles.dart';
import 'package:video_player/video_player.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VideoPlayerScreen extends StatefulWidget {
  final List<Video> videos;
  final int videoStartIndex;

  const VideoPlayerScreen({
    Key key,
    this.videos,
    this.videoStartIndex,
  }) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _videoController;
  ChewieController _chewieController;

  int _currentVideIndex;
  Video _currentVideo;
  bool _isLooping = false;

  @override
  void initState() {
    super.initState();

    _currentVideIndex = widget.videoStartIndex;
    _currentVideo = widget.videos[_currentVideIndex];

    _initVideoPlayer();
  }

  @override
  void dispose() {
    _chewieController.dispose();
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: AppDrawer(),
      bottomNavigationBar: AppBottomNavigatioBar(),
      appBar: CustomAppBar(
        title: widget.videos[_currentVideIndex].title,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 48),
                Chewie(
                  controller: _chewieController,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.shuffle),
                      onPressed: () => 'tap',
                    ),
                    IconButton(
                      icon: Icon(Icons.skip_previous),
                      onPressed: () => _prev(),
                    ),
                    IconButton(
                      icon: _videoController.value.isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                      onPressed: () => _videoController.value.isPlaying ? _videoController.pause() : _videoController.play(),
                    ),
                    IconButton(
                      icon: Icon(Icons.skip_next),
                      onPressed: () => _next(),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.loop,
                        color: _isLooping ? Colors.black : Colors.grey,
                      ),
                      onPressed: () => _toggleLooping(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(child: Image.asset('assets/images/mom/mom-009.png', height: 150)),
                Expanded(child: Image.asset(widget.videos[_currentVideIndex].credit)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _initVideoPlayer() {
    final videoAsset = widget.videos[_currentVideIndex].url;
    _videoController = VideoPlayerController.asset(videoAsset);

    _videoController.addListener(_autoNext);
    _videoController.addListener(_refresh);

    _chewieController = ChewieController(
      videoPlayerController: _videoController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: _isLooping,
    );

    setState(() {});
  }

  void _refresh() {
    print('refresh video state');
    setState(() {});
  }

  void _autoNext() {
    int total = _videoController.value.duration?.inMilliseconds;
    final int pos = _videoController.value.position?.inMilliseconds ?? 0;

    if (total == null) total = 1;
    if (total - pos <= 0) {
      _videoController.removeListener(_autoNext);

      if (!_videoController.value.isLooping) {
        _next();
      }
    }
  }

  void _next() async {
    await _videoController.pause();
    await _chewieController.pause();

    setState(() {
      if (_currentVideIndex + 1 == widget.videos.length) {
        _currentVideIndex = 0;
      } else {
        _currentVideIndex++;
      }
    });

    _initVideoPlayer();
  }

  void _prev() async {
    await _videoController.pause();
    await _chewieController.pause();

    setState(() {
      if (_currentVideIndex == 0) {
        _currentVideIndex = widget.videos.length - 1;
      } else {
        _currentVideIndex--;
      }
    });

    _initVideoPlayer();
  }

  void _toggleLooping() {
    Fluttertoast.showToast(
      msg: _videoController.value.isLooping ? "ยกเลิกการเล่นวนซ้ำ" : "เล่นวนซ้ำ",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );

    setState(() async {
      _isLooping = !_isLooping;
      await _videoController.setLooping(!_videoController.value.isLooping);
    });
  }
}
