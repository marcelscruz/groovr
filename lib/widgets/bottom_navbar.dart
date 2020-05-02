import 'package:flutter/material.dart';
import 'package:groovr/constants.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:groovr/presentation/custom_icons.dart';

class BottomNavBar extends StatelessWidget {
  final PanelController panelController;

  BottomNavBar({@required this.panelController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: kGreyBackground,
          border: Border(
            top: BorderSide(
              color: kGreyBorder,
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MenuButton(panelController: panelController),
            PlayPauseButton()
          ],
        ),
      ),
    );
  }
}

class PlayPauseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        print('hey');
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
          child: Transform.translate(
            offset: Offset(2, 0),
            child: Icon(
              CustomIcons.play,
              size: 15,
              color: kWhite,
            ),
          ),
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({@required this.panelController});

  final PanelController panelController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        panelController.isPanelOpen
            ? panelController.close()
            : panelController.open();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Transform.translate(
              offset: Offset(-5, 0),
              child: Icon(
                CustomIcons.menu,
                size: 18,
                color: kGrey1,
              ),
            ),
            SizedBox(height: 6),
            Text(
              'Menu',
              style: kH3Left,
            ),
          ],
        ),
      ),
    );
  }
}
