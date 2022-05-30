import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:omf_netflix/domain/domain.dart';

/// An [AccountController], to update the UI for [AccountView]
class AccountController extends GetxController {
  AccountController(this.accountPresenter);
  final AccountPresenter accountPresenter;

  /// Profile Response
  ProfileResponse? profileResponse;

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

  /// Debouncer
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
  }

  /// Check Username API call
  Future<void> checkUsername() async {
    var response = await accountPresenter.checkUsername(
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
  }

  /// Phone number =============================================================

  /// PhoneNumber object
  PhoneNumber? pPhoneNumber;

  /// variable stores only country code
  var countryCode = 'IN'.obs;

  /// country iso code
  var countryIsoCode = '+91'.obs;

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
    enableUpdateButton();
  }

  var isUpdateButtonEnable = false.obs;

  void enableUpdateButton() {
    if (phoneNumber.text.isNotEmpty &&
        !isPhoneNumberTaken.value &&
        !isPhonenumberChecking.value &&
        isPhoneNumberValid.value) {
      isUpdateButtonEnable.value = true;
    } else {
      isUpdateButtonEnable.value = false;
    }
  }

  /// Store the validated phone number
  void storePhoneNumber(PhoneNumber phone) {
    countryCode.value = phone.dialCode.toString();
    countryIsoCode.value = phone.isoCode.toString();
    isPhoneNumberTaken.value = false;
    debugPrint('$countryCode ${phoneNumber.text}');
    enableUpdateButton();
  }

  /// Validate Phone number
  ///
  /// 6397308499 already registered number for testing
  Future<void> validatePhoneNumberApi() async {
    var response = await accountPresenter.validatePhoneNumberApi(
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
    enableUpdateButton();
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
  }

  /// api coming error for email
  String? responseEmailError;

  /// Validate Email code
  Future<void> validateEmail() async {
    var response = await accountPresenter.validateEmail(
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
  }

  /////

  /// An object for ImagePicker
  final ImagePicker picker = ImagePicker();

  /// A variable that stores the [File] from [picker] image/video
  File? imageFile;

  /// method that pick image via [ImageSource] argument may be Camera/Gallery
  void pickImage(ImageSource source) async {
    try {
      final pickedFile = await picker.pickImage(
        source: source,
      );
      if (pickedFile!.path.isEmpty) {
      } else {
        imageFile = File(pickedFile.path.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    update();
  }

  /// true if not editing
  var isSaveText = false.obs;

  /// read only
  var isReadOnly = false.obs;

  /// make profile editable
  void makeProfileEditable() {
    isSaveText.value = true;
    isReadOnly.value = true;
  }

  /// make profile editable
  void saveProfile() {
    isSaveText.value = false;
    isReadOnly.value = false;
    editProfile();
  }

  var imageBaseUrl = ''.obs;

  /// Get guesttoken form local
  Future<void> getSecureValue() async {
    var configImageBaseUrl =
        await accountPresenter.getSecureValue(LocalKeys.imageBaseUrl);
    imageBaseUrl.value = configImageBaseUrl!;
  }

  /// isLoading
  var isLoading = true;

  /// Profile API
  Future<void> getProfileData() async {
    try {
      var response = await accountPresenter.getProfileData();
      if (response!.data != null) {
        isLoading = false;
        profileResponse = response;
        debugPrint('Welcome ${profileResponse!.data}');
        debugPrint(
            '====================================================== ImageURL');
        debugPrint(
            '=========> ${LocalKeys.baseUrl}/${profileResponse!.data!.profilePic}');
        firstName.text = profileResponse!.data!.firstName.toString();
        lastName.text = profileResponse!.data!.lastName.toString();
        userName.text = profileResponse!.data!.username.toString();
        emailId.text = profileResponse!.data!.email.toString();
        phoneNumber.text = profileResponse!.data!.phoneNumber.toString();
        pPhoneNumber = PhoneNumber(
            isoCode: profileResponse!.data!.countryCode.toString(),
            phoneNumber: profileResponse!.data!.phoneNumber.toString());
        update();
      }
    } catch (e) {
      isLoading = true;
      debugPrint(e.toString());
    }
    update();
  }

  /// edit profile
  void editProfile() async {
    try {
      var response = await accountPresenter.editProfile(
          firstName: firstName.text,
          lastName: lastName.text,
          userName: userName.text,
          countryCode: countryCode.value,
          phoneNumber: phoneNumber.text,
          email: emailId.text);
      if (!response.hasError) {
        Utility.showInfoDialog(response, true);
      } else {
        Utility.showInfoDialog(response, false);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
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
    var response = await accountPresenter.sendVerificationCode(
        phoneNumber: phoneNumber.text.split(' ').join(''),
        countryCode: countryCode.value,
        trigger: '3', // Change Number
        isUpdatingPhoneNumber: true);
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
          isUpdate: true);
    }
  }

  @override
  void onInit() async {
    await getProfileData();

    pPhoneNumber = await PhoneNumber.getRegionInfoFromPhoneNumber(
        '${profileResponse!.data!.countryCode}${profileResponse!.data!.phoneNumber}');
    super.onInit();
  }
}
