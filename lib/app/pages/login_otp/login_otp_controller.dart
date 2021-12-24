import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// A controller for [LoginOtpView] to update the UI.
class LoginOtpController extends GetxController {
  LoginOtpController(this.loginOtpPresenter);
  LoginOtpPresenter loginOtpPresenter;

  /// [hasError] will be true when otp is not matched.
  bool hasError = false;

  /// varibale stores the otp to match
  String otp = '';

  /// method to validate the OTP
  void otpValidation(String value) {
    if (value != '1234') {
      otp = value;
      hasError = true;
    } else {
      hasError = false;
    }
    update();
  }

  /// [GlobalKey] as formKey using [FormState] used to work with [Form]
  final formKey = GlobalKey<FormState>();
}
