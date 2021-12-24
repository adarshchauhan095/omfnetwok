import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

class SearchSuggestionItemDialogContent extends StatelessWidget {
  const SearchSuggestionItemDialogContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: Dimens.twoHundredFifty,
        width: Responsive.isWeb(context) || Responsive.isTablet(context)
            ? Dimens.fourHundred
            : double.infinity,
        color: ColorsValue.greyBoxColor,
        child: Column(
          children: [
            Padding(
              padding: Dimens.edgeInsets15_11_15_11,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: Dimens.eighty,
                        height: Dimens.hundredEight,
                        child: Image.asset(AssetConstants.mainpage,
                            fit: BoxFit.cover),
                      ),
                      Dimens.boxWidth10,
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  StringConstants.shows,
                                  style: Styles.primaryText15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.back<void>();
                                  },
                                  child: Icon(
                                    Icons.cancel_outlined,
                                    size: Dimens.twentyFive,
                                    color: ColorsValue.whiteColor,
                                  ),
                                )
                              ],
                            ),
                            Dimens.boxHeight5,
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    '2021',
                                    style: Styles.secondaryText13,
                                  ),
                                  Dimens.boxWidth3,
                                  Icon(
                                    Icons.circle,
                                    size: Dimens.four,
                                    color: ColorsValue.secondaryTextColor,
                                  ),
                                  Dimens.boxWidth3,
                                  Text(
                                    '5 ${StringConstants.part}',
                                    style: Styles.secondaryText13,
                                  ),
                                ],
                              ),
                            ),
                            Dimens.boxHeight5,
                            Text(
                              StringConstants.loremIpsum,
                              style: Styles.primaryText11,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Dimens.boxHeight10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PlayButton(
                        buttonColor: ColorsValue.primaryColor,
                        color: ColorsValue.whiteColor,
                      ),
                      PlayListIconButton(
                          iconWidget: Image.asset(
                            AssetConstants.myList,
                            height: Dimens.seventeen,
                          ),
                          fontSize: Dimens.twelve,
                          title: StringConstants.myList),
                      PlayListIconButton(
                          iconWidget: Image.asset(
                            AssetConstants.unlike,
                            height: Dimens.twenty,
                          ),
                          fontSize: Dimens.twelve,
                          title: StringConstants.like),
                      PlayListIconButton(
                          iconWidget: Image.asset(
                            AssetConstants.download,
                            height: Dimens.twenty,
                          ),
                          fontSize: Dimens.twelve,
                          title: StringConstants.download),
                      PlayListIconButton(
                          iconWidget: Icon(
                            Icons.play_arrow_outlined,
                            size: Dimens.twentyFive,
                            color: ColorsValue.whiteColor,
                          ),
                          fontSize: Dimens.twelve,
                          title: StringConstants.trailer),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              color: ColorsValue.greyColor,
            ),
            Dimens.boxHeight5,
            Padding(
              padding: Dimens.edgeInsets15_0_15_0,
              child: Row(
                children: [
                  const Icon(
                    Icons.info_outline,
                    color: ColorsValue.whiteColor,
                  ),
                  Dimens.boxWidth5,
                  Text(
                    StringConstants.episodesAndInfo,
                    style: Styles.primaryText13,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.keyboard_arrow_right_outlined,
                    color: ColorsValue.whiteColor,
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
