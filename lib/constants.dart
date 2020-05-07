import 'package:flutter/material.dart';

const kGrey1 = Color(0xFFBFBFBF);
const kGrey2 = Color(0xFF8F9090);
const kGreyBackground = Color(0xFF151515);
// const kGreyBorder = Color(0xFF394041);
const kGreyBorder1 = Color(0xFF1F1F1F);
const kGreyBorder2 = Color(0xFF191919);
const kGreySeparator = Color(0xFF363838);
const kYellow = Color(0xFFF0A500);
const kWhite = Color(0xFFFFFFFF);
const kBlack = Color(0xFF000000);

final BorderRadiusGeometry kPanelBorderRadius = BorderRadius.only(
  topLeft: Radius.circular(30.0),
  topRight: Radius.circular(30.0),
  bottomLeft: Radius.circular(30.0),
  bottomRight: Radius.circular(30.0),
);

const kBody1 = TextStyle(
  color: kGrey2,
  fontWeight: FontWeight.w300,
  fontFamily: 'Montserrat',
  letterSpacing: 0.8,
  fontSize: 16.0,
);

const kBody1Bold = TextStyle(
  color: kWhite,
  fontWeight: FontWeight.w600,
  fontFamily: 'Montserrat',
  letterSpacing: 0.8,
  fontSize: 16.0,
);

const kH2Bold = TextStyle(
  color: kGrey2,
  fontWeight: FontWeight.w600,
  fontFamily: 'Montserrat',
  letterSpacing: 0.5,
  fontSize: 12.0,
);

const kH3Left = TextStyle(
  color: kGrey1,
  fontWeight: FontWeight.w600,
  fontFamily: 'Montserrat',
  letterSpacing: 0.5,
  fontSize: 10.0,
);

const kBody2 = TextStyle(
  color: kGrey2,
  fontWeight: FontWeight.w300,
  fontFamily: 'Montserrat',
  letterSpacing: 0.5,
  fontSize: 12.0,
);
