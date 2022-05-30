import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

class DeviceLogWidget extends StatelessWidget {
  const DeviceLogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: [
                Dimens.boxHeight20,
                Padding(
                  padding: Dimens.edgeInsets15_0_15_0,
                  child: Text(
                    'whereYoureSignedIn'.tr,
                    style: Styles.primaryText20,
                  ),
                ),
                Dimens.boxHeight4,
                Padding(
                  padding: Dimens.edgeInsets15_0_15_0,
                  child: Text(
                    'deviceLogInfo'.tr,
                    style: Styles.secondaryText13,
                  ),
                ),
                Dimens.boxHeight20,
                Padding(
                  padding: Dimens.edgeInsets15_0_15_0,
                  child: Row(
                    children: [
                      CircleImageAvatar(
                        borderRadius: Dimens.zero,
                        borderColor: ColorsValue.greyBoxColor,
                        width: Dimens.eighty,
                        height: Dimens.eighty,
                        color: ColorsValue.greyBoxColor,
                        borderWidth: Dimens.zero,
                        child: Icon(
                          Icons.smartphone,
                          color: ColorsValue.greyLightColor,
                          size: Dimens.twentyFive,
                        ),
                      ),
                      Dimens.boxWidth10,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Iphone 11 (Safari Browser)',
                            style: Styles.primaryText13,
                          ),
                          Dimens.boxHeight5,
                          Text(
                            'Delhi',
                            style: Styles.grey13,
                          ),
                          Text(
                            'Yesterday, 11:00 Am (11 Hours Ago)',
                            style: Styles.grey13,
                          ),
                          Dimens.boxHeight5,
                          Row(
                            children: [
                              CircleImageAvatar(
                                borderRadius: Dimens.fifty,
                                borderColor: ColorsValue.greenColor,
                                borderWidth: Dimens.zero,
                                width: Dimens.fifteen,
                                height: Dimens.fifteen,
                                color: ColorsValue.greenColor,
                                child: Icon(
                                  Icons.check,
                                  size: Dimens.twelve,
                                  color: ColorsValue.whiteColor,
                                ),
                              ),
                              Dimens.boxWidth5,
                              Text(
                                'thisDevice'.tr,
                                style: Styles.primaryText13,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Dimens.boxHeight10,
                Padding(
                  padding: Dimens.edgeInsets15_0_15_0,
                  child: Row(
                    children: [
                      CircleImageAvatar(
                        borderRadius: Dimens.zero,
                        borderColor: ColorsValue.greyBoxColor,
                        width: Dimens.eighty,
                        height: Dimens.eighty,
                        color: ColorsValue.greyBoxColor,
                        borderWidth: Dimens.zero,
                        child: Icon(
                          Icons.smartphone,
                          color: ColorsValue.greyLightColor,
                          size: Dimens.twentyFive,
                        ),
                      ),
                      Dimens.boxWidth10,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Iphone 11 (Safari Browser)',
                            style: Styles.primaryText13,
                          ),
                          Dimens.boxHeight5,
                          Text(
                            'Delhi',
                            style: Styles.grey13,
                          ),
                          Text(
                            'Yesterday, 11:00 Am (11 Hours Ago)',
                            style: Styles.grey13,
                          ),
                          Dimens.boxHeight5,
                          Row(
                            children: [
                              0 == 0
                                  ? Dimens.box0
                                  : CircleImageAvatar(
                                      borderRadius: Dimens.fifty,
                                      borderColor: ColorsValue.greenColor,
                                      borderWidth: Dimens.zero,
                                      width: Dimens.fifteen,
                                      height: Dimens.fifteen,
                                      color: ColorsValue.greenColor,
                                      child: Icon(
                                        Icons.check,
                                        size: Dimens.twelve,
                                        color: ColorsValue.whiteColor,
                                      ),
                                    ),
                              0 == 0 ? Dimens.box0 : Dimens.boxWidth5,
                              Text(
                                0 == 0 ? 'logout'.tr : 'thisDevice'.tr,
                                style: 0 == 0
                                    ? Styles.red12
                                    : Styles.primaryText13,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: Dimens.edgeInsets15_0_15_0,
              child: Text(
                'logoutFromAllDevices'.tr,
                style: Styles.primaryBold16,
              ),
            ),
          ),
          Dimens.boxHeight30,
        ],
      );
}
