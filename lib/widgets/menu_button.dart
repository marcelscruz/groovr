import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:groovr/models/controllers.dart';
import 'package:groovr/utils/constants.dart';
import 'package:groovr/presentation/custom_icons.dart';

class MenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Controllers>(
      builder: (context, controllers, child) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            controllers.toggleSlidingPanel();
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
      },
    );
  }
}
