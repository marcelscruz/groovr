import 'package:flutter/material.dart';
import 'package:groovr/constants.dart';

class Playground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kBlack,
      ),
      child: Text(
        'Playground here',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
