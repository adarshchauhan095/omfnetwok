import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// Widget for [ForgotPasswordView] 
class ForgotPasswordWidget extends StatelessWidget {
  static const forgotPasswordWidgetKey = Key('forgot-password-widget-key');

  @override
  Widget build(BuildContext context) => GetBuilder<ForgotPasswordController>(
        builder: (_controller) => Padding(
          key: forgotPasswordWidgetKey,
          padding: Dimens.edgeInsets16_0_16_0,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Dimens.boxHeight60,
                GestureDetector(
                  onTap: () {
                    Get.back<void>();
                  },
                  child: Image.asset(
                    AssetConstants.arrowleft,
                    width: Dimens.sixteen,
                    height: Dimens.sixteen,
                  ),
                ),
                Dimens.boxHeight12,
                Text(
                  StringConstants.forgotPassword,
                  style: Styles.primaryText20,
                ),
                Dimens.boxHeight4,
                Padding(
                  padding: Dimens.edgeInsets0_0_52_0,
                  child: Text(
                    StringConstants.forgotPasswordInfo,
                    style: Styles.secondaryText13,
                  ),
                ),
                Dimens.boxHeight50,
                FormFieldWidget(
                  contentPadding: Dimens.edgeInsets16,
                  onChange: (val) {},
                  fillColor: ColorsValue.whiteColor,
                  textInputType: TextInputType.emailAddress,
                  focusedBorder:
                      const OutlineInputBorder(borderSide: BorderSide.none),
                  hintStyle: Styles.greyLight15,
                  hintText: StringConstants.enterEmail,
                  formBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Dimens.seven),
                  ),
                ),
                Dimens.boxHeight30,
                GlobalButton(
                  title: StringConstants.confirm,
                  titleStyle: Styles.primaryText15,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      );
}
