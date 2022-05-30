import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:omf_netflix/domain/models/models.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

/// Small Picture list of movies widget as [MovieListRow].
class MovieListRow extends StatelessWidget {
  MovieListRow(
      {Key? key,
      this.categoryIndex,
      required this.moviesSubCategory,
      this.viewType,
      this.controller,
      this.positionsListener})
      : super(key: key);
  final int? categoryIndex;
  final List<MoviesSubCategory> moviesSubCategory;
  final MovieCategoryType? viewType;
  final ItemScrollController? controller;
  final ItemPositionsListener? positionsListener;

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (_controller) => Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: Responsive.isWeb(context) || Responsive.isTablet(context)
                ? Dimens.edgeInsets35_0_15_0Minus12
                : Dimens.edgeInsets16_0_16_0,
            child: SizedBox(
              height: viewType == MovieCategoryType.movie
                  ? Dimens.hundredFourtyEight
                  : viewType == MovieCategoryType.omfseries
                      ? Dimens.threeHundredTwentyEight
                      : Dimens.hundredEightyEight,
              child: Stack(
                children: [
                  Padding(
                    padding: kIsWeb
                        ? Dimens.edgeInsets12_0_12_0
                        : Dimens.edgeInsets0,
                    child: ScrollablePositionedList.separated(
                      itemScrollController: controller,
                      itemPositionsListener: positionsListener,
                      itemCount: _controller
                          .categoryList[categoryIndex!].subCategory!.length,
                      physics: const AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          _controller.movieTypeListView(
                              subIndex: index,
                              subCategory: moviesSubCategory,
                              type: viewType),
                      separatorBuilder: (context, index) => Dimens.boxWidth15,
                    ),

                    // child: ListView.separated(
                    //   itemBuilder: (context, index) =>
                    //       ,
                    //   physics: const AlwaysScrollableScrollPhysics(),
                    //   scrollDirection: Axis.horizontal,
                    //   shrinkWrap: true,
                    //   separatorBuilder: (context, index) => Dimens.boxWidth15,
                    //   itemCount: moviesSubCategory.length,
                    // ),
                  ),
                  Responsive.isWeb(context) || Responsive.isTablet(context)
                      ? Align(
                          alignment: Alignment.centerLeft,
                          child: CircularIndicatorButton(
                            buttonIndicator: ButtonIndicator.left,
                            onTap: () {
                              _controller.scrollToPrevious(categoryIndex!);
                            },
                          ),
                        )
                      : Dimens.box0,
                  Responsive.isWeb(context) || Responsive.isTablet(context)
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: CircularIndicatorButton(
                            buttonIndicator: ButtonIndicator.right,
                            onTap: () {
                              _controller.scrollToNext(categoryIndex!);
                            },
                          ),
                        )
                      : Dimens.box0,
                ],
              ),// ),
            ),
          ),
        ),
      );
}
