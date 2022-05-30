import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:omf_netflix/domain/domain.dart';

/// A controller for [SignupView] to update the UI.
class SignupController extends GetxController {
  SignupController(this._signupPresenter);
  final SignupPresenter _signupPresenter;

  /// variable stores firstname of user.
  var firstName = TextEditingController();

  /// variable stores lastname of user.
  var lastName = TextEditingController();

  /// variable stores username of user.
  var userName = TextEditingController();

  /// variable stores phone number with country code
  var phoneNumber = TextEditingController();

  /// Email id of the user
  var emailId = TextEditingController();

  /// Password of the user.
  var password = TextEditingController();

  var dObject = Debouncer();

  /// FirstName ================================================================

  /// [firstNameError] will null if [firstName] is valid.
  var firstNameError = ''.obs;

  /// method to validate [firstName] of user.
 void enterFirstName(String value) {
    if (value.isNotEmpty) {
      firstNameError.value = '';
    } else {
      firstNameError.value = 'fieldRequired'.tr;
    }
    debugPrint('FirstName: ${firstName.text}');
    enableSubmitButton();
  }

  /// LastName =================================================================

  /// [lastNameError] will null if [lastName] is valid.
  var lastNameError = ''.obs;

  /// method to validate [lastName] of user.
  void enterLastName(String value) {
    if (value.isNotEmpty) {
      lastNameError.value = '';
    } else {
      lastNameError.value = 'fieldRequired'.tr;
    }
    debugPrint('LastName: ${lastName.text}');
    enableSubmitButton();
  }

  /// UserName =================================================================

  /// [isUsernameValid] is true when [userName] is valid.
  var isUsernameValid = false.obs;

  /// [userNameError] will null if [userName] is valid.
  var userNameError = ''.obs;

  /// true if user name is checked via API
  var isUsernameChecked = false.obs;

  /// true if user name is checking via API
  var isUsernameChecking = false.obs;

  /// method to validate [userName] of user.
  void enterUserName(String value) async {
    isUsernameChecking.value = true;
    userNameError.value = '';
    Future.delayed(
      const Duration(seconds: 2),
      () async {
        await checkUsername();
      },
    );
    debugPrint('UserName: ${userName.text}');
    enableSubmitButton();
  }

  /// Check Username API call
  Future<void> checkUsername() async {
    var response = await _signupPresenter.checkUsername(
      username: userName.text,
      trigger: '2',
    );
    if (!response.hasError) {
      isUsernameValid.value = true;
      isUsernameChecked.value = true;
      isUsernameChecking.value = false;
    } else {
      isUsernameValid.value = false;
      isUsernameChecked.value = true;
      isUsernameChecking.value = false;
    }
    enableSubmitButton();
  }

  /// Phone number =============================================================

  /// PhoneNumber object
  var pPhoneNumber = PhoneNumber(isoCode: 'IN');

  /// variable stores only country code
  var countryCode = 'IN'.obs;

  /// check phone number is valid or not
  var isPhoneNumberValid = true.obs;

  /// Check if the phonenumber is taken or not.
  var isPhoneNumberTaken = true.obs;

  /// Check if the phonenumber is checked or not.
  var isPhoneNumberChecked = false.obs;

  /// true if phonenumber is checking via API
  var isPhonenumberChecking = false.obs;

  /// phonenumber valid or not
  void checkPhoneNumberValidity(bool isValid) async {
    isPhoneNumberValid.value = isValid;
    debugPrint(isValid.toString());
    if (isPhoneNumberValid.value) {
      isPhonenumberChecking.value = true;
      Future.delayed(
        const Duration(seconds: 3),
        () async {
          await validatePhoneNumberApi();
        },
      );
    }
    enableSubmitButton();
  }

  /// Store the validated phone number
  void storePhoneNumber(PhoneNumber phone) {
    countryCode.value = phone.dialCode.toString();
    isPhoneNumberTaken.value = false;
    debugPrint('$countryCode ${phoneNumber.text}');
    enableSubmitButton();
  }

  /// Validate Phone number
  ///
  /// 6397308499 already registered number for testing
  Future<void> validatePhoneNumberApi() async {
    var response = await _signupPresenter.validatePhoneNumberApi(
      phoneNumber: phoneNumber.text,
      countryCode: countryCode.value,
    );
    debugPrint(response.data);
    if (!response.hasError) {
      isPhonenumberChecking.value = false;
      isPhoneNumberChecked.value = true;
      isPhoneNumberTaken.value = false;
    } else {
      isPhonenumberChecking.value = false;
      isPhoneNumberChecked.value = true;
      isPhoneNumberTaken.value = true;
    }
    enableSubmitButton();
  }

  /// Password and Confirm Password ============================================

  /// Variable used to change password
  /// visibility through [passwordVisibility]
  var isPasswordVisible = false.obs;

  /// Used to Cahange the password visibility
  void passwordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  /// Variable used to change confirmpassword
  /// visibility through [passwordVisibility]
  var isConfirmPasswordVisible = false.obs;

  /// Used to Cahange the confirmpassword visibility
  void confirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  /// List of password errors.
  var passwordErrors = ''.obs;

  /// Is true when the password is valid.
  var isPasswordValid = true.obs;

  var onPasswordListening = false.obs;

  /// Check if the password is valid or not.
  void checkIfPasswordIsValid(String value) {
    onPasswordListening.value = true;
    passwordErrors.value = Utility.validatePassword(value) == null
        ? ''
        : Utility.validatePassword(value)!;
    isPasswordValid.value = passwordErrors.value == '' ? true : false;
    // checkConfirmPassword(confirmPassword.text);
    enableSubmitButton();
  }

