import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

/// Widget which holds the full UI for [LoginOtpView]
class LoginOtpWidget extends StatelessWidget {
  LoginOtpWidget({Key? key}) : super(key: key);
  static const pinCodeTextFieldKey = Key('pincode-text-field-key');
  @override
  Widget build(BuildContext context) => GetBuilder<LoginOtpController>(
        builder: (_controller) => Padding(
          key: key,
          padding: Dimens.edgeInsets16_0_16_0,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment:
                  Responsive.isWeb(context) || Responsive.isTablet(context)
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
              children: [
                WebMob(
                  web: Responsive.isWeb(context) ||
                          Responsive.isTablet(context) ||
                          Responsive.isMobile(context)
                      ? Dimens.box0
                      : Dimens.box0,
                  android: Dimens.boxHeight60,
                ),
                WebMob(
                  web: Responsive.isWeb(context) ||
                          Responsive.isTablet(context) ||
                          Responsive.isMobile(context)
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              Get.back<void>();
                            },
                            child: Icon(
                              Icons.cancel_sharp,
                              color: ColorsValue.whiteColor,
                              size: Dimens.thirty,
                            ),
                          ),
                        )
                      : Dimens.box0,
                  android: GestureDetector(
                    onTap: () {
                      Get.back<void>();
                    },
                    child: Image.asset(
                      AssetConstants.arrowleft,
                      width: Dimens.sixteen,
                      height: Dimens.sixteen,
                    ),
                  ),
                ),
                Dimens.boxHeight12,
                Text(
                  StringConstants.enterVerificationCode,
                  style: Styles.primaryText20,
                ),
                Dimens.boxHeight4,
                Padding(
                  padding: Dimens.edgeInsets0_0_52_0,
                  child: Text(
                    StringConstants.verificationCodeHasBeenSendTo,
                    style: Styles.secondaryText13,
                  ),
                ),
                Dimens.boxHeight2,
                Text(
                  '+91 99887 76655',
                  style: Styles.primary13,
                ),
                Dimens.boxHeight35,
                PinCodeTextField(
                  key: pinCodeTextFieldKey,
                  appContext: context,
                  pastedTextStyle: Styles.black15,
                  length: 4,
                  mainAxisAlignment:
                      Responsive.isWeb(context) || Responsive.isTablet(context)
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.start,
                  pinTheme: PinTheme(
                      fieldOuterPadding: Dimens.edgeInsets0_0_15_0,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(Dimens.seven),
                      fieldHeight: Dimens.fifty,
                      fieldWidth: Dimens.fifty,
                      borderWidth:
                          _controller.hasError ? Dimens.one : Dimens.zero,
                      selectedColor: _controller.hasError
                          ? ColorsValue.primaryColor
                          : ColorsValue.greyColor,
                      inactiveColor: _controller.hasError
                          ? ColorsValue.primaryColor
                          : ColorsValue.greyColor,
                      activeFillColor: ColorsValue.whiteColor,
                      activeColor: _controller.hasError
                          ? ColorsValue.errorColor
                          : ColorsValue.greyColor,
                      selectedFillColor: ColorsValue.whiteColor,
                      inactiveFillColor: ColorsValue.whiteColor),
                  cursorColor: ColorsValue.greyColor,
                  textStyle: Styles.black15,
                  hintCharacter: '0',
                  enableActiveFill: true,
                  keyboardType: TextInputType.number,
                  onCompleted: _controller.otpValidation,
                  onChanged: (value) {},
                ),
                Dimens.boxHeight44,
                Text(
                  '00:34',
                  style: Styles.primaryText14,
                ),
                Dimens.boxHeight35,
                GlobalButton(
                  title: StringConstants.verify,
                  titleStyle: Styles.primaryText15,
                  width:
                      Responsive.isWeb(context) || Responsive.isTablet(context)
                          ? Dimens.percentWidth(.2)
                          : Get.width,
                  onTap: () {
                    if (Responsive.isWeb(context) ||
                        Responsive.isTablet(context) ||
                        Responsive.isMobile(context)) {
                      Get.find<HomeController>().loginNewUser();
                      Get.back<void>();
                    } else {
                      RouteManagement.goToSubscription();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
