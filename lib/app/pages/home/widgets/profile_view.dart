import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:omf_netflix/app/app.dart';

/// [ProfileView] screen UI contains the [AccountView], [MyListView], [AppSettingsView],
///
/// [SubscriptionInformationView], Help and SignOut controlles.
class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (_controller) => _controller.isLoading
            ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoadingAnimationWidget.discreteCircle(
                      color: ColorsValue.primaryColor,
                      size: 40,
                    )
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              height: Dimens.twoHundred,
                              width: double.infinity,
                              child: CachedNetworkImage(
                                imageUrl: '',
                                // '${_controller.imageBaseUrl}/${_controller.profileResponse!.data!.bannerImage!}',
                                placeholder: (context, url) => Image.network(
                                  'https://picsum.photos/200/300',
                                  height: Dimens.twoHundred,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                errorWidget: (context, url, dynamic test) =>
                                    CircleImageAvatar(
                                  borderRadius: Dimens.zero,
                                  color: ColorsValue.greyColor,
                                  borderColor: ColorsValue.greyColor,
                                  borderWidth: Dimens.zero,
                                  height: Dimens.twoHundred,
                                  width: double.infinity,
                                  child: Center(
                                    child: Image.asset(
                                      AssetConstants.greyOmfLogo,
                                      width: Dimens.twoHundred,
                                      height: Dimens.fourty,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              right: Dimens.five,
                              top: Dimens.ten,
                              child: CircleImageAvatar(
                                onTap: RouteManagement.goToAccountSettingsView,
                                borderRadius: Dimens.fifty,
                                borderColor: ColorsValue.transparent,
                                color: ColorsValue.transparent,
                                width: Dimens.thirty,
                                height: Dimens.thirty,
                                child: Center(
                                  child: Icon(
                                    Icons.settings,
                                    color: ColorsValue.whiteColor,
                                    size: Dimens.twentyFive,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: Dimens.edgeInsets12_0_12_0,
                          child: SizedBox(
                            height: Dimens.twoHundredFifty,
                            child: Column(
                              children: [
                                Dimens.boxHeight150,
                                CircleImageAvatar(
                                  borderRadius: Dimens.fifty,
                                  width: Dimens.eightyFive,
                                  height: Dimens.eightyFive,
                                  color: ColorsValue.greyColor,
                                  borderColor: ColorsValue.primaryColor,
                                  child: CachedNetworkImage(
                                    imageUrl: '',
                                    // '${_controller.imageBaseUrl}/${_controller.profileResponse!.data!.profilePic!}',
                                    placeholder: (context, url) =>
                                        Utility.setUserDefaultImageSmall()!,
                                    errorWidget: (context, url, dynamic test) =>
                                        Utility.setUserDefaultImageSmall()!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: Dimens.edgeInsets12_0_12_0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${_controller.profileResponse!.data!.firstName!} ${_controller.profileResponse!.data!.lastName!}',
                                style: Styles.primaryText18,
                              ),
                              Text(
                                '@${_controller.profileResponse!.data!.username!}',
                                style: Styles.primaryText14,
                              ),
                            ],
                          ),
                          CircleImageAvatar(
                            onTap: RouteManagement.goToAccount,
                            borderRadius: Dimens.fifty,
                            borderColor: ColorsValue.primaryColor,
                            borderWidth: Dimens.one,
                            color: ColorsValue.transparent,
                            width: Dimens.eighty,
                            height: Dimens.fourty,
                            child: Center(
                              child: Text(
                                'edit'.tr,
                                style: Styles.primary14,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Dimens.boxHeight20,
                    CircleImageAvatar(
                      borderRadius: Dimens.zero,
                      color: ColorsValue.greyColor,
                      borderColor: ColorsValue.greyColor,
                      width: double.infinity,
                      height: Dimens.fourty,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _controller.openFavPosts(1);
                            },
                            child: Container(
                              width: Dimens.seventy,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: _controller.isFavoritePosts == 1
                                        ? ColorsValue.primaryColor
                                        : ColorsValue.greyColor,
                                    width: Dimens.two,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Image.asset(
                                  AssetConstants.like,
                                  color: _controller.isFavoritePosts == 1
                                      ? ColorsValue.primaryColor
                                      : ColorsValue.greyLightColor,
                                  width: Dimens.twentyFive,
                                  height: Dimens.twentyFive,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _controller.openFavPosts(2);
                            },
                            child: Container(
                              width: Dimens.seventy,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: _controller.isFavoritePosts == 2
                                        ? ColorsValue.primaryColor
                                        : ColorsValue.greyColor,
                                    width: Dimens.two,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.copy,
                                  color: _controller.isFavoritePosts == 2
                                      ? ColorsValue.primaryColor
                                      : ColorsValue.greyLightColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Dimens.boxHeight10,
                    _controller.isFavoritePosts == 1
                        ? const FavoriteProductsWidget()
                        : const AllProfileProductsWidget(),
                    Dimens.boxHeight50,
                  ],
                ),
              ),
      );
}
