import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:groovr/constants.dart';

class MenuOption extends StatelessWidget {
  final Function setController;
  final Function toggle;
  final List<String> options;
  final String selectedOption;

  MenuOption({
    @required this.setController,
    @required this.toggle,
    @required this.options,
    @required this.selectedOption,
  });

  @override
  Widget build(BuildContext context) {
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
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
              option,
              softWrap: true,
              style: option == selectedOption ? kBody1Bold : kBody1,
            ),
          ),
        );
      }

      optionsList.add(SizedBox(height: 20));

      return optionsList;
    }

    return ExpandableNotifier(
      child: ScrollOnExpand(
        child: Builder(
          builder: (context) {
            final ExpandableController controller =
                ExpandableController.of(context);
            setController(controller);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    toggle(controller);
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
                Divider(
                  height: 1,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
