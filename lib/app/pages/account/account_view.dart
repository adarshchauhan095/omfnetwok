import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// An Account Screen to edit the profile of user.
class AccountView extends StatelessWidget {
  static const accountViewKey = Key('account-view-key');
  @override
  Widget build(BuildContext context) => GetBuilder<AccountController>(
        builder: (_controller) => SafeArea(
          child: Scaffold(
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
                'editProfile'.tr,
                style: Styles.primaryText20,
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    Get.snackbar<void>(
                        'Message', 'Profile Details Saved Successfully!',
                        colorText: ColorsValue.whiteColor,
                        snackPosition: SnackPosition.BOTTOM);
                  },
                  child: Padding(
                    padding: Dimens.edgeInsets0_0_15_0,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          saveProfileDialog(context);
                        },
                        child: Text(
                          'save'.tr,
                          style: Styles.primary18,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            backgroundColor: ColorsValue.scaffoldBackgroundColor,
            body: AccountWidget(),
          ),
        ),
      );

  void editProfileDialog(
    BuildContext context,
  ) {
    showDialog<String>(
      barrierDismissible: true,
      barrierColor: Colors.black38,
      context: context,
      builder: (BuildContext context) => Dialog(
        insetPadding: EdgeInsets.all(Dimens.ten),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.ten),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: const ContentEditProfilePopup(),
      ),
    );
  }

  void saveProfileDialog(
    BuildContext context,
  ) {
    showDialog<String>(
      barrierDismissible: true,
      barrierColor: Colors.black38,
      context: context,
      builder: (BuildContext context) => Dialog(
        insetPadding: EdgeInsets.all(Dimens.ten),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.ten),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: const ContentSaveProfilePopup(),
      ),
    );
  }
}
