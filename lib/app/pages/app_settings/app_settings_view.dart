import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// An AppSettings Screen to show Support and About Application.
class AppSettingsView extends StatelessWidget {
  static const appSettingsViewKey = Key('app-settings-view-key');

  @override
  Widget build(BuildContext context) => Scaffold(
        key: appSettingsViewKey,
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
            'appSettings'.tr,
            style: Styles.primaryText20,
          ),
        ),
        backgroundColor: ColorsValue.scaffoldBackgroundColor,
        body: AppSettingsWidget(),
      );
}
