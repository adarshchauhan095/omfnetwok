import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

class WebMainViewHeading extends StatelessWidget {
  const WebMainViewHeading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Positioned(
        bottom: Responsive.isTablet(context)
            ? Dimens.percentHeight(Dimens.pointTwoStatic)
            : Dimens.percentHeight(Dimens.pointTwoFiveStatic),
        child: Padding(
          padding: Dimens.edgeInsets35_0_15_0,
          child: Container(
            width: Responsive.isWeb(context)
                ? Dimens.percentWidth(Dimens.pointTwoStatic)
                : Responsive.isTablet(context)
                    ? Dimens.percentWidth(Dimens.pointFiveStatic)
                    : Dimens.percentWidth(Dimens.pointOneStatic),
            constraints: BoxConstraints(
              maxHeight: Get.height,
            ),
            child: Text(
              StringConstants.addidasMensTrainer,
              style: Styles.boldPrimaryTextOswald30,
            ),
          ),
        ),
      );
}
