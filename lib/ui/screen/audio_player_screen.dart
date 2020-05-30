import 'dart:developer';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:pregnantcare/data/model/music.dart';
import 'package:pregnantcare/ui/common/app_bottom_navigation_bar.dart';
import 'package:pregnantcare/ui/common/custom_app_bar.dart';
import 'package:pregnantcare/ui/common/drawer_container.dart';
import 'package:pregnantcare/ui/style/widget_styles.dart';

class AudioPlayerScreen extends StatefulWidget {
  final List<Music> musics;
  final int musicStartIndex;

  const AudioPlayerScreen({Key key, this.musics, this.musicStartIndex}) : super(key: key);

  @override
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  AudioPlayer _advancedPlayer;
  AudioCache _audioCache;
  AudioPlayerState _audioPlayerState;

  int _currentMusicIndex;
  Music _currentMusic;
  Duration _position;
  Duration _duration;

  bool _repeat = false;
  List<Music> _musics = [];

  @override
  void initState() {
    _position = Duration();
    _duration = Duration();

    _musics = List.from(widget.musics);
    _currentMusicIndex = widget.musicStartIndex;
    _currentMusic = _musics[widget.musicStartIndex];

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
    _advancedPlayer = AudioPlayer();
    _audioCache = AudioCache(fixedPlayer: _advancedPlayer);

    _audioPlayerState = AudioPlayerState.STOPPED;
    _advancedPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        _audioPlayerState = state;
      });

      if (state == AudioPlayerState.COMPLETED) {
        if (_repeat) {
          _play(_currentMusic.url);
        } else {
          _next();
        }
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

    _play(_currentMusic.url);
  }

  void _play(url) async {
    await _audioCache.play(url);
  }

  void _pause() {
    _advancedPlayer.pause();
  }

  void _stop() {
    _advancedPlayer.stop();

    setState(() {
      _duration = Duration();
      _position = Duration();
    });
  }

  void _prev() async {
    if (_currentMusicIndex == 0) {
      setState(() {
        _currentMusicIndex = _musics.length - 1;
      });
    } else {
      setState(() {
        _currentMusicIndex--;
      });
    }

    _currentMusic = _musics[_currentMusicIndex];
    await _audioCache.play(_musics[_currentMusicIndex].url);
  }

  void _next() async {
    if (_currentMusicIndex == _musics.length - 1) {
      setState(() {
        _currentMusicIndex = 0;
      });
    } else {
      setState(() {
        _currentMusicIndex++;
      });
    }

    _currentMusic = _musics[_currentMusicIndex];
    await _audioCache.play(_musics[_currentMusicIndex].url);
  }

  void _toggleRepeat() {
    setState(() {
      _repeat = !_repeat;
    });
  }

  void _shuffle() {
    setState(() {
      _musics.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: AppDrawer(),
      appBar: CustomAppBar(title: _currentMusic.title),
      bottomNavigationBar: AppBottomNavigatioBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(height: 32),
                  Image.asset(
                    _currentMusic.thumbnail,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.shuffle),
                        onPressed: () => _shuffle(),
                      ),
                      IconButton(
                        icon: Icon(Icons.skip_previous),
                        onPressed: () => _prev(),
                      ),
                      IconButton(
                        icon: Icon(
                          _audioPlayerState != AudioPlayerState.PLAYING ? Icons.play_arrow : Icons.pause,
                        ),
                        onPressed: () => _audioPlayerState != AudioPlayerState.PLAYING ? _play(_musics[_currentMusicIndex].url) : _pause(),
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
                        icon: Icon(
                          Icons.loop,
                          color: _repeat ? Colors.black : Colors.grey.shade500,
                        ),
                        onPressed: () => _toggleRepeat(),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text('${(_position.inMinutes % 60).toString().padLeft(2, "0")}:${(_position.inSeconds % 60).toString().padLeft(2, "0")}'),
                            SizedBox(width: 4),
                            Text('/'),
                            SizedBox(width: 4),
                            Text('${(_duration.inMinutes % 60).toString().padLeft(2, "0")}:${(_duration.inSeconds % 60).toString().padLeft(2, "0")}'),
                          ],
                        ),
                        Expanded(
                          child: Slider(
                            value: _position.inMilliseconds.toDouble(),
                            max: _duration.inMilliseconds.toDouble() + 5000,
                            onChanged: (value) {
                              _advancedPlayer.seek(Duration(milliseconds: value.toInt()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset(_currentMusic.credit, height: 150),
        ],
      ),
    );
  }
}
