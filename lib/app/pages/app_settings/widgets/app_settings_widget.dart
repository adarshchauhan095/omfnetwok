import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';


/// A widget for [AppSettingsView]
class AppSettingsWidget extends StatelessWidget {
  static const appSettingsWidgetKey = Key('app-settings-widget-key');

  @override
  Widget build(BuildContext context) => GetBuilder<AppSettingsController>(
        builder: (_controller) => ListView(
          key: appSettingsWidgetKey,
          children: [
            Dimens.boxHeight20,
            Padding(
              padding: Dimens.edgeInsets15_0_15_0,
              child: Text(
                StringConstants.support,
                style: Styles.primaryText16,
              ),
            ),
            Dimens.boxHeight12,
            AppSettingsBox(
              title: StringConstants.reportAProblem,
              suffixIcon: Icons.keyboard_arrow_right,
            ),
            Dimens.boxHeight25,
            Padding(
              padding: Dimens.edgeInsets15_0_15_0,
              child: Text(
                StringConstants.about,
                style: Styles.primaryText16,
              ),
            ),
            Dimens.boxHeight12,
            AppSettingsBox(
              title: StringConstants.privacy,
              suffixIcon: Icons.keyboard_arrow_right,
            ),
            Dimens.boxHeight10,
            AppSettingsBox(
              title: StringConstants.termsAndCondition,
              suffixIcon: Icons.keyboard_arrow_right,
            ),
            Dimens.boxHeight10,
            AppSettingsBox(
              title: StringConstants.deactivateAccount,
              suffixIcon: Icons.keyboard_arrow_right,
            ),
          ],
        ),
      );
}
