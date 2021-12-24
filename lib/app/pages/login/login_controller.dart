import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// A controller for [LoginView] to update the UI.
class LoginController extends GetxController {
  LoginController(this.loginPresenter);
  final LoginPresenter loginPresenter;

  /// [phoneNumberError] will be null if [phoneNumber] is valid.
  String? phoneNumberError;

  /// phone number of user
  String? phoneNumber;

  ///
  bool isbutton = false;

  /// variable will be true if [phoneNumber] is valid.
  bool isPhoneNumberValid = false;
  
  /// method used to validate the entered [phoneNumber].
  void phoneNumberCheck(bool value) {
    isPhoneNumberValid = value;
    if (isPhoneNumberValid) {
      phoneNumberError = null;
      isbutton = true;
    } else {
      phoneNumberError = StringConstants.enterAValidNumber;
      isbutton = false;
    }
    update();
  }

  /// if the phoneNumber is valid then phoneNumber is Stored as string.
  void storeIfPhoneNumberValid(String? value) {
    phoneNumber = value.toString();
    update();
  }

  /// Variable used to Swap through [swapLoginScreen]
  bool loginWithEmail = false;

  /// Used to Change the Screen UI for
  /// Email Login and Phone Number Login
  void swapLoginScreen() {
    loginWithEmail = !loginWithEmail;
    update();
  }

  /// Variable used to change password
  /// visibility through [passwordVisibility]
  bool isPasswordVisible = false;

  /// Used to Cahange the password visibility
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

  /// List of password errors.
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

  /// A variable which will be used to update the submit button.
  bool isSubmitButtonEnable = false;

  /// Enable or disable the submit based on [emailId] and [password].
  void enableSubmitButton() {
    if (isEmailValid &&
        isPasswordValid &&
        emailId.isNotEmpty &&
        password.isNotEmpty) {
      isSubmitButtonEnable = true;
    } else {
      isSubmitButtonEnable = false;
    }
    update();
  }
}
