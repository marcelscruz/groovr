import 'package:flutter/material.dart';
import 'package:groovr/constants.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: kGreyBackground,
          border: Border(
            top: BorderSide(
              color: kGreyBorder,
              width: 1,
            ),
          ),
        ),
        child: Text('hey'),
      ),
    );
  }
}
