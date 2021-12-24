import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

class ProfileMenuList extends StatelessWidget {
  const ProfileMenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
      builder: (_controller) => SingleChildScrollView(
            child: Column(
              children: [
                ProfileCard(
                  title: StringConstants.account,
                  prefixIcon: Icons.person_outline,
                  onTap: () {
                    (Responsive.isWeb(context) || Responsive.isTablet(context))
                        ? _controller.setWebWidgetIndex(0)
                        : RouteManagement.goToAccount();
                  },
                ),
                Dimens.boxHeight10,
                ProfileCard(
                  title: StringConstants.myList,
                  prefixIcon: Icons.book_outlined,
                  onTap: () {
                    (Responsive.isWeb(context) || Responsive.isTablet(context))
                        ? _controller.setWebWidgetIndex(1)
                        : RouteManagement.goToMyList();
                  },
                ),
                Dimens.boxHeight10,
                ProfileCard(
                  title: StringConstants.appSettings,
                  prefixIcon: Icons.settings_outlined,
                  onTap: () {
                    (Responsive.isWeb(context) || Responsive.isTablet(context))
                        ? _controller.viewDropDownMenus()
                        : RouteManagement.goToAppSettings();
                  },
                ),
                _controller.isDropDownAppSettings
                    ? const AppSettingsMenuList()
                    : Dimens.box0,
                Dimens.boxHeight10,
                ProfileCard(
                  title: StringConstants.subscriptionInformation,
                  prefixIcon: Icons.subscriptions_outlined,
                  onTap: () {
                    (Responsive.isWeb(context) || Responsive.isTablet(context))
                        ? _controller.setWebWidgetIndex(3)
                        : RouteManagement.goToSubscriptionInformation();
                  },
                ),
                Dimens.boxHeight10,
                ProfileCard(
                  title: StringConstants.help,
                  prefixIcon: Icons.help_outline_outlined,
                  onTap: () {
                    Get.snackbar('Help', 'Go to Feedback!',
                        backgroundColor: ColorsValue.greyBorderColor,
                        colorText: ColorsValue.whiteColor);
                  },
                ),
                Dimens.boxHeight30,
                GestureDetector(
                  onTap: () {
                    if (Responsive.isWeb(context) ||
                        Responsive.isTablet(context) ||
                        Responsive.isMobile(context)) {
                      _controller.loginNewUser();
                      _controller.setPageIndex(0);
                    } else {
                      Get.snackbar('SignOut', 'Signout Successfully!',
                          backgroundColor: ColorsValue.greyBorderColor,
                          colorText: ColorsValue.whiteColor);
                    }
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      StringConstants.signOut,
                      style: Styles.primaryText16,
                    ),
                  ),
                ),
                Dimens.boxHeight3,
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    StringConstants.version,
                    style: Styles.secondaryText13,
                  ),
                )
              ],
            ),
          ));
}
