import 'package:flutter/material.dart';
import 'package:pregnantcare/ui/style/widget_styles.dart';
import 'package:video_player/video_player.dart';
import 'package:awsome_video_player/awsome_video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String title;
  final List<String> videoUrls;
  final int videoStartIndex;

  const VideoPlayerScreen({
    Key key,
    this.title,
    this.videoUrls,
    this.videoStartIndex,
  }) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _videoController;
  ChewieController _chewieController;

  int _currentVideIndex;
  bool _isLooping = false;

  @override
  void initState() {
    super.initState();

    _currentVideIndex = widget.videoStartIndex;

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
      appBar: WidgetStyles.buildAppBar(
        context,
        widget.title,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 0),
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
                icon: _videoController.value.isPlaying
                    ? Icon(Icons.pause)
                    : Icon(Icons.play_arrow),
                onPressed: () => _videoController.value.isPlaying
                    ? _videoController.pause()
                    : _videoController.play(),
              ),
              IconButton(
                icon: Icon(Icons.skip_next),
                onPressed: () => _next(),
              ),
              IconButton(
                icon: Icon(
                  Icons.loop,
                  color: _isLooping ? Colors.red : Colors.grey,
                ),
                onPressed: () => _toggleLooping(),
              ),
            ],
          ),
          SizedBox(height: 32),
          Stack(
            alignment: Alignment.bottomLeft,
            children: <Widget>[
              FittedBox(
                  child: Image.asset('assets/images/bg-dot-green-yellow.png')),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Image.asset('assets/images/mom/mom-009.png', width: 180),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _initVideoPlayer() {
    final videoAsset = widget.videoUrls[_currentVideIndex];
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
      if (_currentVideIndex + 1 == widget.videoUrls.length) {
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
        _currentVideIndex = widget.videoUrls.length - 1;
      } else {
        _currentVideIndex--;
      }
    });

    _initVideoPlayer();
  }

  void _toggleLooping() {
    setState(() async {
      _isLooping = !_isLooping;
      await _videoController.setLooping(!_videoController.value.isLooping);
    });
  }
}
