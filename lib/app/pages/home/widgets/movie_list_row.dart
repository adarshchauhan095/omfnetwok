import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:omf_netflix/domain/models/models.dart';

/// Small Picture list of movies widget as [MovieListRow].
class MovieListRow extends StatelessWidget {
  const MovieListRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (_controller) => Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: (Responsive.isWeb(context)) || Responsive.isTablet(context)
                ? Dimens.edgeInsets35_0_15_0Minus12
                : Dimens.edgeInsets16_0_16_0,
            child: SizedBox(
              height: Dimens.hundredFourtyEight,
              child: Stack(
                children: [
                  Padding(
                    padding: Dimens.edgeInsets12_0_12_0,
                    child: ListView.separated(
                      itemCount: _controller.moviesList.length,
                      physics: const AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Card(
                        clipBehavior: Clip.antiAlias,
                        color: ColorsValue.whiteColor,
                        child: Stack(
                          children: [
                            SizedBox(
                              height: Dimens.hundredFourtyEight,
                              width: Dimens.hundredSix,
                              child: Image.asset(
                                _controller.moviesList[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Image.asset(
                              AssetConstants.omfImage,
                              height: Dimens.thirteen,
                              width: Dimens.fiftySix,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                      separatorBuilder: (context, index) => Dimens.boxWidth15,
                    ),
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
