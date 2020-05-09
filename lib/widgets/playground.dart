import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:groovr/models/controllers.dart';
import 'package:groovr/utils/constants.dart';

class Playground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Controllers>(
      builder: (context, controllers, child) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            controllers.closeSlidingPanel();
          },
          child: Container(
            decoration: BoxDecoration(
              color: kBlack,
            ),
            child: Text(
              '',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
