import 'package:flutter/material.dart';
import 'package:groovr/constants.dart';
import 'package:groovr/widgets/menu_option.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        decoration: BoxDecoration(
          color: kGreyBackground,
          border: Border(
            top: BorderSide(
              color: kGreyBorder1,
              width: 1,
            ),
          ),
        ),
        child: Column(
          children: <Widget>[
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                // menuOption.getController();
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text(
                      'GENRE',
                      style: kH2Bold,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: MenuOption(),
                  ),
                ],
              ),
            ),
            Divider(
              color: kGreyBorder2,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