  /// List of password errors.
  var confirmPasswordErrors = ''.obs;

  /// confirm pas
  // var confirmPassword = TextEditingController();

  /// Is true when the password is valid.
  var isConfirmPasswordValid = true.obs;

  /// Check if the password and confirm password is same.
  void checkConfirmPassword(String value) {
    if (password.text == value) {
      confirmPasswordErrors.value = '';
      isConfirmPasswordValid.value = true;
    } else {
      confirmPasswordErrors.value = 'passwordAndConfirmPasswordShouldBeSame'.tr;
      isConfirmPasswordValid.value = false;
    }

    enableSubmitButton();
  }

  /// Email ====================================================================

  /// Error text for email form field.
  var emailErrorText = ''.obs;

  /// Is true when the email is valid.
  var isEmailValid = true.obs;

  /// true if email is taken
  var isEmailIdTaken = false.obs;

  /// true if email is checked
  var isEmailIdChecked = false.obs;

  /// true if email is checking vie API
  var isEmailChecking = false.obs;

  /// Check if the email is valid or not.
  void checkIfEmailIsValid(String value) {
    isEmailValid.value = Utility.emailValidator(value);
    isEmailIdTaken.value = false;
    emailErrorText.value =
        !isEmailValid.value ? 'pleaseEnterValidEmail'.tr : '';
    if (isEmailValid.value) {
      isEmailChecking.value = true;
      Future.delayed(
        const Duration(seconds: 4),
        () async {
          await validateEmail();
        },
      );
    }
    enableSubmitButton();
  }

  /// api coming error for email
  String? responseEmailError;

  /// Validate Email code
  Future<void> validateEmail() async {
    var response = await _signupPresenter.validateEmail(
      emailId: emailId.text,
      type: TypeOfEntry.signup,
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
    enableSubmitButton();
  }

  /// Terms And Conditions =====================================================

  /// is true when terms and policy is checked
  var isTermsAndPolicyAccept = false.obs;

  /// used to check uncheck terms and policy
  /// and enable and disable the submit button
  void termsAndPolicy() {
    isTermsAndPolicyAccept.value = !isTermsAndPolicyAccept.value;
    enableSubmitButton();
  }

  /// Submit Button ============================================================

  /// A variable which will be used to update the submit button.
  var isSubmitButtonEnable = false.obs;

  /// Enable or disable the submit based on [emailId] and [password].
  void enableSubmitButton() {
    if (firstName.text.isNotEmpty &&
        lastName.text.isNotEmpty &&
        phoneNumber.text.isNotEmpty &&
        isPhoneNumberValid.value &&
        emailId.text.isNotEmpty &&
        isEmailValid.value &&
        password.text.isNotEmpty &&
        isPasswordValid.value &&
        isConfirmPasswordValid.value &&
        isTermsAndPolicyAccept.value) {
      isSubmitButtonEnable.value = true;
    } else {
      isSubmitButtonEnable.value = false;
    }

    debugPrint(isSubmitButtonEnable.value.toString());
  }

  /// Reset all values
  void resetAllValues() {
    firstName.clear();
    lastName.clear();
    userName.clear();
    phoneNumber.clear();
    emailId.clear();
    password.clear();
    isUsernameValid.value = false;
    isUsernameChecked.value = false;
    isUsernameChecking.value = false;
    isPhoneNumberValid.value = true;
    isPhoneNumberTaken.value = true;
    isPhoneNumberChecked.value = false;
    isEmailValid.value = true;
    isEmailIdTaken.value = false;
    isEmailIdChecked.value = false;
    update();
  }

  /// APIs

  /// Guest Token
  String? guestToken;

  /// Get guesttoken form local
 void getGuestToken() async {
    guestToken = await _signupPresenter.getSecureValue(LocalKeys.authToken);
  }

  /// Config App
  Future<void> config() async => _signupPresenter.config(type: TokenType.auth);

  ///  Login As Guest First
  Future<void> loginAsGuestFirst() async {
    await signupUserModel();
  }

  /// Signup Api call
  Future<void> signupUserModel() async {
    if (!isPhoneNumberTaken.value && !isEmailIdTaken.value) {
      var response = await _signupPresenter.signupUserModel(
        email: emailId.text,
        firstName: firstName.text,
        lastName: lastName.text,
        userName: userName.text,
        password: password.text,
        countryCode: countryCode.value,
        phoneNumber: phoneNumber.text,
        userType: UserType.user,
      );
      if (response.data != null) {
        RouteManagement.goToOffLogin();
        Get.snackbar<void>('Message', 'Signup Successfully',
            colorText: ColorsValue.whiteColor,
            backgroundColor: ColorsValue.greenColor,
            snackPosition: SnackPosition.BOTTOM);
        resetAllValues();
      }
    }
  }

  var termsPageType = 1.obs;

  var termsPageContent = ''.obs;

  /// terms and policy
  Future<void> termsPolicyNsfw({required ContentType contentType}) async {
    var response = await _signupPresenter.termsPolicyNsfw(
      lan: 'en',
      loading: true,
      type: contentType,
    );
    if (response.data != null) {
      debugPrint(response.data!.pageContent);
      termsPageContent.value = response.data!.pageContent!;
      termsPageType.value =
          contentType == ContentType.termsAndConditions ? 2 : 1;
      RouteManagement.goToTermsAndPolicy();
    }
  }
}
