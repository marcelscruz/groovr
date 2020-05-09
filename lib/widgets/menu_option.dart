import 'package:flutter/material.dart';
import 'package:groovr/utils/constants.dart';
import 'package:expandable/expandable.dart';
import 'package:groovr/models/controllers.dart';
import 'package:provider/provider.dart';

class MenuOption extends StatelessWidget {
  final String title;
  final List<String> options;
  final String selectedOption;
  final Function updateSelectedOption;
  final Function setController;

  MenuOption({
    @required this.title,
    @required this.options,
    @required this.selectedOption,
    @required this.updateSelectedOption,
    @required this.setController,
  });

  @override
  Widget build(BuildContext context) {
    ExpandableController controller;

    buildHeaderCollapsed() {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              selectedOption,
              style: kBody1Bold,
            ),
          ],
        ),
      );
    }

    buildOptions() {
      List<Widget> optionsList = [];

      optionsList.add(SizedBox(height: 20));

      for (var option in options) {
        optionsList.add(
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              updateSelectedOption(option);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(
                option,
                softWrap: true,
                style: option == selectedOption ? kBody1Bold : kBody1,
              ),
            ),
          ),
        );
      }

      optionsList.add(SizedBox(height: 20));

      return optionsList;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Provider.of<Controllers>(context, listen: false)
                  .toggleMenu(controller);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Transform.translate(
                offset: Offset(0, 4.7),
                child: Text(
                  title,
                  style: kH2Bold,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: ExpandableNotifier(
            child: ScrollOnExpand(
              scrollOnCollapse: false,
              child: Builder(
                builder: (context) {
                  controller = ExpandableController.of(context);
                  setController(controller);

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          Provider.of<Controllers>(context, listen: false)
                              .toggleMenu(controller);
                        },
                        child: Expandable(
                          collapsed: buildHeaderCollapsed(),
                        ),
                      ),
                      Expandable(
                        expanded: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: buildOptions(),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
