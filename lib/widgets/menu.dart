import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:groovr/constants.dart';
import 'package:groovr/models/configuration.dart';
import 'package:groovr/widgets/menu_option.dart';
import 'package:provider/provider.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  ExpandableController _genreController;
  ExpandableController _keyController;
  ExpandableController _scaleController;

  ExpandableController lastExpanded;

  void setGenreController(controller) {
    _genreController = controller;
  }

  void setKeyController(controller) {
    _keyController = controller;
  }

  void setScaleController(controller) {
    _scaleController = controller;
  }

  void collapseMenus() {
    _genreController.expanded = false;
    _keyController.expanded = false;
    _scaleController.expanded = false;
  }

  void toggle(menu) {
    collapseMenus();

    if (lastExpanded == menu) {
      lastExpanded = null;
    } else {
      lastExpanded = menu;
      menu.toggle();
    }
  }

  Widget buildDivider() {
    return Divider(
      color: kGreyBorder2,
      thickness: 1,
      height: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          color: kGreyBackground,
          border: Border(
            top: BorderSide(
              color: kGreyBorder1,
              width: 1,
            ),
          ),
        ),
        child: ListView(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      toggle(_genreController);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: Transform.translate(
                        offset: Offset(0, 2),
                        child: Text(
                          'GENRE',
                          style: kH2Bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: MenuOption(
                    setController: setGenreController,
                    toggle: toggle,
                    options: Provider.of<Configuration>(context).genres,
                    selectedOption:
                        Provider.of<Configuration>(context).selectedGenre,
                    updateSelectedOption:
                        Provider.of<Configuration>(context, listen: false)
                            .updateSelectedGenre,
                  ),
                ),
              ],
            ),
            buildDivider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      toggle(_keyController);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: Transform.translate(
                        offset: Offset(0, 2),
                        child: Text(
                          'KEY',
                          style: kH2Bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: MenuOption(
                    setController: setKeyController,
                    toggle: toggle,
                    options: Provider.of<Configuration>(context).keys,
                    selectedOption:
                        Provider.of<Configuration>(context).selectedKey,
                    updateSelectedOption:
                        Provider.of<Configuration>(context, listen: false)
                            .updateSelectedKey,
                  ),
                ),
              ],
            ),
            buildDivider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      toggle(_scaleController);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: Transform.translate(
                        offset: Offset(0, 2),
                        child: Text(
                          'SCALE',
                          style: kH2Bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: MenuOption(
                    setController: setScaleController,
                    toggle: toggle,
                    options: Provider.of<Configuration>(context).scales,
                    selectedOption:
                        Provider.of<Configuration>(context).selectedScale,
                    updateSelectedOption:
                        Provider.of<Configuration>(context, listen: false)
                            .updateSelectedScale,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
