import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:share/share.dart';

/// UI of the Trending screen [TrendingView].
class TrendingView extends StatelessWidget {
  const TrendingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (_controller) => WebMob(
          web: Responsive.isWeb(context) ||
                  Responsive.isTablet(context) ||
                  Responsive.isMobile(context)
              ? const WebTrendingProducts()
              : Dimens.box0,
          android: PageView.builder(
              onPageChanged: _controller.setPageIndex,
              scrollDirection: Axis.vertical,
              itemCount: _controller.videos.length,
              itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Stack(
                      children: [
                        _controller.selectedIndex == 2
                            ? FeedVideoPlayer(
                                videoUrl: _controller.videos[index],
                                key: Key(index.toString()),
                              )
                            : Dimens.box0,     
                        Positioned(
                          top: Dimens.eight,
                          right: Dimens.eight,
                          child: Container(
                            color: ColorsValue.blackColor
                                .withOpacity(Dimens.pointSeven),
                            width: Dimens.thirty,
                            height: Dimens.twenty,
                            child: Center(
                              child: Text(
                                '18+',
                                style: Styles.primaryText14,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Flexible(
                                  flex: 8,
                                  child: Container(),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TrendingSideBar(
                                    index: index,
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )),
        ),
      );
}

/// SideBar of the [TrendingView] screen
class TrendingSideBar extends StatelessWidget {
  TrendingSideBar({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (_controller) => Container(
          padding: Dimens.edgeInsets0_20_0_0,
          height: Dimens.percentHeight(Dimens.pointFiveFive),
          child: Column(
            children: [
              SideBarIcon(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                  size: Dimens.thirty,
                ),
                title: StringConstants.products,
                onTap: RouteManagement.goToProducts,
              ),
              Dimens.boxHeight12,
              SideBarIcon(
                icon: Padding(
                  padding: Dimens.edgeInsets12,
                  child: Image.asset(AssetConstants.like,
                      color: ColorsValue.primaryColor
                      // : ColorsValue.whiteColor,
                      ),
                ),
                title: '12',
                onTap: () {
                  // _controller.makeFavorite(index);
                },
              ),
              Dimens.boxHeight12,
              SideBarIcon(
                icon: Padding(
                  padding: Dimens.edgeInsets15,
                  child: Image.asset(AssetConstants.myList,
                      color: ColorsValue.primaryColor
                      // : ColorsValue.whiteColor,
                      ),
                ),
                title: StringConstants.myList,
                onTap: () {
                  // _controller.addToMylist(index);
                },
              ),
              Dimens.boxHeight12,
              SideBarIcon(
                icon: Padding(
                  padding: Dimens.edgeInsets18,
                  child: Image.asset(
                    AssetConstants.shareTrending,
                  ),
                ),
                title: '',
                onTap: () {
                  Share.share('');
                },
              ),
              SideBarIcon(
                icon: Icon(
                  0 == 0 ? Icons.volume_up : Icons.volume_off,
                  color: Colors.white,
                  size: Dimens.thirty,
                ),
                title: '',
                onTap: () {},
              ),
            ],
          ),
        ),
      );
}

/// Widget that contians icon/image as widget title and ontap method
class SideBarIcon extends StatelessWidget {
  SideBarIcon({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final Widget? icon;
  final String? title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              width: Dimens.percentWidth(Dimens.pointTwo),
              height: Dimens.fifty,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorsValue.greyColor.withOpacity(Dimens.pointFive)),
              child: icon!,
            ),
            Dimens.boxHeight3,
            Text(
              title!,
              style: Styles.primaryText14,
            )
          ],
        ),
      );
}
