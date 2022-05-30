import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// ChangePasswordDialog is the bottom sheet Content widget for
/// confirmation of change password
class ChangedPasswordDialog extends StatelessWidget {
  static const changedPasswordDialogKey = Key('changed-password-dialog-key');
  @override
  Widget build(BuildContext context) => Container(
        key: changedPasswordDialogKey,
        height: Dimens.twoHundred,
        width: Responsive.isWeb(context) ||
                Responsive.isTablet(context) ||
                Responsive.isMobile(context)
            ? Dimens.fourHundred
            : double.infinity,
        color: ColorsValue.greyBoxColor,
        child: Padding(
          padding: Dimens.edgeInsets15_20_15_0,
          child: Column(
            crossAxisAlignment: Responsive.isWeb(context) ||
                    Responsive.isTablet(context) ||
                    Responsive.isMobile(context)
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              Image.asset(
                AssetConstants.done,
                width: Dimens.seventyFour,
                height: Dimens.seventyFour,
              ),
              Dimens.boxHeight20,
              Text(
                Responsive.isWeb(context) ||
                        Responsive.isTablet(context) ||
                        Responsive.isMobile(context)
                    ? 'passwordChanged'.tr
                    : 'changePassword'.tr,
                style: Styles.primaryText23,
              ),
              Dimens.boxHeight10,
              Text(
              'youHaveSuccessfullyChangedYourPassword'.tr,
                maxLines: 2,
                style: Styles.primaryText16,
              ),
            ],
          ),
        ),
      );
}
