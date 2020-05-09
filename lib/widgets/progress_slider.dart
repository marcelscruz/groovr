import 'package:flutter/material.dart';
import 'package:groovr/utils/constants.dart';

class ProgressSlider extends StatelessWidget {
  final Duration position;
  final Duration duration;
  final Function slideToSecond;

  ProgressSlider({
    @required this.position,
    @required this.duration,
    @required this.slideToSecond,
  });

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
                  value: position.inSeconds.toDouble(),
                  min: 0.0,
                  max: duration.inSeconds.toDouble(),
                  onChanged: (double value) {
                    slideToSecond(value.toInt());
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
                    _printDuration(position),
                    style: kBody2,
                  ),
                ),
                Transform.translate(
                  offset: Offset(-5, 0),
                  child: Text(
                    _printDuration(duration),
                    style: kBody2,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
