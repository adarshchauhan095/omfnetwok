import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:keyboard_utils/keyboard_listener.dart' as key_board;
import 'package:keyboard_utils/keyboard_utils.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:omf_netflix/domain/domain.dart';

/// A controller for [LoginView] to update the UI.
class LoginController extends GetxController {
  LoginController(this._loginPresenter);
  final LoginPresenter _loginPresenter;

  var dObject = Debouncer();

  final _keyboardUtils = KeyboardUtils();

  bool keyboardBackWidget = false;


  /// Phone number =============================================================

  /// variable stores phone number with country code
  var phoneNumber = TextEditingController();

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
    isPhoneNumberChecked.value = false;
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
    enableButton();
  }

  /// Store the validated phone number
  void storePhoneNumber(PhoneNumber phone) {
    countryCode.value = phone.dialCode.toString();
    isPhoneNumberTaken.value = false;
    debugPrint('$countryCode ${phoneNumber.text}');
    enableButton();
  }

  /// Validate Phone number
  ///
  /// 6397308499 already registered number for testing
  Future<void> validatePhoneNumberApi() async {
    var response = await _loginPresenter.validatePhoneNumberApi(
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
    enableButton();
  }

  /// A variable which will be used to update the submit button.
  bool isButtonEnable = false;

  /// Enable or disable the submit based on [emailId] and [password].
  void enableButton() {
    if (isPhoneNumberValid.value && phoneNumber.text.isNotEmpty) {
      isButtonEnable = true;
    } else {
      isButtonEnable = false;
    }
    update();
  }

  /// verification data storing variable
  SendVerificationCodeResponse? sendVerificationCodeResponse;

  /// expiry time
  int expiryTime = 0;

  /// verification id
  String verificationId = '';

  /// Send Verification Code
  ///
  /// trigger is For 1-Register, 2- Login, 3-Change number
  ///
  /// 6397308499 already registered number for testing
  Future<void> sendVerificationCode() async {
    var response = await _loginPresenter.sendVerificationCode(
        phoneNumber: phoneNumber.text.split(' ').join(''),
        countryCode: countryCode.value,
        trigger: '2', // Login
        isUpdatingPhoneNumber: false);
    if (response.data != null) {
      sendVerificationCodeResponse = response;
      expiryTime = sendVerificationCodeResponse!.data!.expiryTime!;
      verificationId = sendVerificationCodeResponse!.data!.verificationId!;
      debugPrint(
          'SendVerification Response is: $expiryTime and $verificationId');
      update();
      RouteManagement.goToLoginOtp(
          countryCode: countryCode.value,
          phoneNumber: phoneNumber.text.split(' ').join(''),
          expiryTime: expiryTime,
          verificationId: verificationId,
          isUpdate: false);
    }
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
    enableSubmitButton();
  }

  /// api coming error for email
  String? responseEmailError;

  /// Validate Email code
  Future<void> validateEmail() async {
    var response = await _loginPresenter.validateEmail(
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
    enableSubmitButton();
  }

  /// Password of the user.
  var password = TextEditingController();

  bool passwordListner = false;

  /// Check if the password is valid or not.
  void checkIfPasswordIsEntered(String value) {
    passwordListner = true;
    enableSubmitButton();
  }

  /// A variable which will be used to update the submit button.
  bool isSubmitButtonEnable = false;

  /// Enable or disable the submit based on [emailId] and [password].
  void enableSubmitButton() {
    if (isEmailValid && emailId.text.isNotEmpty && password.text.isNotEmpty) {
      isSubmitButtonEnable = true;
    } else {
      isSubmitButtonEnable = false;
    }
    update();
  }

  /// Guest Token
  String? guestToken;

  /// Get guesttoken form local
  void getGuestToken() async {
    guestToken = await _loginPresenter.getSecureValue(LocalKeys.authToken);
  }

  /// Guest Login
  Future<void> guestLogin({required bool loader}) async =>
      await _loginPresenter.guestLogin(loader: loader);

  /// Config App
  Future<void> config() async => _loginPresenter.config(type: TokenType.auth);

  ///  Login via Email API
  Future<void> loginUser({required LoginType loginType}) async {
    var response = await _loginPresenter.loginUser(
      email: emailId.text,
      password: password.text,
      loginType: loginType,
      phoneNumber: '',
      countryCode: '',
      verificationId: '',
    );
    if (response.data != null) {
      RouteManagement.goToOffHome();
      await config();
    }
  }

  /// API to get the IP of the user
  Future<void> getIp() async => await _loginPresenter.getIp();

  @override
  void onInit() async {
    _keyboardUtils.add(
      listener: key_board.KeyboardListener(
        willHideKeyboard: () {
          keyboardBackWidget = false;
          update();
        },
        willShowKeyboard: (double keyboardHeight) {
          keyboardBackWidget = true;
          update();
        },
      ),
    );
    await guestLogin(loader: true);
    await getIp();
    super.onInit();
  }
}
