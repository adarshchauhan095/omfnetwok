import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// UI of the [MainHomeView]
class MainHomeView extends StatelessWidget {
  MainHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  maxHeight: (Responsive.isWeb(context)) ||
                          Responsive.isTablet(context)
                      ? Dimens.percentWidth(Dimens.pointFourStatic)
                      : Get.height,
                ),
                child: Image.asset(
                  (Responsive.isWeb(context)) || Responsive.isTablet(context)
                      ? AssetConstants.horizontal
                      : AssetConstants.mainpage,
                  width: double.infinity,
                  height: (Responsive.isWeb(context)) ||
                          Responsive.isTablet(context)
                      ? Dimens.percentWidth(Dimens.pointFourStatic)
                      : Get.height,
                  fit: BoxFit.cover,
                ),
              ),
              WebMob(
                web: ((Responsive.isWeb(context)) ||
                        Responsive.isTablet(context) ||
                        Responsive.isMobile(context))
                    ? const WebAppBar()
                    : Dimens.box0,
                android: Padding(
                  padding: Dimens.edgeInsets12_0_12_0,
                  child: Image.asset(
                    AssetConstants.omfLogo,
                    width: Dimens.hundredFifty,
                  ),
                ),
              ),
              WebMob(
                web: ((Responsive.isWeb(context)) ||
                        Responsive.isTablet(context))
                    ? const WebMainViewHeading()
                    : const MobileMainMenus(),
                android: const MobileMainMenus(),
              ),
              WebMob(
                  web: ((Responsive.isWeb(context)) ||
                          Responsive.isTablet(context) ||
                          Responsive.isMobile(context))
                      ? const WebPlayButtonRow()
                      : Dimens.box0,
                  android: const MobilePlayButtonRow()),
            ],
          ),
          Dimens.boxHeight30,
          PlayListHeading(
            heading: StringConstants.recentlyAdded,
          ),
          (Responsive.isWeb(context)) || Responsive.isTablet(context)
              ? Dimens.boxHeight15
              : Dimens.boxHeight5,
          const MovieListRow(),
          Dimens.boxHeight20,
          PlayListHeading(
            heading: StringConstants.newEpisodes,
          ),
          (Responsive.isWeb(context)) || Responsive.isTablet(context)
              ? Dimens.boxHeight15
              : Dimens.boxHeight5,
          const MovieListRow(),
          Dimens.boxHeight20,
          PlayListHeading(
            heading: StringConstants.trendingNow,
          ),
          (Responsive.isWeb(context)) || Responsive.isTablet(context)
              ? Dimens.boxHeight15
              : Dimens.boxHeight5,
          const MovieListRow(),
          Dimens.boxHeight20,
          PlayListHeading(
            heading: StringConstants.omfSeries,
          ),
          (Responsive.isWeb(context)) || Responsive.isTablet(context)
              ? Dimens.boxHeight15
              : Dimens.boxHeight5,
          const OmfSeries(),
          Dimens.boxHeight20,
          PlayListHeading(
            heading: StringConstants.blockbusterMovies,
          ),
          (Responsive.isWeb(context)) || Responsive.isTablet(context)
              ? Dimens.boxHeight15
              : Dimens.boxHeight5,
          const MovieListRow(),
          Dimens.boxHeight20,
          PlayListHeading(
            heading: StringConstants.continueWatching,
          ),
          (Responsive.isWeb(context)) || Responsive.isTablet(context)
              ? Dimens.boxHeight15
              : Dimens.boxHeight5,
          const ContinuesWatching(),
          WebMob(web: Dimens.boxHeight25, android: Dimens.box0),
          WebMob(
              web: (Responsive.isWeb(context) ||
                      Responsive.isTablet(context) ||
                      Responsive.isMobile(context))
                  ? const WebFooter()
                  : Dimens.box0,
              android: Dimens.box0),
          WebMob(web: Dimens.boxHeight25, android: Dimens.box0),
        ],
      );
}
