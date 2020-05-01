import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class BottomNavBar extends StatelessWidget {
  final PanelController panelController;

  BottomNavBar({@required this.panelController});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        child: Text(
          'Toggle Menu',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        onPressed: () {
          print('toggle menu');
          panelController.isPanelClosed
              ? panelController.open()
              : panelController.close();
        },
      ),
    );
  }
}
