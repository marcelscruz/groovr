import 'package:flutter/material.dart';
import 'package:groovr/constants.dart';
import 'package:groovr/presentation/custom_icons.dart';

class SeekButtons extends StatelessWidget {
  final Function seekToSecond;

  const SeekButtons({@required this.seekToSecond});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return Row(
        children: <Widget>[
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              seekToSecond(-10);
            },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                CustomIcons.rewind,
                size: 25,
                color: kGrey1,
              ),
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              seekToSecond(10);
            },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                CustomIcons.forward,
                size: 25,
                color: kGrey1,
              ),
            ),
          ),
          SizedBox(width: 10),
        ],
      );
    } else {
      return SizedBox();
    }
  }
}
