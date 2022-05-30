import 'package:chewie/chewie.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:readmore/readmore.dart';

/// [LobbyViewWidget] is main widget UI of [LobbyView] screen.
class LobbyViewWidget extends StatelessWidget {
  static const lobbyWidgetKey = Key('lobby-widget-key');
  @override
  Widget build(BuildContext context) => GetBuilder<LobbyController>(
        builder: (_controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height:
                      Responsive.isWeb(context) || Responsive.isTablet(context)
                          ? Dimens.fourHundred
                          : Dimens.twoHundred,
                  child: FutureBuilder<void>(
                    future: _controller.initializeLobbPlayer,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.none &&
                          snapshot.connectionState == ConnectionState.waiting) {
                        return Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _controller
                                    .videoPlayerInit(AssetConstants.movieLink);
                              },
                              child: Image.asset(
                                AssetConstants.movie,
                                width: double.infinity,
                                height: Responsive.isWeb(context) ||
                                        Responsive.isTablet(context)
                                    ? Dimens.fourHundred
                                    : Dimens.twoHundred,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Responsive.isWeb(context) ||
                                    Responsive.isTablet(context)
                                ? Dimens.box0
                                : GestureDetector(
                                    onTap: () {
                                      _controller.videoPlayerInit(
                                          AssetConstants.movieLink);
                                    },
                                    child: Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.play_circle_fill_outlined,
                                          color: ColorsValue.whiteColor,
                                          size: Dimens.fifty,
                                        ),
                                      ),
                                    ),
                                  ),
                            ((Responsive.isWeb(context)) ||
                                    Responsive.isTablet(context))
                                ? const WebMainViewHeading()
                                : Dimens.box0,
                          ],
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.active) {
                        return Stack(
                          children: [
                            AspectRatio(
                              aspectRatio: _controller.chewieController!
                                  .videoPlayerController.value.aspectRatio,
                              child: Chewie(
                                  controller: _controller.chewieController!),
                            ),
                          ],
                        );
                      } else {
                        return Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _controller
                                    .videoPlayerInit(AssetConstants.movieLink);
                              },
                              child: Image.asset(
                                AssetConstants.movie,
                                width: double.infinity,
                                height: Responsive.isWeb(context) ||
                                        Responsive.isTablet(context)
                                    ? Dimens.fourHundred
                                    : Dimens.twoHundred,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Responsive.isWeb(context) ||
                                    Responsive.isTablet(context)
                                ? Dimens.box0
                                : GestureDetector(
                                    onTap: () {
                                      _controller.videoPlayerInit(
                                          AssetConstants.movieLink);
                                    },
                                    child: Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.play_circle_fill_outlined,
                                          color: ColorsValue.whiteColor,
                                          size: Dimens.fifty,
                                        ),
                                      ),
                                    ),
                                  ),
                            ((Responsive.isWeb(context)) ||
                                    Responsive.isTablet(context))
                                ? const WebMainViewHeading()
                                : Dimens.box0,
                          ],
                        );
                      }
                    },
                  ),
                ),
                Responsive.isWeb(context) || Responsive.isTablet(context)
                    ? Positioned(
                        top: Dimens.twenty,
                        right: Dimens.twenty,
                        child: GestureDetector(
                          onTap: () {
                            Get.back<void>();
                          },
                          child: Icon(
                            Icons.cancel_sharp,
                            color: ColorsValue.whiteColor,
                            size: Dimens.thirty,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          Get.back<void>();
                        },
                        child: IconButton(
                          icon: Icon(
                            Icons.keyboard_arrow_left,
                            color: ColorsValue.whiteColor,
                            size: Dimens.thirty,
                          ),
                          onPressed: () {
                            Get.back<void>();
                          },
                        ),
                      ),
                Responsive.isWeb(context) || Responsive.isTablet(context)
                    ? Positioned(
                        bottom: Dimens.hundred,
                        left: Dimens.thirtyFive,
                        child: const LobbyDialogPlayButton(),
                      )
                    : Dimens.box0,
                // Responsive.isWeb(context) ||
                //         Responsive.isTablet(context) ||
                //         Responsive.isMobile(context)
                //     ? !_controller.play
                //         ? Positioned(
                //             bottom: Dimens.twentyFive,
                //             left: Responsive.isMobile(context)
                //                 ? Dimens.twenty
                //                 : Dimens.thirtyFive,
                //             child: Image.asset(
                //               AssetConstants.trailer,
                //               width: Dimens.sixty,
                //               height: Dimens.thirty,
                //             ),
                //           )
                //         : Dimens.box0
                //     : Dimens.box0,
                // Responsive.isWeb(context) ||
                //         Responsive.isTablet(context) ||
                //         Responsive.isMobile(context)
                //     ? Positioned(
                //         bottom: Dimens.twentyFive,
                //         right: Responsive.isMobile(context)
                //             ? Dimens.twenty
                //             : Dimens.thirtyFive,
                //         child: GestureDetector(
                //           onTap: () {
                //             _controller.mute();
                //           },
                //           child: Container(
                //             decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(Dimens.fifty),
                //               color: ColorsValue.blackColor
                //                   .withOpacity(Dimens.pointFiveStatic),
                //             ),
                //             width: Dimens.fifty,
                //             height: Dimens.fifty,
                //             child: Icon(
                //               _controller.volumeDown
                //                   ? Icons.volume_off
                //                   : Icons.volume_up,
                //               color: Colors.white,
                //               size: Dimens.twenty,
                //             ),
                //           ),
                //         ),
                //       )
                //     : Dimens.box0,
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  Dimens.boxHeight12,
                  Padding(
                    padding: Dimens.edgeInsets15_0_15_0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          StringConstants.inHerHouse,
                          style: Styles.primaryText20,
                        ),
                        Dimens.boxHeight8,
                        Row(
                          children: [
                            Text(
                              '2021',
                              style: Styles.secondaryText15,
                            ),
                            Dimens.boxWidth5,
                            Icon(
                              Icons.circle,
                              color: ColorsValue.iconColor,
                              size: Dimens.five,
                            ),
                            Dimens.boxWidth5,
                            Text(
                              StringConstants.fiveParts,
                              style: Styles.secondaryText15,
                            ),
                            Dimens.boxWidth5,
                            Image.asset(
                              AssetConstants.hdr,
                              height: Dimens.seventeen,
                            )
                          ],
                        ),
                        Dimens.boxHeight5,
                        Row(
                          children: [
                            Image.asset(
                              AssetConstants.topTen,
                              height: Dimens.twentySix,
                            ),
                            Dimens.boxWidth10,
                            Text(
                              StringConstants.eightInTrending,
                              style: Styles.primaryText16,
                            ),
                          ],
                        ),
                        Dimens.boxHeight15,
                        Center(
                          child: Row(
                            mainAxisAlignment: Responsive.isWeb(context) ||
                                    Responsive.isTablet(context)
                                ? MainAxisAlignment.start
                                : MainAxisAlignment.spaceBetween,
                            children: [
                              CircleImageAvatar(
                                onTap: () {},
                                borderRadius: Dimens.ten,
                                borderColor: ColorsValue.primaryColor,
                                borderWidth: Dimens.zero,
                                color: ColorsValue.primaryColor,
                                width: Dimens.hundredFifty + Dimens.ten,
                                height: Dimens.fifty,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.play_arrow,
                                      color: ColorsValue.whiteColor,
                                      size: Dimens.twentyFive,
                                    ),
                                    Dimens.boxWidth5,
                                    Text(
                                      'resume'.tr,
                                      style: Styles.primaryText16,
                                    ),
                                  ],
                                ),
                              ),
                              CircleImageAvatar(
                                onTap: () {
                                  _controller.getFile(
                                      url: AssetConstants.movieLink,
                                      fileName: 'video.mp4');
                                },
                                borderRadius: Dimens.ten,
                                borderColor: ColorsValue.whiteColor,
                                borderWidth: Dimens.two,
                                color: ColorsValue.transparent,
                                width: Dimens.hundredFifty + Dimens.ten,
                                height: Dimens.fifty,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AssetConstants.download,
                                      color: ColorsValue.whiteColor,
                                      width: Dimens.twenty,
                                    ),
                                    Dimens.boxWidth10,
                                    Text(
                                      'download'.tr,
                                      style: Styles.primaryText16,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Dimens.boxHeight20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              StringConstants.partOneEpisodeOne,
                              style: Styles.primaryText12,
                            ),
                            Text(
                              StringConstants.fourtyFiveMinutRemaining,
                              style: Styles.secondaryText11,
                            ),
                          ],
                        ),
                        Dimens.boxHeight15,
                        LinearProgressIndicator(
                          minHeight: Dimens.one,
                        ),
                        Dimens.boxHeight20,
                        Text(
                          StringConstants.loremIpsum,
                          style: Styles.primaryText14,
                        ),
                        _controller.commentBoxOnDialog
                            ? Dimens.box0
                            : Dimens.boxHeight25,
                        _controller.commentBoxOnDialog
                            ? Dimens.box0
                            : const LobbySocialRow(),
                      ],
                    ),
                  ),
                  _controller.commentBoxOnDialog
                      ? Dimens.boxHeight30
                      : Dimens.boxHeight20,
                  _controller.commentBoxOnDialog
                      ? Padding(
                          padding: Dimens.edgeInsets15_0_15_0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                StringConstants.comments,
                                style: Styles.primaryText18,
                              ),
                              Dimens.boxHeight10,
                              const Divider(color: ColorsValue.greyBorderColor),
                              Dimens.boxHeight20,
                              ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 10,
                                itemBuilder: (context, index) => Container(
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          color: ColorsValue.greyBorderColor),
                                    ),
                                  ),
                                  constraints: const BoxConstraints(
                                      maxHeight: double.infinity),
                                  child: ListView(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: Dimens.fifty,
                                            width: Dimens.fifty,
                                            child: CircularProfileAvatar(
                                              AssetConstants.avatarProfile,
                                              cacheImage: true,
                                              imageFit: BoxFit.cover,
                                              backgroundColor:
                                                  ColorsValue.greyColor,
                                              initialsText: Text(
                                                'AD',
                                                style: Styles.primaryText16,
                                              ),
                                            ),
                                          ),
                                          Dimens.boxWidth10,
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                StringConstants.testOne,
                                                style: Styles.primaryText17,
                                              ),
                                              Text(
                                                'November 2021',
                                                style: Styles.secondaryText13,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Dimens.boxHeight10,
                                      ReadMoreText(
                                        StringConstants.loremIpsum +
                                            StringConstants.loremIpsum,
                                        trimLines: 4,
                                        colorClickableText: Colors.pink,
                                        trimMode: TrimMode.Line,
                                        trimCollapsedText:
                                            StringConstants.readMore,
                                        trimExpandedText:
                                            StringConstants.showLess,
                                        style: Styles.primaryText13,
                                        lessStyle: Styles.primary13,
                                        moreStyle: Styles.primary13,
                                      ),
                                      Dimens.boxHeight15,
                                    ],
                                  ),
                                ),
                                separatorBuilder: (context, index) =>
                                    Dimens.boxHeight15,
                              ),
                              SizedBox(
                                height: Dimens.sixty,
                                width: double.infinity,
                                child: FormFieldWidget(
                                  contentPadding: Dimens.edgeInsets16,
                                  onChange: _controller.commentAndSend,
                                  fillColor: ColorsValue.greyBoxColor,
                                  formStyle: Styles.primaryText14,
                                  textInputType: TextInputType.text,
                                  hintStyle: Styles.grey13,
                                  suffixIcon: _controller.isSend
                                      ? GestureDetector(
                                          onTap: () {
                                            Get.snackbar<dynamic>(
                                                'Your comment',
                                                _controller.commentText,
                                                colorText:
                                                    ColorsValue.whiteColor);
                                          },
                                          child: const Icon(
                                            Icons.send,
                                            color: ColorsValue.whiteColor,
                                          ),
                                        )
                                      : Dimens.box0,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      Dimens.twenty,
                                    ),
                                  ),
                                  hintText: StringConstants.enterAComment,
                                  formBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      Dimens.twenty,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      : const TabSection(),
                  _controller.commentBoxOnDialog
                      ? Dimens.box0
                      : Dimens.boxHeight20,
                  _controller.commentBoxOnDialog
                      ? Dimens.box0
                      : Responsive.isWeb(context) ||
                              Responsive.isTablet(context)
                          ? const WebMoreLikeThis()
                          : Dimens.box0,
                ],
              ),
            )
          ],
        ),
      );
}
