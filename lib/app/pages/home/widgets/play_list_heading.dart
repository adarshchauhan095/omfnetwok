import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// Widget that is used to show Heading of Each playlist in [MainHomeView].
class PlayListHeading extends StatelessWidget {
  const PlayListHeading({Key? key, required this.heading}) : super(key: key);
  final String? heading;

  @override
  Widget build(BuildContext context) => Padding(
        padding: (Responsive.isWeb(context)) || Responsive.isTablet(context)
            ? Dimens.edgeInsets35_0_15_0
            : Dimens.edgeInsets16_0_16_0,
        child: Row(
          children: [
            Text(
              heading!,
              style: Styles.boldPrimaryText20,
            ),
            (Responsive.isWeb(context)) || Responsive.isTablet(context)
                ? Dimens.boxWidth15
                : Dimens.box0,
            (Responsive.isWeb(context)) || Responsive.isTablet(context)
                ? GestureDetector(
                    onTap: () {
                      Get.snackbar<void>('Message', '$heading',
                          backgroundColor: ColorsValue.primaryColor
                              .withOpacity(Dimens.pointFive),
                          colorText: ColorsValue.whiteColor);
                    },
                    child: Row(
                      children: [
                        Text(
                          'exploreAll'.tr,
                          style: Styles.primaryText12,
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: ColorsValue.whiteColor,
                          size: Dimens.thirteen,
                        ),
                      ],
                    ),
                  )
                : Dimens.box0
          ],
        ),
      );
}
