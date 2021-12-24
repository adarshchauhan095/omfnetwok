import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:omf_netflix/domain/domain.dart';

/// List of Continue watching and pending watching videos
/// as Season and Episodes.
class ContinuesWatching extends StatelessWidget {
  const ContinuesWatching({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (_controller) => Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: (Responsive.isWeb(context)) || Responsive.isTablet(context)
                ? Dimens.edgeInsets35_0_15_0Minus12
                : Dimens.edgeInsets16_0_16_0,
            child: SizedBox(
              height: Dimens.hundredEightyEight,
              child: Stack(
                children: [
                  Padding(
                    padding: Dimens.edgeInsets12_0_12_0,
                    child: ListView.separated(
                        physics: const AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Card(
                              clipBehavior: Clip.antiAlias,
                              color: ColorsValue.greyBoxColor,
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Opacity(
                                        opacity: 0.1,
                                        child: SizedBox(
                                          height: Dimens.hundredFiftyOne,
                                          width: Dimens.hundredSix,
                                          child: Image.asset(
                                            _controller.moviesList[index],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: Dimens.fourtyNine,
                                        left: Dimens.twentySix,
                                        child: Icon(
                                          Icons.play_circle_outline_outlined,
                                          color: ColorsValue.whiteColor,
                                          size: Dimens.fiftyFour,
                                        ),
                                      ),
                                      Positioned(
                                        top: Dimens.hundredTwenty,
                                        left: Dimens.thirtyEight,
                                        child: Text('S1:E2',
                                            style: Styles.primaryText11),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: Dimens.hundredSix,
                                    child: LinearProgressIndicator(
                                      minHeight: Dimens.two,
                                    ),
                                  ),
                                  Dimens.boxHeight3,
                                  SizedBox(
                                    width: Dimens.hundredSix,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(
                                          Icons.info_outline,
                                          color: ColorsValue.whiteColor,
                                          size: Dimens.nineteen,
                                        ),
                                        Icon(
                                          Icons.more_vert,
                                          color: ColorsValue.whiteColor,
                                          size: Dimens.nineteen,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                        separatorBuilder: (context, index) => Dimens.boxWidth15,
                        itemCount: _controller.moviesList.length),
                  ),
                  (Responsive.isWeb(context)) || Responsive.isTablet(context)
                      ? Align(
                          alignment: Alignment.centerLeft,
                          child: CircularIndicatorButton(
                            buttonIndicator: ButtonIndicator.left,
                            onTap: () {},
                          ),
                        )
                      : Dimens.box0,
                  (Responsive.isWeb(context)) || Responsive.isTablet(context)
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: CircularIndicatorButton(
                            buttonIndicator: ButtonIndicator.right,
                            onTap: () {},
                          ),
                        )
                      : Dimens.box0,
                ],
              ),
            ),
          ),
        ),
      );
}
