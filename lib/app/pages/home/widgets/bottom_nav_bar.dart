import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// BottomNavigation for [HomeView].
class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (_controller) => BottomNavigationBar(
          selectedLabelStyle: Styles.primary10,
          unselectedLabelStyle: Styles.grey10,
          selectedItemColor: ColorsValue.primaryColor,
          unselectedItemColor: ColorsValue.iconColor,
          backgroundColor: _controller.btmNavBgTransparent
              ? ColorsValue.transparent
              : ColorsValue.greyBoxColor,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: Dimens.one,
          onTap: _controller.onItemTapped,
          currentIndex: _controller.selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: Dimens.edgeInsets0_5_0_5,
                child: Icon(
                  Elusive.home,
                  size: Dimens.seventeen,
                ),
              ),
              label: StringConstants.home,
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: Dimens.edgeInsets0_5_0_5,
                child: Icon(
                  FontAwesome5.search,
                  size: Dimens.seventeen,
                ),
              ),
              label: StringConstants.search,
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: Dimens.edgeInsets0_5_0_5,
                child: Icon(
                  Icons.subdirectory_arrow_right_outlined,
                  size: Dimens.seventeen,
                ),
              ),
              label: StringConstants.trending,
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: Dimens.edgeInsets0_5_0_5,
                child: Icon(
                  FontAwesome5.download,
                  size: Dimens.seventeen,
                ),
              ),
              label: StringConstants.downloads,
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: Dimens.edgeInsets0_5_0_5,
                child: Icon(
                  Icons.account_circle_outlined,
                  size: Dimens.seventeen,
                ),
              ),
              label: StringConstants.profile,
            ),
          ],
        ),
      );
}
