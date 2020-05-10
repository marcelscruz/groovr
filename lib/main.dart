import 'package:flutter/material.dart';
import 'package:groovr/models/player.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:groovr/utils/constants.dart';
import 'package:groovr/models/configuration.dart';
import 'package:groovr/models/controllers.dart';
import 'package:groovr/widgets/menu.dart';
import 'package:groovr/widgets/playground.dart';
import 'package:groovr/widgets/bottom_navbar.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Configuration>(create: (_) => Configuration()),
        ChangeNotifierProvider<Controllers>(create: (_) => Controllers()),
        ChangeNotifierProvider<Player>(create: (_) => Player()),
      ],
      child: MaterialApp(
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
              child: Consumer<Controllers>(
                builder: (context, controllers, child) {
                  return SlidingUpPanel(
                    controller: controllers.slidingPanelController,
                    color: kBlack,
                    isDraggable: false,
                    minHeight: 64,
                    maxHeight: 350,
                    panel: Column(
                      children: <Widget>[
                        BottomNavBar(),
                        Menu(),
                      ],
                    ),
                    body: Playground(),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
