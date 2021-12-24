import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:share/share.dart';

class LobbySocialRow extends StatelessWidget {
  const LobbySocialRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<LobbyController>(
        builder: (_controller) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Get.find<HomeController>().pageIndex == 2
                ? PlayListIconButton(
                    onTap: () {},
                    iconWidget: Image.asset(
                      AssetConstants.circleProduct,
                      height: Dimens.twentyFive,
                      color: _controller.isMyListed
                          ? ColorsValue.primaryColor
                          : ColorsValue.whiteColor,
                    ),
                    fontSize: Dimens.twelve,
                    textColor: _controller.isMyListed
                        ? ColorsValue.primaryColor
                        : ColorsValue.whiteColor,
                    title: StringConstants.products,
                  )
                : PlayListIconButton(
                    onTap: _controller.addToMylist,
                    iconWidget: Image.asset(
                      AssetConstants.myList,
                      height: Dimens.seventeen,
                      color: _controller.isMyListed
                          ? ColorsValue.primaryColor
                          : ColorsValue.whiteColor,
                    ),
                    fontSize: Dimens.twelve,
                    textColor: _controller.isMyListed
                        ? ColorsValue.primaryColor
                        : ColorsValue.whiteColor,
                    title: StringConstants.myList,
                  ),
            Responsive.isWeb(context) || Responsive.isTablet(context)
                ? Dimens.boxWidth50
                : Dimens.box0,
            PlayListIconButton(
              onTap: _controller.makeFavorite,
              iconWidget: Image.asset(
                AssetConstants.unlike,
                height: Dimens.twenty,
                color: _controller.isLiked
                    ? ColorsValue.primaryColor
                    : ColorsValue.whiteColor,
              ),
              fontSize: Dimens.twelve,
              textColor: _controller.isLiked
                  ? ColorsValue.primaryColor
                  : ColorsValue.whiteColor,
              title: StringConstants.like,
            ),
            Responsive.isWeb(context) || Responsive.isTablet(context)
                ? Dimens.boxWidth50
                : Dimens.box0,
            Get.find<HomeController>().pageIndex == 2
                ? PlayListIconButton(
                    onTap: _controller.addToMylist,
                    iconWidget: Image.asset(
                      AssetConstants.myList,
                      height: Dimens.seventeen,
                      color: _controller.isMyListed
                          ? ColorsValue.primaryColor
                          : ColorsValue.whiteColor,
                    ),
                    fontSize: Dimens.twelve,
                    textColor: _controller.isMyListed
                        ? ColorsValue.primaryColor
                        : ColorsValue.whiteColor,
                    title: StringConstants.myList,
                  )
                : PlayListIconButton(
                    onTap: () {
                      if (Responsive.isMobile(context)) {
                        RouteManagement.goToComment();
                      } else {
                        _controller.goToCommentBoxOnDialog();
                      }
                    },
                    iconWidget: Image.asset(
                      AssetConstants.comment,
                      height: Dimens.twenty,
                    ),
                    fontSize: Dimens.twelve,
                    title: StringConstants.comment,
                  ),
            Responsive.isWeb(context) || Responsive.isTablet(context)
                ? Dimens.boxWidth50
                : Dimens.box0,
            PlayListIconButton(
              onTap: () {
                Share.share(AssetConstants.movieLink);
              },
              iconWidget: Image.asset(
                AssetConstants.share,
                height: Dimens.twenty,
              ),
              fontSize: Dimens.twelve,
              title: StringConstants.share,
            ),
          ],
        ),
      );
}
