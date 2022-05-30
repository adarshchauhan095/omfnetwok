import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// An [ChangePasswordController], to update the UI for [ChangePasswordView]
class ChangePasswordController extends GetxController {
  ChangePasswordController(this._changePasswordPresenter);
  final ChangePasswordPresenter _changePasswordPresenter;

  /// Variable used to change password
  /// visibility through [passwordVisibility]
  bool isPasswordVisible = false;

  /// Used to Cahange the password visibility
  void passwordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  /// Variable used to change password
  /// visibility through [passwordVisibility]
  bool isConfirmPasswordVisible = false;

  /// Used to Cahange the password visibility
  void confirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    update();
  }

  /// Variable used to change password
  /// visibility through [passwordVisibility]
  bool isNewPasswordVisible = false;

  /// Used to Cahange the password visibility
  void newPasswordVisibility() {
    isNewPasswordVisible = !isNewPasswordVisible;
    update();
  }

  /// Password of the user.
  String currentPassword = '';

  /// Check if the password is valid or not.
  void checkIfPasswordIsValid(String value) {
    currentPassword = value;
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
      confirmPasswordError = 'passwordNotMatch'.tr;
    }
    enableSubmitButton();
  }

  /// A variable which will be used to update the submit button.
  bool isSubmitButtonEnable = false;

  /// Enable or disable the submit based on [newPassword] and [confirmPassword].
  void enableSubmitButton() {
    if (currentPassword.isNotEmpty &&
        isNewPasswordValid &&
        isConfirmedPassword) {
      isSubmitButtonEnable = true;
    } else {
      isSubmitButtonEnable = false;
    }
    update();
  }

  /// Change password
  void changePassword() async {
    var response = await _changePasswordPresenter.changePassword(
      loading: true,
      currentPassword: currentPassword,
      newPassword: newPassword,
    );

    if (!response.hasError) {
      await Get.bottomSheet<void>(
        ChangedPasswordDialog(),
        barrierColor: ColorsValue.blackColor.withOpacity(Dimens.pointNine),
        isDismissible: true,
        enableDrag: true,
      );
    } else {
      Utility.showInfoDialog(response, false);
    }
  }
}
