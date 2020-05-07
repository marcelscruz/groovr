import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:groovr/constants.dart';

class MenuOption extends StatefulWidget {
  MenuOption({Key key}) : super(key: key);

  @override
  MenuOptionState createState() => MenuOptionState();
}

class MenuOptionState extends State<MenuOption> {
  ExpandableController _controller;
  ExpandableController get getController => _controller;

  @override
  Widget build(BuildContext context) {
    buildHeaderCollapsed(controller) {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    controller.toggle();
                  },
                  child: Text(
                    "Bossa Nova",
                    style: kBody1Bold,
                  ),
                ),
              ],
            ),
          ]);
    }

    buildOptions() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Bossa Nova', softWrap: true, style: kBody1Bold),
          SizedBox(height: 20),
          Text('Blues', softWrap: true, style: kBody1),
          SizedBox(height: 20),
          Text('Jazz', softWrap: true, style: kBody1),
          SizedBox(height: 20),
          Text('Rock', softWrap: true, style: kBody1),
        ],
      );
    }

    return ExpandableNotifier(
      child: ScrollOnExpand(
        child: Builder(
          builder: (context) {
            _controller = ExpandableController.of(context);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expandable(
                  collapsed: buildHeaderCollapsed(_controller),
                  // expanded: buildHeaderExpanded(),
                ),
                Expandable(
                  expanded: buildOptions(),
                ),
                Divider(
                  height: 1,
                ),
              ],
            );
          },
        ),
      ),
    );

    // return ExpandableNotifier(
    //   child: ScrollOnExpand(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: <Widget>[
    //         Expandable(
    //           collapsed: buildHeaderCollapsed(),
    //           // expanded: buildHeaderExpanded(),
    //         ),
    //         Expandable(
    //           expanded: buildOptions(),
    //         ),
    //         Divider(
    //           height: 1,
    //         ),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: <Widget>[
    //             Builder(
    //               builder: (context) {
    //                 var controller = ExpandableController.of(context);
    //                 return FlatButton(
    //                   child: Text(
    //                     controller.expanded ? "COLLAPSE" : "EXPAND",
    //                     style: Theme.of(context)
    //                         .textTheme
    //                         .button
    //                         .copyWith(color: Colors.deepPurple),
    //                   ),
    //                   onPressed: () {
    //                     controller.toggle();
    //                   },
    //                 );
    //               },
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
