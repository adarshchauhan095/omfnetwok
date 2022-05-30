// coverage:ignore-file

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omf_netflix/app/app.dart';

/// A chunk of styles used in the application.
/// Will be ignored for test since all are static values and would not change.
abstract class Styles {
  static TextStyle boldPrimary16 = GoogleFonts.lato(
    fontWeight: FontWeight.w600,
    color: ColorsValue.primaryTextColor,
    fontSize: Dimens.sixteen,
  );

  static TextStyle primaryText20 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.primaryTextColor,
    fontSize: Dimens.twenty,
  );

  static TextStyle primary10 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.primaryColor,
    fontSize: Dimens.ten,
  );

  static TextStyle primaryText23 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.primaryTextColor,
    fontSize: Dimens.twentyThree,
  );

  static TextStyle boldPrimaryTextOswald30 = TextStyle(
    fontFamily: 'Oswald',
    fontWeight: FontWeight.bold,
    color: ColorsValue.primaryTextColor,
    fontSize: Dimens.thirtyFive,
  );

  static TextStyle primaryText18 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.primaryTextColor,
    fontSize: Dimens.eighteen,
  );

  static TextStyle boldPrimaryText20 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.primaryTextColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.twenty,
  );

  static TextStyle primary13 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.primaryColor,
    fontSize: Dimens.thirteen,
  );

  static TextStyle primaryText10 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.primaryTextColor,
    fontSize: Dimens.ten,
  );

  static TextStyle footerColor11 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.footerContentColor,
    fontSize: Dimens.eleven,
  );

  static TextStyle footerColor8 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.footerContentColor,
    fontSize: Dimens.eight,
  );

  static TextStyle grey10 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.iconColor,
    fontSize: Dimens.ten,
  );

  static TextStyle grey13 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.iconColor,
    fontSize: Dimens.thirteen,
  );

  static TextStyle grey14 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.greyLightColor,
    fontSize: Dimens.fourteen,
  );

  static TextStyle primary15 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.primaryColor,
    fontSize: Dimens.fifteen,
  );

  static TextStyle primary15Underlined = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.primaryColor,
    decoration: TextDecoration.underline,
    fontSize: Dimens.fifteen,
  );

  static TextStyle primary18 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.primaryColor,
    fontSize: Dimens.eighteen,
  );

  static TextStyle black15 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.blackColor,
    fontSize: Dimens.fifteen,
  );

  static TextStyle primaryText15 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.primaryTextColor,
    fontSize: Dimens.fifteen,
  );

  static TextStyle primaryText16 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.primaryTextColor,
    fontSize: Dimens.sixteen,
  );

  static TextStyle primaryText17 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.primaryTextColor,
    fontSize: Dimens.seventeen,
  );

  static TextStyle boldPrimaryText22 = TextStyle(
    fontFamily: 'Product-Sans',
    fontWeight: FontWeight.bold,
    color: ColorsValue.primaryTextColor,
    fontSize: Dimens.twentyTwo,
  );

  static TextStyle primary14 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.primaryColor,
    fontSize: Dimens.fourteen,
  );

  static TextStyle footerColor14 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.footerContentColor,
    fontSize: Dimens.fourteen,
  );

  static TextStyle primaryText14 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.primaryTextColor,
    fontSize: Dimens.fourteen,
  );

  static TextStyle black14 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.blackColor,
    fontSize: Dimens.fourteen,
  );

  static TextStyle black12 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.blackColor,
    fontSize: Dimens.twelve,
  );

  static TextStyle greyLight15 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.greyLightColor,
    fontSize: Dimens.fifteen,
  );

  static TextStyle secondaryText11 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.secondaryTextColor,
    fontSize: Dimens.eleven,
  );

  static TextStyle secondaryText12 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.secondaryTextColor,
    fontSize: Dimens.twelve,
  );
  static TextStyle secondaryText12LineThrough = TextStyle(
      fontFamily: 'Product-Sans',
      color: ColorsValue.secondaryTextColor,
      fontSize: Dimens.twelve,
      decoration: TextDecoration.lineThrough);

  static TextStyle secondaryText13 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.secondaryTextColor,
    fontSize: Dimens.thirteen,
  );

  static TextStyle secondaryText14 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.secondaryTextColor,
    fontSize: Dimens.fourteen,
  );

  static TextStyle secondaryText15 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.secondaryTextColor,
    fontSize: Dimens.fifteen,
  );

  static TextStyle secondaryText18 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.secondaryTextColor,
    fontSize: Dimens.eighteen,
  );

  static TextStyle boldSecondaryText16 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.secondaryTextColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.sixteen,
  );

  static TextStyle boldSecondaryText12 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.secondaryTextColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.twelve,
  );

  static TextStyle primaryText13 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.primaryTextColor,
    fontSize: Dimens.thirteen,
  );

  static TextStyle primaryText13Underlined = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.primaryTextColor,
    decoration: TextDecoration.underline,
    fontSize: Dimens.thirteen,
  );

  static TextStyle primaryText11 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.primaryTextColor,
    fontSize: Dimens.eleven,
  );
  static TextStyle primaryText12 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.primaryTextColor,
    fontSize: Dimens.twelve,
  );

  static TextStyle primary12 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.primaryColor,
    fontSize: Dimens.twelve,
  );

  static TextStyle primary11 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.primaryColor,
    fontSize: Dimens.eleven,
  );

  static TextStyle boldPrimary11 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.primaryColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.eleven,
  );

  static TextStyle boldPrimaryText11 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.whiteColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.eleven,
  );

  static TextStyle primary12Underlinded = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.primaryColor,
    decoration: TextDecoration.underline,
    fontSize: Dimens.twelve,
  );

  static TextStyle red12 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.redColor,
    fontSize: Dimens.twelve,
  );

  static TextStyle red15 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.redColor,
    fontSize: Dimens.fifteen,
  );

  static TextStyle white14 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.whiteColor,
    fontSize: Dimens.fourteen,
  );

  static TextStyle white12 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.whiteColor,
    fontSize: Dimens.twelve,
  );

  static TextStyle primaryBold16 = TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'Product-Sans',
    color: ColorsValue.primaryColor,
    fontSize: Dimens.sixteen,
  );

  static TextStyle red16 = TextStyle(
    fontFamily: 'Product-Sans',
    color: ColorsValue.redColor,
    fontSize: Dimens.sixteen,
  );
}
