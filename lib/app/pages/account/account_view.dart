import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// An Account Screen to edit the profile of user.
class AccountView extends StatelessWidget {
  static const accountViewKey = Key('account-view-key');
  @override
  Widget build(BuildContext context) => Scaffold(
        key: accountViewKey,
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
            StringConstants.editProfile,
            style: Styles.primaryText20,
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Get.snackbar('Message', 'Profile Details Saved Successfully!',
                    colorText: ColorsValue.whiteColor,
                    snackPosition: SnackPosition.BOTTOM);
              },
              child: Padding(
                padding: Dimens.edgeInsets0_0_15_0,
                child: Center(
                  child: Text(
                    StringConstants.save,
                    style: Styles.primary18,
                  ),
                ),
              ),
            )
          ],
        ),
        backgroundColor: ColorsValue.scaffoldBackgroundColor,
        body: AccountWidget(),
      );
}
