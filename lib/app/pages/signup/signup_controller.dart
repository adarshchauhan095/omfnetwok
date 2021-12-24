import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// A controller for [SignupView] to update the UI.
class SignupController extends GetxController {
  SignupController(this.signupPresenter);
  final SignupPresenter signupPresenter;

  /// variable stores firstname of user.
  String firstName = '';

  /// [firstNameError] will null if [firstName] is valid.
  String? firstNameError;

  /// variable stores lastname of user.
  String lastName = '';

  /// [lastNameError] will null if [lastName] is valid.
  String? lastNameError;

  //? variable stores username of user.
  String userName = '';

  /// method to validate [firstName] of user.
  enterFirstName(String value) {
    firstName = value;
    if (value.isNotEmpty) {
      firstNameError = null;
    } else {
      firstNameError = StringConstants.fieldRequired;
    }
    update();
  }

  /// method to validate [lastName] of user.
  enterLastName(String value) {
    lastName = value;
    update();
  }

  /// [isUsernameValid] is true when [userName] is valid.
  bool isUsernameValid = false;

  /// [userNameError] will null if [userName] is valid.
  String? userNameError;

  /// method to validate [userName] of user.
  enterUserName(String value) {
    userName = value;
    if (value.length >= 6) {
      isUsernameValid = true;
      userNameError = null;
    } else {
      isUsernameValid = false;
      userNameError = StringConstants.shouldBe6Characters;
    }
    update();
  }

  /// is true when terms and policy is checked
  bool isTermsAndPolicyAccept = false;

  /// used to check uncheck terms and policy
  /// and enable and disable the submit button
  void termsAndPolicy() {
    isTermsAndPolicyAccept = !isTermsAndPolicyAccept;
    enableSubmitButton();
  }

  /// Variable used to change password
  /// visibility through [passwordVisibility]
  bool isPasswordVisible = false;

  /// Used to Change the password visibility
  void passwordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  /// Error text for email form field.
  String? emailErrorText;

  /// Is true when the email is valid.
  bool isEmailValid = true;

  /// Email id of the user
  String emailId = '';

  /// Check if the email is valid or not.
  void checkIfEmailIsValid(String value) {
    isEmailValid = Utility.emailValidator(value);
    emailId = value;
    emailErrorText =
        isEmailValid ? null : StringConstants.pleaseEnterValidEmail;
    enableSubmitButton();
  }

  /// Error text for passowrd form field.
  String? passwordErrors;

  /// Is true when the password is valid.
  bool isPasswordValid = true;

  /// Password of the user.
  String password = '';

  /// Check if the password is valid or not.
  void checkIfPasswordIsValid(String value) {
    passwordErrors = Utility.validatePassword(value) == null
        ? null
        : Utility.validatePassword(value);
    password = value;
    isPasswordValid = passwordErrors == null ? true : false;
    enableSubmitButton();
  }

  /// Error text for confirm password form field.
  String? confirmPasswordError;

  /// Confirm Password for double check.
  String confirmPassword = '';

  /// Is true when the password and confirm password same.
  bool isConfirmedPassword = false;

  /// validation for checking password and confirm password
  void checkPasswordConfirmation(String value) {
    confirmPassword = value;
    if (value == password) {
      isConfirmedPassword = true;
      confirmPasswordError = null;
    } else {
      isConfirmedPassword = false;
      confirmPasswordError =
          StringConstants.passwordAndConfirmPasswordShouldBeSame;
    }
    enableSubmitButton();
  }

  /// A variable which will be used to update the submit button.
  bool isSubmitButtonEnable = false;

  /// phone number of user
  String phoneNumber = '';

  /// isButton
  bool isbutton = false;

  /// [phoneNumberError] will null if [phoneNumber] is valid.
  String? phoneNumberError;

  /// [isPhoneNumberValid] will true if [phoneNumber] is valid.
  bool isPhoneNumberValid = false;

  /// method to validate [phoneNumber].
  void phoneNumberCheck(bool value) {
    isPhoneNumberValid = value;
    update();
  }

  /// method to validate [phoneNumber] and store the [phoneNumber].
  void checkIfPhoneNumberValid(String value) {
    phoneNumber = value;
    if (isPhoneNumberValid) {
      phoneNumberError = null;
      isbutton = true;
    } else {
      phoneNumberError = StringConstants.enterAValidNumber;
      isbutton = false;
    }
    update();
  }

  /// Enable or disable the submit based on [emailId] and [password].
  void enableSubmitButton() {
    if (isEmailValid &&
        isPasswordValid &&
        isTermsAndPolicyAccept &&
        isConfirmedPassword) {
      isSubmitButtonEnable = true;
    } else {
      isSubmitButtonEnable = false;
    }
    update();
  }
}
