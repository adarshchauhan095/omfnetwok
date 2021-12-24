import 'package:flutter/material.dart';
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
                    StringConstants.reportAProblem,
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
                StringConstants.about,
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
                    StringConstants.privacy,
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
                    StringConstants.termsAndCondition,
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
                    StringConstants.deactivateAccount,
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
