import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:groovr/models/player.dart';
import 'package:groovr/utils/constants.dart';
import 'package:groovr/presentation/custom_icons.dart';

class SeekButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return Row(
        children: <Widget>[
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Provider.of<Player>(context, listen: false).seekToSecond(-10);
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
              Provider.of<Player>(context, listen: false).seekToSecond(10);
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
