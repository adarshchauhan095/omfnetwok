import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:omf_netflix/domain/domain.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

/// Widget which holds the full UI for [LoginOtpView]
class LoginOtpWidget extends StatelessWidget {
  LoginOtpWidget({Key? key}) : super(key: key);
  static const pinCodeTextFieldKey = Key('pincode-text-field-key');
  @override
  Widget build(BuildContext context) => GetBuilder<LoginOtpController>(
        builder: (_controller) => GestureDetector(
          onTap: () {
            var currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Padding(
            key: key,
            padding: Dimens.edgeInsets16_0_16_0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment:
                  Responsive.isWeb(context) || Responsive.isTablet(context)
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      WebMob(
                        web: Responsive.isWeb(context) ||
                                Responsive.isTablet(context) ||
                                Responsive.isMobile(context)
                            ? Dimens.box0
                            : Dimens.box0,
                        android: Dimens.boxHeight10,
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
                        android: Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
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
                        _controller.phoneNumber.toString(),
                        style: Styles.primary13,
                      ),
                      Dimens.boxHeight35,
                      PinCodeTextField(
                        onChanged: _controller.checkOtp,
                        key: pinCodeTextFieldKey,
                        autoFocus: true,
                        appContext: context,
                        pastedTextStyle: Styles.black15,
                        length: 4,
                        mainAxisAlignment: Responsive.isWeb(context) ||
                                Responsive.isTablet(context)
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
                        autoDismissKeyboard: false,
                        textStyle: Styles.black15,
                        hintCharacter: '0',
                        enableActiveFill: true,
                        keyboardType: TextInputType.number,
                        controller: _controller.otp,
                        onCompleted: (v) async {
                          if (_controller.isChangingPhoneNumber) {
                            await _controller.validateVerificationCode(
                                VerifyOtpTrigger.changeNumber);
                          } else {
                            await _controller.loginUserWithPhoneNumber();
                          }
                        },
                      ),
                      Dimens.boxHeight44,
                      GestureDetector(
                        onTap: () {
                          if (_controller.counter == 0) {
                            _controller.resendVerificationCode();
                          }
                        },
                        child: Text(
                          _controller.counter == 0
                              ? 'resend'.tr
                              : '\00:${_controller.counter.toString().padLeft(2, '0')}',
                          style: Styles.primaryText14,
                        ),
                      ),
                      Dimens.boxHeight35,
                    ],
                  ),
                ),
                SafeArea(
                  child: GlobalButton(
                    title: _controller.isChangingPhoneNumber
                        ? 'confirm'.tr
                        : 'verify'.tr,
                    isDisable: !_controller.isConfirmButtonEnable,
                    titleStyle: Styles.primaryText15,
                    width: Responsive.isWeb(context) ||
                            Responsive.isTablet(context)
                        ? Dimens.percentWidth(.2)
                        : Get.width,
                    onTap: () async {
                      if (kIsWeb) {
                        if (Responsive.isWeb(context) ||
                            Responsive.isTablet(context) ||
                            Responsive.isMobile(context)) {
                          Get.find<HomeController>().loginNewUser();
                          Get.back<void>();
                        } else {
                          RouteManagement.goToOffHome();
                        }
                      } else if (_controller.otp.text.isNotEmpty) {
                        if (_controller.isChangingPhoneNumber) {
                          await _controller.validateVerificationCode(
                              VerifyOtpTrigger.changeNumber);
                        } else {
                          await _controller.loginUserWithPhoneNumber();
                        }
                      }
                    },
                  ),
                ),
                Dimens.boxHeight10,
              ],
            ),
          ),
        ),
      );
}
