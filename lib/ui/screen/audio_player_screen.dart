import 'dart:developer';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:pregnantcare/data/model/music.dart';
import 'package:pregnantcare/ui/common/app_bottom_navigation_bar.dart';
import 'package:pregnantcare/ui/common/drawer_container.dart';
import 'package:pregnantcare/ui/style/widget_styles.dart';

class AudioPlayerScreen extends StatefulWidget {
  final List<Music> musics;
  final int musicStartIndex;

  const AudioPlayerScreen({Key key, this.musics, this.musicStartIndex})
      : super(key: key);

  @override
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  AudioPlayer _advancedPlayer;
  AudioCache _audioCache;
  AudioPlayerState _audioPlayerState;

  int _currentMusicIndex;
  Duration _position;
  Duration _duration;

  @override
  void initState() {
    _currentMusicIndex = widget.musicStartIndex;
    _position = Duration();
    _duration = Duration();

    initAudioPlayer();

    super.initState();
  }

  @override
  void dispose() {
    _advancedPlayer.stop();
    _advancedPlayer.release();
    _advancedPlayer.dispose();

    super.dispose();
  }

  void initAudioPlayer() async {
    _advancedPlayer = new AudioPlayer();
    _audioCache = new AudioCache(fixedPlayer: _advancedPlayer);

    _audioPlayerState = AudioPlayerState.STOPPED;
    _advancedPlayer.onPlayerStateChanged.listen((state) {
      // if (state == AudioPlayerState.PLAYING) {}

      if (state == AudioPlayerState.COMPLETED) {
        _next();
      }
    });

    _advancedPlayer.onAudioPositionChanged.listen((Duration position) {
      setState(() {
        _position = position;
      });
    });

    _advancedPlayer.onDurationChanged.listen((Duration duration) {
      _duration = duration;
    });

    _play();
  }

  void _play() async {
    await _audioCache.play(widget.musics[_currentMusicIndex].url);
  }

  void _pause() {
    _advancedPlayer.pause();
  }

  void _stop() {
    _advancedPlayer.stop();
  }

  void _next() async {
    if (_currentMusicIndex == widget.musics.length - 1) {
      setState(() {
        _currentMusicIndex = 0;
      });
    } else {
      setState(() {
        _currentMusicIndex++;
      });
    }

    await _audioCache.play(widget.musics[_currentMusicIndex].url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: AppDrawer(),
      appBar: WidgetStyles.buildAppBar(
          context, widget.musics[_currentMusicIndex].title),
      bottomNavigationBar: AppBottomNavigatioBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('${_position.inMilliseconds}'),
          Text('${_duration.inMilliseconds}'),
          SizedBox(height: 32),
          Image.asset(
            'assets/images/mom/mom-017.png',
            height: 220,
          ),
          SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.shuffle),
                onPressed: () => 'tap',
              ),
              IconButton(
                icon: Icon(Icons.skip_previous),
                onPressed: () => 'tap',
              ),
              IconButton(
                icon: Icon(
                  _audioPlayerState != AudioPlayerState.PLAYING
                      ? Icons.play_arrow
                      : Icons.pause,
                ),
                onPressed: () => _audioPlayerState != AudioPlayerState.PLAYING
                    ? _play()
                    : _pause(),
              ),
              IconButton(
                icon: Icon(Icons.stop),
                onPressed: () => _stop(),
              ),
              IconButton(
                icon: Icon(Icons.skip_next),
                onPressed: () => _next(),
              ),
              IconButton(
                icon: Icon(Icons.loop),
                onPressed: () => 'tap',
              ),
            ],
          ),
          Slider(
            value: _position.inMilliseconds.toDouble(),
            max: _duration.inMilliseconds.toDouble() + 1000,
            onChanged: (value) {
              _advancedPlayer.seek(Duration(milliseconds: value.toInt()));
            },
          ),
          SizedBox(height: 32),
          FittedBox(
            child: Image.asset(
              'assets/images/bg-dot-green-yellow.png',
            ),
          ),
        ],
      ),
    );
  }
}
