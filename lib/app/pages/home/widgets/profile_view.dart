import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// [ProfileView] screen UI contains the [AccountView], [MyListView], [AppSettingsView],
///
/// [SubscriptionInformationView], Help and SignOut controlles.
class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (_controller) =>
            (Responsive.isWeb(context)) || Responsive.isTablet(context)
                ? const WebProfileView()
                : Responsive.isMobile(context)
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          kIsWeb ? const WebAppBar() : Dimens.box0,
                          kIsWeb ? Dimens.boxHeight50 : Dimens.box0,
                          Padding(
                            padding: kIsWeb
                                ? Dimens.edgeInsets35_0_15_0
                                : Dimens.edgeInsets15_0_15_0,
                            child: const ProfileMenuList(),
                          )
                        ],
                      )
                    : Dimens.box0,
      );
}
