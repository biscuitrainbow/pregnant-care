import 'package:flutter/material.dart';
import 'package:pregnantcare/ui/style/widget_styles.dart';
import 'package:video_player/video_player.dart';
import 'package:awsome_video_player/awsome_video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String url;
  final String title;

  const VideoPlayerScreen({Key key, this.url, this.title}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _videoController;
  ChewieController _chewieController;

  _VideoPlayerScreenState();
  @override
  void initState() {
    _videoController = VideoPlayerController.asset(widget.url);

    _chewieController = ChewieController(
      videoPlayerController: _videoController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
    );

    super.initState();
  }

  @override
  void dispose() {
    _chewieController.pause();
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
          SizedBox(height: 32),
          Stack(
            alignment: Alignment.bottomLeft,
            children: <Widget>[
              FittedBox(child: Image.asset('assets/images/bg-dot-green-yellow.png')),
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
}
