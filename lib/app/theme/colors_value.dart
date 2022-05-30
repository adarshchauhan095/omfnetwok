// coverage:ignore-file

import 'package:flutter/material.dart';

/// A list of custom color used in the application.
///
/// Will be ignored for test since all are static values and would not change.
abstract class ColorsValue {
  static const Color primaryColor = Color(
    primaryColorHex,
  );

  static const Color blackColor = Color(
    blackColorHex,
  );

  static const Color whiteColor = Color(
    whiteColorHex,
  );

  static const Color scaffoldBackgroundColor = Color(
    scaffoldBackgroundColorHex,
  );

  static const Color secondaryTextColor = Color(
    secondaryTextColorHex,
  );

  static const Color primaryTextColor = Color(
    primaryTextColorHex,
  );

  static const Color facebookButtonColor = Color(
    facebookButtonColorHex,
  );

  static const Color greyColor = Color(
    greyColorHex,
  );

  static const Color greyLightColor = Color(
    greyLightColorHex,
  );

  static const Color errorColor = Color(
    errorColorHex,
  );

  static const Color greyBoxColor = Color(
    greyBoxColorHex,
  );

  static const Color iconColor = Color(
    iconColorHex,
  );

  static const Color greyBorderColor = Color(
    greyBorderColorHex,
  );

  static const Color redColor = Color(
    redColorHex,
  );

  static const Color greenColor = Color(
    greenColorHex,
  );

  static const Color transparent = Color(
    transparentHex,
  );

  static const Color footerContentColor = Color(
    footerContentColorHex,
  );

  static const int greenColorHex = 0xff009944;

  static const int scaffoldBackgroundColorHex = 0xff000000;

  static const int primaryColorHex = 0xff1459E3;

  static const int blackColorHex = 0xff000000;

  static const int whiteColorHex = 0xffffffff;

  static const int secondaryTextColorHex = 0xff535353;

  static const int iconColorHex = 0xff606060;

  static const int primaryTextColorHex = 0xffffffff;

  static const int facebookButtonColorHex = 0xff3B5998;

  static const int greyColorHex = 0xff363636;

  static const int greyLightColorHex = 0xffc0c0c0;

  static const int errorColorHex = 0xffff0000;

  static const int greyBoxColorHex = 0xff1C1C1C;

  static const int greyBorderColorHex = 0xff222222;

  static const int redColorHex = 0xffFF0000;

  static const int transparentHex = 0x00ffffff;

  static const int footerContentColorHex = 0xff818081;
}
