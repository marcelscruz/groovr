import 'package:flutter/material.dart';
import 'package:groovr/constants.dart';
import 'package:groovr/widgets/menu_button.dart';
import 'package:groovr/widgets/play_pause_button.dart';
import 'package:groovr/widgets/progress_slider.dart';
import 'package:groovr/widgets/seek_buttons.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class BottomNavBar extends StatefulWidget {
  final PanelController panelController;

  BottomNavBar({@required this.panelController});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  AudioPlayer _player;
  AudioPlayerState _playerState;
  AudioCache _audioCache;

  Duration _duration = Duration();
  Duration _position = Duration();

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    _player = AudioPlayer();
    _audioCache = AudioCache(fixedPlayer: _player);

    _player.onDurationChanged.listen((Duration d) {
      setState(() => _duration = d);
    });

    _player.onAudioPositionChanged.listen((Duration p) {
      setState(() => _position = p);
    });

    _player.onPlayerStateChanged.listen((AudioPlayerState s) {
      setState(() => _playerState = s);
    });
  }

  void _slideToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    setState(() {
      _player.seek(newDuration);
    });
  }

  void _seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    setState(() {
      _player.seek(_position + newDuration);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: kGreyBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          // border: Border(
          //   top: BorderSide(
          //     color: kGreyBorder,
          //     width: 1,
          //   ),
          // ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MenuButton(panelController: widget.panelController),
            ProgressSlider(
              position: _position,
              duration: _duration,
              slideToSecond: _slideToSecond,
            ),
            SeekButtons(
              seekToSecond: _seekToSecond,
            ),
            PlayPauseButton(
              player: _player,
              audioCache: _audioCache,
              playerState: _playerState,
            ),
          ],
        ),
      ),
    );
  }
}
