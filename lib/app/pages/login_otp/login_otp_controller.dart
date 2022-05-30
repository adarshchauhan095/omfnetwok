import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:omf_netflix/domain/domain.dart';

/// A controller for [LoginOtpView] to update the UI.
class LoginOtpController extends GetxController {
  LoginOtpController(this.loginOtpPresenter);
  LoginOtpPresenter loginOtpPresenter;

  /// [hasError] will be true when otp is not matched.
  bool hasError = false;

  /// varibale stores the otp to match
  var otp = TextEditingController();

  void checkOtp(String otp) {
    if (otp.isNotEmpty && otp.length == 4) {
      isConfirmButtonEnable = true;
    } else {
      isConfirmButtonEnable = false;
    }
    update();
  }

  bool isConfirmButtonEnable = false;

  /// Validate Verification code
  Future<void> validateVerificationCode(
      VerifyOtpTrigger verifyOtpTrigger) async {
    debugPrint('otp : ${otp.text}');
    var response = await loginOtpPresenter.validateVerificationCode(
      phoneNumber: phoneNumber,
      countryCode: countryCode,
      trigger: verifyOtpTrigger == VerifyOtpTrigger.register
          ? '1'
          : verifyOtpTrigger == VerifyOtpTrigger.forgotPassword
              ? '2'
              : '3',
      code: otp.text.trim(),
      verificationId: verificationId,
    );
    if (!response.hasError) {
      hasError = false;
      update();
      if (isChangingPhoneNumber) {
        Get.back<void>();
        Get.back<void>();
        await Get.bottomSheet<dynamic>(
          Container(
            color: ColorsValue.greyColor,
            height: Dimens.twoHundred,
            padding: Dimens.edgeInsets15_0_15_0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Dimens.boxHeight10,
                Image.asset(
                  AssetConstants.done,
                  width: Dimens.seventyFour,
                  height: Dimens.seventyFour,
                ),
                Dimens.boxHeight10,
                Text(
                  'phoneNumberChanged'.tr,
                  style: Styles.boldPrimaryText20,
                ),
                Dimens.boxHeight10,
                Text(
                  'youHaveSuccessfullyChangedYourPhoneNumber'.tr,
                  style: Styles.primaryText16,
                ),
              ],
            ),
          ),
        );
      } else {
        RouteManagement.goToOffHome();
      }
    } else {
      Utility.showInfoDialog(response, false);
      hasError = true;
      update();
    }
  }

  /// verification data storing variable
  SendVerificationCodeResponse? sendVerificationCodeResponse;

  /// Resend verification code
  Future<void> resendVerificationCode() async {
    var response = await loginOtpPresenter.resendVerificationCode(
        emailOrPhone: phoneNumber,
        countryCode: countryCode,
        trigger: '4',
        type: EmailOrPhoneNoType.phoneNumber);
    if (!response.hasError) {
      sendVerificationCodeResponse =
          sendVerificationCodeResponseFromJson(response.data);
      expirytime = sendVerificationCodeResponse!.data!.expiryTime!;
      verificationId = sendVerificationCodeResponse!.data!.verificationId!;
      debugPrint(
          'ReSendVerification Response is: $expirytime and $verificationId');
      Get.snackbar<void>('Message', 'Code Sent Successfully',
          colorText: ColorsValue.whiteColor,
          backgroundColor: ColorsValue.greenColor,
          snackPosition: SnackPosition.BOTTOM);
      update();
      restartTimer();
    } else {
      Utility.showInfoDialog(response, false);
    }
  }

  ///  Login via phonenumber API
  Future<void> loginUserWithPhoneNumber() async {
    debugPrint('otp sending : ${otp.text}');
    var response = await loginOtpPresenter.loginUser(
      email: '',
      password: otp.text,
      phoneNumber: phoneNumber,
      countryCode: countryCode,
      verificationId: verificationId,
      loginType: LoginType.phoneNumber,
    );
    if (response.data != null) {
      hasError = false;
      update();
      RouteManagement.goToOffHome();
      await config();
    } else {
      hasError = true;
      update();
    }
  }

  /// Config App
  Future<void> config() async => loginOtpPresenter.config(type: TokenType.auth);

  /// [GlobalKey] as formKey using [FormState] used to work with [Form]
  final formKey = GlobalKey<FormState>();

  /// expiry time
  int? counter = 60;

  /// method to start timer
  void startTimer() {
    Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (counter != 0) {
          counter = counter! - 1;
          if (counter == 0) {
            timer.cancel();
          }
        }
        update();
      },
    );
  }

  /// method to restart time
  void restartTimer() {
    counter = expirytime;
    startTimer();
  }

  /// country code
  var countryCode = Get.arguments['countryCode'] as String? ?? '+91';

  /// phone number
  var phoneNumber = Get.arguments['phoneNumber'] as String? ?? '';

  /// expiry time
  var expirytime = Get.arguments['expiryTime'] as int? ?? 0;

  /// verification id
  var verificationId = Get.arguments['verificationId'] as String? ?? '';

  /// true if Changing phone number
  var isChangingPhoneNumber = Get.arguments['isUpdate'] as bool? ?? false;

  @override
  void onInit() {
    counter = expirytime;
    debugPrint('is changing phone number:  $isChangingPhoneNumber');
    startTimer();
    super.onInit();
  }
}
