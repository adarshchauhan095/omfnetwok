import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

/// Widget shows the card in [DownloadsView] that represents downloading UI
///
/// using percentage and if download is completed of video.
// ignore: must_be_immutable
class DownloadItem extends StatelessWidget {
  DownloadItem({Key? key, this.index}) : super(key: key);
  int? index;

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
      builder: (_controller) => (Responsive.isMobile(context) ||
              Responsive.isTablet(context) ||
              Responsive.isWeb(context))
          ? Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.ten),
                  border: Border.all(color: ColorsValue.greyBorderColor)),
              height: Dimens.eightyFive,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // if (!_controller.isDownloadingMovie) {
                            //   RouteManagement.goToLobby(_controller.omfDownload[index!].movie!);
                            // } else {}
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Dimens.ten),
                                border: Border.all(
                                    color: ColorsValue.greyBorderColor)),
                            height: Dimens.eightyFive,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(Dimens.ten),
                              child: Stack(
                                children: [
                                  Image.asset(
                                    AssetConstants.movie,
                                    width: Dimens.eighty,
                                    height: Dimens.eightyFive,
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    top: Dimens.thirty,
                                    left: Dimens.thirty,
                                    child: const Icon(
                                      Icons.play_circle_outline_outlined,
                                      color: ColorsValue.whiteColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Dimens.boxWidth15,
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      StringConstants.shoeShow +
                                          StringConstants.shoeShow,
                                      style: Styles.primaryText14,
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              Dimens.boxHeight2,
                              Text(
                                '209 MB',
                                overflow: TextOverflow.ellipsis,
                                style: Styles.primaryText11,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.bottomSheet(
                        Container(
                          height: Dimens.twoHundred,
                          width: double.infinity,
                          color: ColorsValue.greyBoxColor,
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: Dimens.edgeInsets10_15_10_15,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      _controller.deleteMovie(index!);
                                      Get.back<void>();
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: Dimens.fourty,
                                      decoration: BoxDecoration(
                                        color: ColorsValue.greyColor,
                                        borderRadius:
                                            BorderRadius.circular(Dimens.seven),
                                      ),
                                      child: Center(
                                        child: Text(
                                          StringConstants.deleteAllDownloads,
                                          style: Styles.primaryText16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Dimens.boxHeight10,
                                  GlobalButton(
                                      title: StringConstants.cancel,
                                      buttonColor: ColorsValue.redColor,
                                      onTap: () {
                                        Get.back<void>();
                                      })
                                ],
                              ),
                            ),
                          ),
                        ),
                        barrierColor: ColorsValue.blackColor.withOpacity(0.9),
                        isDismissible: true,
                        enableDrag: false,
                      );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.delete_outline,
                            color: ColorsValue.redColor, size: Dimens.thirty),
                        Image.asset(
                          AssetConstants.downloaded,
                          width: Dimens.fifteen,
                          height: Dimens.twentyTwo,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          : SizedBox(
              height: Dimens.eightyFive,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (!_controller.isDownloadingMovie) {
                        RouteManagement.goToLobby(
                            _controller.omfDownload[index!].movie!);
                      } else {}
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimens.ten),
                          border:
                              Border.all(color: ColorsValue.greyBorderColor)),
                      height: Dimens.eightyFive,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(Dimens.ten),
                        child: Stack(
                          children: [
                            Image.file(
                              File(
                                _controller.omfDownload[index!].movieThumbnail
                                    .toString(),
                              ),
                              width: Dimens.hundredTwenty,
                              height: Dimens.eightyFive,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: Dimens.thirtyTwo,
                              left: Dimens.fifty,
                              child: const Icon(
                                Icons.play_circle_outline_outlined,
                                color: ColorsValue.whiteColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Dimens.boxWidth15,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _controller.omfDownload[index!].movieName!,
                        style: Styles.primaryText16,
                      ),
                      Dimens.boxHeight2,
                      _controller.omfDownload[index!].isDownloading!
                          ? Text(
                              '${StringConstants.downloading} - ${Utility.getPercentageValue(_controller.omfDownload[index!].receivedBytes!, _controller.omfDownload[index!].totalBytes == 0 ? 1 : _controller.omfDownload[index!].totalBytes!)} %',
                              style: Styles.primary13,
                            )
                          : Text(
                              _controller.omfDownload[index!].movieSize!,
                              overflow: TextOverflow.ellipsis,
                              style: Styles.primaryText13,
                            ),
                    ],
                  ),
                  const Spacer(),
                  _controller.omfDownload[index!].isDownloading!
                      ? CircleAvatar(
                          backgroundColor: ColorsValue.whiteColor,
                          radius: Dimens.thirteen,
                          child: CircularStepProgressIndicator(
                            totalSteps:
                                _controller.omfDownload[index!].totalBytes == 0
                                    ? 1
                                    : _controller
                                            .omfDownload[index!].totalBytes! ~/
                                        1024,
                            currentStep: _controller
                                    .omfDownload[index!].receivedBytes! ~/
                                1024,
                            circularDirection: CircularDirection.clockwise,
                            selectedColor: ColorsValue.whiteColor,
                            unselectedColor:
                                ColorsValue.scaffoldBackgroundColor,
                            width: Dimens.twentyFive,
                            height: Dimens.twentyFive,
                            padding: Dimens.zero,
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: ColorsValue.blackColor),
                                  borderRadius:
                                      BorderRadius.circular(Dimens.fifty),
                                  color: ColorsValue.blackColor),
                            ),
                          ),
                        )
                      : GestureDetector(
                          // onTap: _controller.downloadDataAvailble,
                          onTap: () {
                            Get.bottomSheet(
                              Container(
                                height: Dimens.twoHundred,
                                width: double.infinity,
                                color: ColorsValue.greyBoxColor,
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: Dimens.edgeInsets10_15_10_15,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            _controller.deleteMovie(index!);
                                            Get.back<void>();
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: Dimens.fourty,
                                            decoration: BoxDecoration(
                                              color: ColorsValue.greyColor,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimens.seven),
                                            ),
                                            child: Center(
                                              child: Text(
                                                StringConstants
                                                    .deleteAllDownloads,
                                                style: Styles.primaryText16,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Dimens.boxHeight10,
                                        GlobalButton(
                                            title: StringConstants.cancel,
                                            buttonColor: ColorsValue.redColor,
                                            onTap: () {
                                              Get.back<void>();
                                            })
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              barrierColor:
                                  ColorsValue.blackColor.withOpacity(0.9),
                              isDismissible: true,
                              enableDrag: false,
                            );
                          },
                          child: Row(
                            children: [
                              Icon(Icons.delete_outline,
                                  color: ColorsValue.redColor,
                                  size: Dimens.thirty),
                              Image.asset(
                                AssetConstants.downloaded,
                                width: Dimens.fifteen,
                                height: Dimens.twentyTwo,
                              )
                            ],
                          ),
                        ),
                ],
              ),
            ));
}
