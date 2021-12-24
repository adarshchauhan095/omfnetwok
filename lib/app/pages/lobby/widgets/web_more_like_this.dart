import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:omf_netflix/app/app.dart';

class WebMoreLikeThis extends StatelessWidget {
  const WebMoreLikeThis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: Dimens.edgeInsets15_0_15_0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringConstants.moreLikeThis,
              style: Styles.primaryText16,
            ),
            Dimens.boxHeight20,
            StaggeredGridView.countBuilder(
              controller: ScrollController(),
              shrinkWrap: true,
              crossAxisCount: Responsive.isWeb(context)
                  ? 3
                  : Responsive.isTablet(context)
                      ? 2
                      : 1,
              itemCount: 5,
              staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
              mainAxisSpacing: Dimens.twenty,
              crossAxisSpacing: Dimens.twenty,
              itemBuilder: (context, index) => Container(
                // height: Dimens.threeHundred,
                constraints: const BoxConstraints(
                  maxHeight: double.infinity,
                ),
                color: ColorsValue.greyBoxColor,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: Dimens.hundredFifty,
                          color: ColorsValue.primaryColor,
                          child: Image.asset(
                            AssetConstants.movie,
                            width: double.infinity,
                            height: Dimens.hundredFifty,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: Dimens.eight,
                          right: Dimens.eight,
                          child: Text(
                            '3 Seasons',
                            style: Styles.primaryText13,
                          ),
                        ),
                      ],
                    ),
                    Dimens.boxHeight15,
                    Padding(
                      padding: Dimens.edgeInsets12_0_12_0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: Dimens.thirty,
                                height: Dimens.seventeen,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ColorsValue.whiteColor)),
                                child: Text(
                                  '18+',
                                  textAlign: TextAlign.center,
                                  style: Styles.primaryText14,
                                ),
                              ),
                              Dimens.boxWidth4,
                              Text(
                                '2014',
                                style: Styles.primaryText14,
                              ),
                            ],
                          ),
                          Container(
                            width: Dimens.thirtyFive,
                            height: Dimens.thirtyFive,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimens.thirtyFive),
                              border: Border.all(color: ColorsValue.whiteColor),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: ColorsValue.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Dimens.boxHeight15,
                    Padding(
                      padding: Dimens.edgeInsets12_0_12_0,
                      child: Text(
                        StringConstants.loremIpsum,
                        style: Styles.primaryText14,
                      ),
                    ),
                    Dimens.boxHeight15,
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
