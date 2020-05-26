import 'package:flutter/material.dart';
// import 'package:flare_flutter/flare_actor.dart';
// import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:groovr/models/configuration.dart';
import 'package:groovr/models/controllers.dart';
import 'package:groovr/utils/constants.dart';

class Playground extends StatefulWidget {
  @override
  _PlaygroundState createState() => _PlaygroundState();
}

class _PlaygroundState extends State<Playground> {
  String guitarState = 'NONE';

  void changeKey(key) {
    setState(() {
      guitarState = key;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Controllers>(
      builder: (context, controllers, child) {
        return Consumer<Configuration>(
          builder: (context, configuration, child) {
            // print(configuration.selectedKey);
            // print(guitarState);
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                // controllers.closeSlidingPanel();

                // if (guitarState == 'A') {
                //   changeKey('ASHARP');
                // } else if (guitarState == 'ASHARP') {
                //   changeKey('B');
                // } else {
                //   changeKey('A');
                // }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: kBlack,
                ),
                child: Text(
                  'Guitar',
                  style: kBody1Bold,
                ),
                // child: PhotoView.customChild(
                //   initialScale: 1.5,
                //   minScale: 1.0,
                //   maxScale: 3.0,
                //   basePosition: Alignment.topCenter,
                //   child: FlareActor(
                //     'assets/guitar.flr',
                //     alignment: Alignment.topCenter,
                //     fit: BoxFit.cover,
                //     animation: guitarState,
                //     // animation: configuration.selectedKey,
                //   ),
                // ),
              ),
            );
          },
        );
      },
    );
  }
}
