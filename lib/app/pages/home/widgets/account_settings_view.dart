import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

class AccountSettingsView extends StatelessWidget {
  const AccountSettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (_controller) => SafeArea(
          child: Scaffold(
            backgroundColor: ColorsValue.scaffoldBackgroundColor,
            appBar: AppBar(
              backgroundColor: ColorsValue.scaffoldBackgroundColor,
              leading: IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  color: ColorsValue.whiteColor,
                  size: Dimens.thirty,
                ),
                onPressed: () {
                  Get.back<void>();
                },
              ),
              centerTitle: true,
              title: Text(
                'settings'.tr,
                style: Styles.primaryText20,
              ),
            ),
            // body: (Responsive.isWeb(context)) || Responsive.isTablet(context)
            //     ? const WebProfileView()
            //     : Responsive.isMobile(context)
            //         ? Column(
            //           mainAxisAlignment: MainAxisAlignment.start,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             kIsWeb ? const WebAppBar() : Dimens.box0,
            //             kIsWeb ? Dimens.boxHeight50 : Dimens.box0,
            //             Padding(
            //               padding: kIsWeb
            //                   ? Dimens.edgeInsets35_0_15_0
            //                   : Dimens.edgeInsets15_0_15_0,
            //               child: const ProfileMenuList(),
            //             )
            //           ],
            //         )
            //         : Dimens.box0,
            body: const ProfileMenuList(),
          ),
        ),
      );
}
