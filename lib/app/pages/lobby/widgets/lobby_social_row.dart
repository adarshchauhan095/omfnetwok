import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
              onTap: () {
                Get.bottomSheet<dynamic>(
                  Container(
                    color: ColorsValue.blackColor.withOpacity(0.8),
                    height: Dimens.threeHundred,
                    child: Padding(
                      padding: Dimens.edgeInsets40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleImageAvatar(
                                onTap: () {
                                  _controller.makeFavorite(true);
                                  Get.back<void>();
                                },
                                borderRadius: Dimens.fifty,
                                width: Dimens.seventy,
                                height: Dimens.seventy,
                                borderColor: ColorsValue.greyLightColor,
                                color: ColorsValue.greyColor,
                                child: Center(
                                  child: Image.asset(
                                    AssetConstants.likeBlue,
                                    width: Dimens.thirtyFive,
                                    height: Dimens.thirtyFive,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                              Dimens.boxWidth15,
                              CircleImageAvatar(
                                onTap: () {
                                  _controller.makeFavorite(false);
                                  Get.back<void>();
                                },
                                borderRadius: Dimens.fifty,
                                width: Dimens.seventy,
                                height: Dimens.seventy,
                                borderColor: ColorsValue.greyLightColor,
                                color: ColorsValue.greyColor,
                                child: Center(
                                  child: Image.asset(
                                    AssetConstants.like,
                                    width: Dimens.thirtyFive,
                                    height: Dimens.thirtyFive,
                                    color: ColorsValue.redColor,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Dimens.boxHeight10,
                          Padding(
                            padding: const EdgeInsets.only(left: 55),
                            child: CircleImageAvatar(
                              onTap: Get.back<void>,
                              borderRadius: Dimens.fifty,
                              width: Dimens.fifty,
                              height: Dimens.fifty,
                              borderColor: ColorsValue.greyLightColor,
                              color: ColorsValue.greyColor,
                              child: Transform.rotate(
                                angle: 180 * math.pi / 80,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: Dimens.thirty,
                                  ),
                                  onPressed: null,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
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
                Get.bottomSheet<dynamic>(
                  Container(
                    height: Dimens.fourHundred,
                    color: ColorsValue.blackColor.withOpacity(0.8),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Dimens.boxHeight30,
                          Text(
                            'Share to...',
                            style: Styles.greyLight15,
                          ),
                          Dimens.boxHeight20,
                          GestureDetector(
                            onTap: () {
                              Share.share(AssetConstants.movieLink);
                              Get.back<void>();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AssetConstants.appleLogo,
                                  width: Dimens.thirtyFive,
                                  height: Dimens.thirty,
                                ),
                                Dimens.boxWidth10,
                                Text(
                                  'WhatsApp',
                                  style: Styles.primaryText18,
                                ),
                              ],
                            ),
                          ),
                          Dimens.boxHeight20,
                          GestureDetector(
                            onTap: () {
                              Share.share(AssetConstants.movieLink);
                              Get.back<void>();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AssetConstants.appleLogo,
                                  width: Dimens.thirtyFive,
                                  height: Dimens.thirty,
                                ),
                                Dimens.boxWidth10,
                                Text(
                                  'Instagram Stories',
                                  style: Styles.primaryText18,
                                ),
                              ],
                            ),
                          ),
                          Dimens.boxHeight20,
                          GestureDetector(
                            onTap: () {
                              Share.share(AssetConstants.movieLink);
                              Get.back<void>();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AssetConstants.appleLogo,
                                  width: Dimens.thirtyFive,
                                  height: Dimens.thirty,
                                ),
                                Dimens.boxWidth10,
                                Text(
                                  'Twitter',
                                  style: Styles.primaryText18,
                                ),
                              ],
                            ),
                          ),
                          Dimens.boxHeight20,
                          GestureDetector(
                            onTap: () {
                              Clipboard.setData(
                                      const ClipboardData(text: 'link'))
                                  .then((value) {
                                Get.snackbar<dynamic>('Message', 'Link copied',
                                    snackPosition: SnackPosition.TOP);
                              });
                              Get.back<void>();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AssetConstants.appleLogo,
                                  width: Dimens.thirtyFive,
                                  height: Dimens.thirty,
                                ),
                                Dimens.boxWidth10,
                                Text(
                                  'Copy link',
                                  style: Styles.primaryText18,
                                ),
                              ],
                            ),
                          ),
                          Dimens.boxHeight20,
                          GestureDetector(
                            onTap: () {
                              Share.share(AssetConstants.movieLink);
                              Get.back<void>();
                            },
                            child: Text(
                              'More options',
                              style: Styles.primaryText18,
                            ),
                          ),
                          Dimens.boxHeight20,
                          CircleImageAvatar(
                            onTap: Get.back<void>,
                            borderRadius: Dimens.fifty,
                            width: Dimens.fiftyFive,
                            height: Dimens.fiftyFive,
                            borderColor: ColorsValue.greyColor,
                            borderWidth: Dimens.zero,
                            color: ColorsValue.greyColor,
                            child: Transform.rotate(
                              angle: 180 * math.pi / 80,
                              child: IconButton(
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: Dimens.thirtyFive,
                                ),
                                onPressed: null,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
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
