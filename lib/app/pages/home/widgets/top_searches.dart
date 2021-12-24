import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

class TopSearches extends StatelessWidget {
  const TopSearches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (_controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringConstants.topSearches,
              style: Styles.primaryText14,
            ),
            Dimens.boxHeight10,
            StaggeredGridView.countBuilder(
              controller: ScrollController(),
              shrinkWrap: true,
              crossAxisCount: Responsive.isWeb(context)
                  ? 3
                  : Responsive.isTablet(context)
                      ? 2
                      : 1,
              itemCount: 25,
              staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
              mainAxisSpacing: Dimens.twenty,
              crossAxisSpacing: Dimens.twenty,
              itemBuilder: (context, index) => Container(
                height: Dimens.seventy,
                color: ColorsValue.greyBoxColor,
                child: Row(
                  children: [
                    SizedBox(
                      height: Dimens.seventy,
                      width: Dimens.hundred,
                      child: Stack(
                        children: [
                          Image.asset(
                            AssetConstants.movie,
                            height: Dimens.seventy,
                            width: Dimens.hundred,
                            fit: BoxFit.cover,
                          ),
                          const Center(
                            child: Icon(
                              Icons.play_circle_outline,
                              color: ColorsValue.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: Dimens.edgeInsets14_0_0_0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                StringConstants.shoeShow,
                                style: Styles.primaryText16,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                              ),
                              Dimens.boxHeight2,
                              Text(
                                StringConstants.loremIpsumSmall,
                                style: Styles.grey13,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: Dimens.edgeInsets0_0_10_0,
                      child: Image.asset(
                        AssetConstants.add,
                        height: Dimens.eighteen,
                        width: Dimens.eighteen,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
}
