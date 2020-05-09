import 'package:flutter/material.dart';
import 'package:groovr/utils/constants.dart';
import 'package:groovr/presentation/custom_icons.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

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
