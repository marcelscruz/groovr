import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:groovr/models/configuration.dart';
import 'package:groovr/models/player.dart';
import 'package:groovr/utils/constants.dart';
import 'package:groovr/presentation/custom_icons.dart';

class PlayPauseButton extends StatelessWidget {
  Transform renderIcon(playerState) {
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
    return Consumer<Player>(
      builder: (context, player, child) {
        return Consumer<Configuration>(
          builder: (context, configuration, child) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                if (player.playerState == AudioPlayerState.PLAYING) {
                  player.playerController.pause();
                } else {
                  player.audioCache.play(configuration.currentTrack);
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
                  child: renderIcon(player.playerState),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
