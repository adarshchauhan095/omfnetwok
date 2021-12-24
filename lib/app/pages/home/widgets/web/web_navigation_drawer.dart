import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

class WebNavigationDrawer extends StatelessWidget {
  const WebNavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (_controller) => Drawer(
          backgroundColor: ColorsValue.blackColor,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: Dimens.edgeInsets15_20_15_0,
              child: Column(
                children: [
                  drawerHeader(_controller.isLoggedIn
                      ? 'Test User'
                      : '${StringConstants.login}/${StringConstants.signUp}'),
                  Dimens.boxHeight10,
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _controller.drawerMenus.length,
                    separatorBuilder: (context, index) => Dimens.boxHeight10,
                    itemBuilder: (context, index) => drawerBodyItem(index),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget drawerHeader(String? user) => Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimens.fifty),
              border: Border.all(
                  color: ColorsValue.whiteColor, width: Dimens.three),
            ),
            child: Icon(
              Icons.person_outline,
              color: ColorsValue.whiteColor,
              size: Dimens.thirty,
            ),
          ),
          Dimens.boxWidth10,
          Text(
            user!,
            style: Styles.primaryText15,
          ),
        ],
      );

  Widget drawerBodyItem(int index) => GetBuilder<HomeController>(
      builder: (_controller) => GestureDetector(
            onTap: () {
              _controller.setPageIndex(index);

              Get.back<void>();
            },
            child: Row(
              children: <Widget>[
                Icon(
                  _controller.drawerMenus[index].mIcon,
                  color: _controller.drawerMenus[index].isActive!
                      ? ColorsValue.primaryColor
                      : ColorsValue.greyBorderColor,
                ),
                Padding(
                  padding: Dimens.edgeInsets10,
                  child: Text(
                    _controller.drawerMenus[index].mTitle!,
                    style: _controller.drawerMenus[index].isActive!
                        ? Styles.primary14
                        : Styles.footerColor14,
                  ),
                )
              ],
            ),
          ));
}
