import 'package:flutter/material.dart';
import 'package:groovr/constants.dart';
import 'package:groovr/presentation/custom_icons.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class PlayPauseButton extends StatelessWidget {
  final AudioPlayer player;
  final AudioCache audioCache;
  final AudioPlayerState playerState;

  PlayPauseButton({
    @required this.player,
    @required this.audioCache,
    @required this.playerState,
  });

  Transform renderIcon() {
    if (playerState == AudioPlayerState.PLAYING) {
      return Transform.translate(
        offset: Offset(1, 0),
        child: Icon(
          CustomIcons.pause,
          size: 15,
          color: kWhite,
        ),
      );
    } else {
      return Transform.translate(
        offset: Offset(2, 0),
        child: Icon(
          CustomIcons.play,
          size: 15,
          color: kWhite,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (playerState == AudioPlayerState.PLAYING) {
          player.pause();
        } else {
          audioCache.play('blues-a-major.mp3');
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kYellow,
          ),
          height: 37,
          padding: EdgeInsets.all(10),
          child: renderIcon(),
        ),
      ),
    );
  }
}
