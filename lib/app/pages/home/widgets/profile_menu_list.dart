import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

class ProfileMenuList extends StatelessWidget {
  const ProfileMenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (_controller) => Padding(
          padding: Dimens.edgeInsets12_0_12_0,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    ProfileCard(
                      title: 'subscriptionInformation'.tr,
                      prefixIcon: Icons.subscriptions_outlined,
                      onTap: () {
                        (Responsive.isWeb(context) ||
                                Responsive.isTablet(context))
                            ? _controller.setWebWidgetIndex(3)
                            : RouteManagement.goToSubscriptionInformation();
                      },
                    ),
                    Dimens.boxHeight10,
                    ProfileCard(
                      title: 'help'.tr,
                      prefixIcon: Icons.help_outline_outlined,
                      onTap: () {
                        Get.snackbar<void>('Help', 'Go to Feedback!',
                            backgroundColor: ColorsValue.greyBorderColor,
                            colorText: ColorsValue.whiteColor);
                      },
                    ),
                    Dimens.boxHeight10,
                    ProfileCard(
                      title: 'deviceLog'.tr,
                      prefixIcon: Icons.perm_device_information_outlined,
                      onTap: RouteManagement.goToDeviceLogView,
                    ),
                  ],
                ),
              ),
              Dimens.boxHeight30,
              GestureDetector(
                onTap: () async {
                  if (kIsWeb) {
                    if (Responsive.isWeb(context) ||
                        Responsive.isTablet(context) ||
                        Responsive.isMobile(context)) {
                      _controller.loginNewUser();
                      _controller.setPageIndex(0);
                    } else {
                      Get.snackbar<void>('SignOut', 'Signout Successfully!',
                          backgroundColor: ColorsValue.greyBorderColor,
                          colorText: ColorsValue.whiteColor);
                    }
                  } else {
                    getSheet();
                  }
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'signOut'.tr,
                    style: Styles.primaryText16,
                  ),
                ),
              ),
              Dimens.boxHeight3,
              Align(
                alignment: Alignment.center,
                child: Text(
                  'version'.tr,
                  style: Styles.secondaryText13,
                ),
              ),
              Dimens.boxHeight20,
            ],
          ),
        ),
      );

  void getSheet() {
    Get.bottomSheet<dynamic>(
      GetBuilder<HomeController>(
        builder: (_controller) => Container(
          height: Dimens.twoHundred,
          width: double.infinity,
          color: ColorsValue.greyBoxColor,
          child: Padding(
            padding: Dimens.edgeInsets15_20_15_0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 150),
                  child: Text(
                    'Are you sure want to logout?',
                    style: Styles.primaryText23,
                  ),
                ),
                Dimens.boxHeight50,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleImageAvatar(
                      onTap: () async {
                        await _controller.logout();
                        RouteManagement.goToOffLogin();
                      },
                      borderRadius: Dimens.ten,
                      borderColor: ColorsValue.primaryColor,
                      borderWidth: Dimens.two,
                      color: ColorsValue.transparent,
                      width: Dimens.hundredFifty + Dimens.five,
                      height: Dimens.fifty,
                      child: Center(
                        child: Text(
                          'Yes',
                          style: Styles.primaryText16,
                        ),
                      ),
                    ),
                    CircleImageAvatar(
                      onTap: () {
                        Get.back<void>();
                      },
                      borderRadius: Dimens.ten,
                      color: ColorsValue.primaryColor,
                      width: Dimens.hundredFifty + Dimens.five,
                      height: Dimens.fifty,
                      child: Center(
                        child: Text(
                          'No',
                          style: Styles.primaryText16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
