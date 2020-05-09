import 'package:flutter/material.dart';
import 'package:groovr/utils/constants.dart';
import 'package:groovr/models/configuration.dart';
import 'package:groovr/models/controllers.dart';
import 'package:groovr/widgets/menu_option.dart';
import 'package:provider/provider.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
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
            MenuOption(
              title: 'GENRE',
              options:
                  Provider.of<Configuration>(context, listen: false).genres,
              selectedOption: Provider.of<Configuration>(context).selectedGenre,
              updateSelectedOption:
                  Provider.of<Configuration>(context, listen: false)
                      .updateSelectedGenre,
              setController: Provider.of<Controllers>(context, listen: false)
                  .setGenreController,
            ),
            buildDivider(),
            MenuOption(
              title: 'KEY',
              options: Provider.of<Configuration>(context, listen: false).keys,
              selectedOption: Provider.of<Configuration>(context).selectedKey,
              updateSelectedOption:
                  Provider.of<Configuration>(context, listen: false)
                      .updateSelectedKey,
              setController: Provider.of<Controllers>(context, listen: false)
                  .setKeyController,
            ),
            buildDivider(),
            MenuOption(
              title: 'SCALE',
              options:
                  Provider.of<Configuration>(context, listen: false).scales,
              selectedOption: Provider.of<Configuration>(context).selectedScale,
              updateSelectedOption:
                  Provider.of<Configuration>(context, listen: false)
                      .updateSelectedScale,
              setController: Provider.of<Controllers>(context, listen: false)
                  .setSaleController,
            ),
          ],
        ),
      ),
    );
  }
}
