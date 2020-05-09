import 'package:flutter/material.dart';
import 'package:groovr/utils/constants.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Playground extends StatelessWidget {
  final PanelController panelController;

  Playground({@required this.panelController});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (panelController.isPanelOpen) {
          panelController.close();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: kBlack,
        ),
        child: Text(
          'Playground here',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
