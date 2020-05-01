import 'package:flutter/material.dart';
import 'package:groovr/widgets/menu.dart';
import 'package:groovr/widgets/playground.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'widgets/bottom_controller.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  final PanelController _pc = new PanelController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        child: SlidingUpPanel(
          controller: _pc,
          panel: Center(
            child: Menu(),
          ),
          header: BottomNavBar(
            panelController: _pc,
          ),
          body: Playground(),
        ),
      ),
    );
  }
}
