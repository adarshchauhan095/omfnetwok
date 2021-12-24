import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// UI of the Downloads screen [DownloadsView].
class DownloadsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
      builder: (_controller) => Column(
            children: [
              WebMob(
                web: (Responsive.isWeb(context)) ||
                        Responsive.isTablet(context) ||
                        Responsive.isMobile(context)
                    ? const WebAppBar()
                    : Dimens.box0,
                android: Dimens.box0,
              ),
              WebMob(
                web: Responsive.isMobile(context)
                    ? Dimens.boxHeight20
                    : Dimens.box0,
                android: Dimens.box0,
              ),
              Responsive.isMobile(context)
                  ? Padding(
                      padding: kIsWeb
                          ? Dimens.edgeInsets35_0_15_0
                          : Dimens.edgeInsets15_0_15_0,
                      child: FormFieldWidget(
                        contentPadding: Dimens.edgeInsets16,
                        onChange: (val) {},
                        prefixIcon: const Icon(
                          Icons.search_outlined,
                          color: ColorsValue.greyColor,
                        ),
                        suffixIcon: const Icon(
                          Icons.mic,
                          color: ColorsValue.greyColor,
                        ),
                        fillColor: ColorsValue.greyBoxColor,
                        formStyle: Styles.primaryText14,
                        textInputType: TextInputType.text,
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        hintStyle: Styles.grey13,
                        hintText: StringConstants.searchForAShowMovieGenreEtc,
                        formBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Dimens.seven),
                        ),
                      ),
                    )
                  : Dimens.box0,
              WebMob(
                web: Dimens.boxHeight40,
                android: Dimens.boxHeight10,
              ),
              WebMob(
                  web: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: Dimens.edgeInsets35_0_15_0,
                      child: Text(
                        StringConstants.download,
                        style: Styles.primaryText18,
                      ),
                    ),
                  ),
                  android: Dimens.box0),
// ==
              (Responsive.isMobile(context) ||
                      Responsive.isTablet(context) ||
                      Responsive.isWeb(context))
                  ? Dimens.box0
                  : Padding(
                      padding: Dimens.edgeInsets35_0_15_0,
                      child: ListTile(
                        leading: GestureDetector(
                          onTap: () {
                            _controller.resetDownloadList();
                          },
                          child: const Icon(
                            Icons.restore,
                            color: ColorsValue.whiteColor,
                          ),
                        ),
                        title: Text(
                          _controller.omfDownload.length.isGreaterThan(0)
                              ? '${_controller.omfDownload.length.toString()} file downloaded'
                              : '${_controller.received ~/ 1024}/${_controller.total ~/ 1024} KB',
                          style: Styles.primaryText20,
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            _controller.downloadVideo(AssetConstants.movieLink);
                          },
                          child: const Icon(
                            Icons.download,
                            color: ColorsValue.whiteColor,
                          ),
                        ),
                      ),
                    ),
              (Responsive.isMobile(context) ||
                      Responsive.isTablet(context) ||
                      Responsive.isWeb(context))
                  ? Dimens.box0
                  : Padding(
                      padding: Dimens.edgeInsets35_0_15_0,
                      child: ListTile(
                        leading: GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.pause,
                            color: ColorsValue.whiteColor,
                          ),
                        ),
                        title: GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.cancel,
                              color: ColorsValue.whiteColor,
                            )),
                        trailing: GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.play_arrow,
                            color: ColorsValue.whiteColor,
                          ),
                        ),
                      ),
                    ),
              Dimens.boxHeight10,
              // ==
              Expanded(
                child: !_controller.omfDownload.length.isEqual(0)
                    ? Padding(
                        padding: kIsWeb
                            ? Dimens.edgeInsets35_0_15_0
                            : Dimens.edgeInsets15_0_15_0,
                        child: ListView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          children: [
                            Dimens.boxHeight25,
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                StringConstants.introducingDownloadsForYou,
                                style: Styles.primaryText18,
                              ),
                            ),
                            Dimens.boxHeight10,
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: Responsive.isMobile(context)
                                    ? Dimens.edgeInsets15_0_15_0
                                    : Responsive.isTablet(context)
                                        ? Dimens.edgeInsets100_0_100_0
                                        : Dimens.edgeInsets150_0_150_0,
                                child: Text(
                                  StringConstants.downloadInfo,
                                  textAlign: TextAlign.center,
                                  style: Styles.secondaryText13,
                                ),
                              ),
                            ),
                            Dimens.boxHeight40,
                            Image.asset(
                              AssetConstants.emptybox,
                              width: Dimens.threeHundred,
                              height: Dimens.threeHundred,
                            ),
                            Dimens.boxHeight20,
                            Center(
                              child: Text(
                                StringConstants.noDownloadsYet,
                                style: Styles.secondaryText18,
                              ),
                            ),
                          ],
                        ),
                      )
                    : (Responsive.isMobile(context) ||
                            Responsive.isTablet(context) ||
                            Responsive.isWeb(context))
                        ? Padding(
                            padding: kIsWeb
                                ? Dimens.edgeInsets35_0_15_0
                                : Dimens.edgeInsets15_0_15_0,
                            child: StaggeredGridView.countBuilder(
                              controller: ScrollController(),
                              shrinkWrap: true,
                              crossAxisCount: Responsive.isWeb(context)
                                  ? 3
                                  : Responsive.isTablet(context)
                                      ? 2
                                      : 1,
                              itemCount: 25,
                              staggeredTileBuilder: (int index) =>
                                  const StaggeredTile.fit(1),
                              mainAxisSpacing: Dimens.twenty,
                              crossAxisSpacing: Dimens.twenty,
                              itemBuilder: (context, index) => DownloadItem(
                                index: index,
                              ),
                            ),
                          )
                        : Dimens.box0,
              ),
            ],
          ));
}
