import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// An ChagePassowrd Screen is to Change the old passowrd.
class ChangePasswordView extends StatelessWidget {
  static const changePasswordViewKey = Key('change-password-view-key');
  @override
  Widget build(BuildContext context) => Scaffold(
    key: changePasswordViewKey,
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
            StringConstants.changePassword,
            style: Styles.primaryText20,
          ),
        ),
        backgroundColor: ColorsValue.scaffoldBackgroundColor,
        body: ChangePasswordWidget(),
      );
}
