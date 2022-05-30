// coverage:ignore-file
import 'package:omf_netflix/domain/domain.dart';

/// connect to the controller to retrieve the data.
class AccountPresenter {
  AccountPresenter(this._authUseCases);
  final AuthUseCases _authUseCases;

  /// Profile API
  Future<ProfileResponse?> getProfileData() async =>
      _authUseCases.getProfileData();

  /// Get guesttoken form local
  Future<String?> getSecureValue(String key) =>
      _authUseCases.getSecureValue(key);

  /// Check Username API call
  Future<ResponseModel> checkUsername({
    required String username,
    required String trigger,
  }) async =>
      await _authUseCases.checkUsername(
        username: username,
        trigger: trigger,
      );

  /// Validate Phone number
  Future<ResponseModel> validatePhoneNumberApi({
    required String phoneNumber,
    required String countryCode,
  }) async =>
      await _authUseCases.validatePhoneNumberApi(
        phoneNumber: phoneNumber,
        countryCode: countryCode,
      );

  /// Validate Email code
  Future<ResponseModel> validateEmail({
    required String emailId,
    required TypeOfEntry type,
  }) async =>
      _authUseCases.validateEmail(
        emailId: emailId,
        type: type,
      );

        /// edit profile
  Future<ResponseModel> editProfile({
    required String firstName,
    required String lastName,
    required String userName,
    required String countryCode,
    required String phoneNumber,
    required String email,
  }) async =>
      await _authUseCases.editProfile(
          firstName: firstName,
          lastName: lastName,
          userName: userName,
          countryCode: countryCode,
          phoneNumber: phoneNumber,
          email: email);

  /// Send Verification Code
  Future<SendVerificationCodeResponse> sendVerificationCode({
    required String phoneNumber,
    required String countryCode,
    required String trigger,
    required bool isUpdatingPhoneNumber,
  }) async =>
      await _authUseCases.sendVerificationCode(
        phoneNumber: phoneNumber,
        countryCode: countryCode,
        trigger: trigger,
        isUpdatingPhoneNumber: isUpdatingPhoneNumber,
      );

            /// Validate Verification code
  ///
  /// trigger is For 1-register, 2-forgotpassword, 3-change number
  Future<ResponseModel> validateVerificationCode({
    required String phoneNumber,
    required String countryCode,
    required String trigger,
    required String code,
    required String verificationId,
  }) async =>
      _authUseCases.validateVerificationCode(
        phoneNumber: phoneNumber,
        countryCode: countryCode,
        trigger: trigger,
        code: code,
        verificationId: verificationId,
      );

  /// Resend verification code
  /// 
  /// 1 - Register,2 - Forgot Password, 3-change number, 4-login with phone OTP,5 - verify
  Future<ResponseModel> resendVerificationCode({
    required String emailOrPhone,
    required EmailOrPhoneNoType type,
    required String countryCode,
    required String trigger,
  }) async =>
      _authUseCases.resendVerificationCode(
          emailOrPhone: emailOrPhone,
          countryCode: countryCode,
          trigger: trigger,
          type: type);
}
