import 'package:flutter/material.dart';
import 'package:groovr/utils/constants.dart';
import 'package:groovr/widgets/menu_button.dart';
import 'package:groovr/widgets/play_pause_button.dart';
import 'package:groovr/widgets/progress_slider.dart';
import 'package:groovr/widgets/seek_buttons.dart';

class BottomNavBar extends StatelessWidget {
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
            MenuButton(),
            ProgressSlider(),
            SeekButtons(),
            PlayPauseButton(),
          ],
        ),
      ),
    );
  }
}
