import 'package:flutter/material.dart';
import 'package:groovr/constants.dart';
import 'package:groovr/widgets/menu.dart';
import 'package:groovr/widgets/playground.dart';
import 'widgets/bottom_navbar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  final PanelController _panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Groovr',
      home: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 0.5],
            colors: [kBlack, kGreyBackground],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SlidingUpPanel(
              controller: _panelController,
              color: kBlack,
              isDraggable: false,
              minHeight: 64,
              maxHeight: 350,
              panel: Column(
                children: <Widget>[
                  BottomNavBar(panelController: _panelController),
                  Menu(),
                ],
              ),
              body: Playground(
                panelController: _panelController,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
