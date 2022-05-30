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
                'support'.tr,
                style: Styles.primaryText16,
              ),
            ),
            Dimens.boxHeight12,
            GestureDetector(
              onTap: RouteManagement.goToReportAProblerm,
              child: AppSettingsBox(
                title: 'reportAProblem'.tr,
                suffixIcon: Icons.keyboard_arrow_right,
              ),
            ),
            Dimens.boxHeight25,
            Padding(
              padding: Dimens.edgeInsets15_0_15_0,
              child: Text(
                'about'.tr,
                style: Styles.primaryText16,
              ),
            ),
            Dimens.boxHeight12,
            AppSettingsBox(
              title: 'privacy'.tr,
              suffixIcon: Icons.keyboard_arrow_right,
            ),
            Dimens.boxHeight10,
            AppSettingsBox(
              title: 'termsAndCondition'.tr,
              suffixIcon: Icons.keyboard_arrow_right,
            ),
            Dimens.boxHeight10,
            AppSettingsBox(
              title: 'deactivateAccount'.tr,
              suffixIcon: Icons.keyboard_arrow_right,
            ),
          ],
        ),
      );
}
