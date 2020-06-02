import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:groovr/models/configuration.dart';
import 'package:groovr/models/controllers.dart';
import 'package:groovr/utils/constants.dart';

class PrintLayer extends StatelessWidget {
  final String image;

  const PrintLayer({@required this.image});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: SvgPicture.asset(image),
      top: 20,
      left: 0,
      right: 0,
      bottom: 0,
    );
  }
}

class Playground extends StatefulWidget {
  @override
  _PlaygroundState createState() => _PlaygroundState();
}

class _PlaygroundState extends State<Playground> {
  String guitarState = 'NONE';

  @override
  Widget build(BuildContext context) {
    return Consumer<Controllers>(
      builder: (context, controllers, child) {
        return Consumer<Configuration>(
          builder: (context, configuration, child) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                controllers.closeSlidingPanel();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: kBlack,
                ),
                child: PhotoView.customChild(
                  initialScale: 1.5,
                  minScale: 1.0,
                  maxScale: 2.0,
                  basePosition: Alignment.topCenter,
                  child: Stack(
                    children: <Widget>[
                      PrintLayer(image: 'images/guitar.svg'),
                      PrintLayer(
                          image: 'images/${configuration.selectedKey}.svg'),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
