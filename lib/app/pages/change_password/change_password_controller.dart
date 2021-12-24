import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// An [ChangePasswordController], to update the UI for [ChangePasswordView]
class ChangePasswordController extends GetxController {
  ChangePasswordController(this.changePasswordPresenter);
  final ChangePasswordPresenter changePasswordPresenter;

  /// Variable used to change password
  /// visibility through [passwordVisibility]
  bool isPasswordVisible = false;

  /// Used to Cahange the password visibility
  void passwordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  /// List of password errors.
  String? currentPasswordErrors;

  /// Is true when the password is valid.
  bool isCurrentPasswordValid = true;

  /// Password of the user.
  String currentPassword = '';

  /// Check if the password is valid or not.
  void checkIfPasswordIsValid(String value) {
    currentPasswordErrors = Utility.validatePassword(value) == null
        ? null
        : Utility.validatePassword(value);
    currentPassword = value;
    isCurrentPasswordValid = currentPasswordErrors == null ? true : false;
    enableSubmitButton();
  }

  /// List of password errors.
  String? newPasswordErrors;

  /// Is true when the password is valid.
  bool isNewPasswordValid = true;

  /// Password of the user.
  String newPassword = '';

  /// Check if the password is valid or not.
  void checkIfNewPasswordIsValid(String value) {
    newPasswordErrors = Utility.validatePassword(value) == null
        ? null
        : Utility.validatePassword(value);
    newPassword = value;
    isNewPasswordValid = newPasswordErrors == null ? true : false;
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
    if (value == newPassword) {
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

  /// Enable or disable the submit based on [newPassword] and [confirmPassword].
  void enableSubmitButton() {
    if (isCurrentPasswordValid && isNewPasswordValid && isConfirmedPassword) {
      isSubmitButtonEnable = true;
    } else {
      isSubmitButtonEnable = false;
    }
    update();
  }
}
