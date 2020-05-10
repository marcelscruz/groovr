import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:groovr/models/player.dart';
import 'package:groovr/utils/constants.dart';

class ProgressSlider extends StatelessWidget {
  String _printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${duration.inMinutes.remainder(60)}:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Player>(
      builder: (context, player, child) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 6),
                    thumbColor: kWhite,
                    activeTrackColor: kWhite,
                    inactiveTrackColor: kGrey2,
                    overlayColor: kWhite,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 3),
                    child: Slider(
                      value: player.position.inSeconds.toDouble(),
                      min: 0.0,
                      max: player.duration.inSeconds.toDouble(),
                      onChanged: (double value) {
                        Provider.of<Player>(context, listen: false)
                            .slideToSecond(value.toInt());
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Transform.translate(
                      offset: Offset(6, 0),
                      child: Text(
                        _printDuration(player.position),
                        style: kBody2,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(-5, 0),
                      child: Text(
                        _printDuration(player.duration),
                        style: kBody2,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
