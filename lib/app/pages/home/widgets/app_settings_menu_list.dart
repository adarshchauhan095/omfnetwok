import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

class AppSettingsMenuList extends StatelessWidget {
  const AppSettingsMenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          SizedBox(
            height: Dimens.fourtyEight,
            child: Card(
              elevation: Dimens.zero,
              color: ColorsValue.greyBoxColor,
              child: Row(
                children: [
                  Dimens.boxWidth10,
                  Text(
                    'reportAProblem'.tr,
                    style: Styles.primaryText12,
                  ),
                  const Spacer(),
                  Padding(
                    padding: Dimens.edgeInsets5_0_5_0,
                    child: const Icon(
                      Icons.keyboard_arrow_right,
                      color: ColorsValue.greyLightColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Dimens.boxHeight10,
          Padding(
            padding: Dimens.edgeInsets5_0_0_0,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'about'.tr,
                style: Styles.primaryText12,
              ),
            ),
          ),
          Dimens.boxHeight5,
          SizedBox(
            height: Dimens.fourtyEight,
            child: Card(
              elevation: Dimens.zero,
              color: ColorsValue.greyBoxColor,
              child: Row(
                children: [
                  Dimens.boxWidth10,
                  Text(
                    'privacy'.tr,
                    style: Styles.primaryText12,
                  ),
                  const Spacer(),
                  Padding(
                    padding: Dimens.edgeInsets5_0_5_0,
                    child: const Icon(
                      Icons.keyboard_arrow_right,
                      color: ColorsValue.greyLightColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: Dimens.fourtyEight,
            child: Card(
              elevation: Dimens.zero,
              color: ColorsValue.greyBoxColor,
              child: Row(
                children: [
                  Dimens.boxWidth10,
                  Text(
                    'termsAndCondition'.tr,
                    style: Styles.primaryText12,
                  ),
                  const Spacer(),
                  Padding(
                    padding: Dimens.edgeInsets5_0_5_0,
                    child: const Icon(
                      Icons.keyboard_arrow_right,
                      color: ColorsValue.greyLightColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: Dimens.fourtyEight,
            child: Card(
              elevation: Dimens.zero,
              color: ColorsValue.greyBoxColor,
              child: Row(
                children: [
                  Dimens.boxWidth10,
                  Text(
                    'deactivateAccount'.tr,
                    style: Styles.primaryText12,
                  ),
                  const Spacer(),
                  Padding(
                    padding: Dimens.edgeInsets5_0_5_0,
                    child: const Icon(
                      Icons.keyboard_arrow_right,
                      color: ColorsValue.greyLightColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}
