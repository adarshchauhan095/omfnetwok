import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

class DeviceLogView extends StatelessWidget {
  const DeviceLogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
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
            'yourDevices'.tr,
            style: Styles.primaryText20,
          ),
        ),
        body: const DeviceLogWidget(),
      );
}
