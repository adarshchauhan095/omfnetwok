import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:omf_netflix/domain/domain.dart';

/// An [ForgotPasswordController], to update the UI for [ForgotPasswordView]
class ForgotPasswordController extends GetxController {
  ForgotPasswordController(this._forgotPasswordPresenter);
  final ForgotPasswordPresenter _forgotPasswordPresenter;

  var dObject = Debouncer();

  /// Error text for email form field.
  String? emailErrorText;

  /// Is true when the email is valid.
  bool isEmailValid = true;

  /// Email id of the user
  var emailId = TextEditingController();

  /// true if email is taken
  var isEmailIdTaken = false.obs;

  /// true if email is checked
  var isEmailIdChecked = false.obs;

  /// true if email is checking vie API
  var isEmailChecking = false.obs;

  /// Check if the email is valid or not.
  void checkIfEmailIsValid(String value) {
    isEmailValid = Utility.emailValidator(value);
    emailErrorText =
        isEmailValid ? null : StringConstants.pleaseEnterValidEmail;
    if (isEmailValid) {
      isEmailChecking.value = true;
      validateEmail();
    }
    enableButton();
  }

  bool isEnableButton = false;

  void enableButton() {
    if (emailId.text.isNotEmpty && !isEmailIdTaken.value && isEmailValid) {
      isEnableButton = true;
    } else {
      isEnableButton = false;
    }

    update();
  }

  /// api coming error for email
  String? responseEmailError;

  /// Validate Email code
  Future<void> validateEmail() async {
    var response = await _forgotPasswordPresenter.validateEmail(
      emailId: emailId.text,
      type: TypeOfEntry.login,
    );
    debugPrint(response.data);
    if (!response.hasError) {
      isEmailChecking.value = false;
      isEmailIdChecked.value = true;
      isEmailIdTaken.value = false;
    } else {
      responseEmailError = response.data.toString();
      isEmailChecking.value = false;
      isEmailIdChecked.value = true;
      isEmailIdTaken.value = true;
    }
    enableButton();
  }

  /// Forgot Password API
  Future<void> forgotPassword() async {
    await _forgotPasswordPresenter.forgotPassword(
      emailOrPhoneNo: emailId.text,
      countryCode: '+91',
      type: EmailOrPhoneNoType.email,
    );
  }
}
