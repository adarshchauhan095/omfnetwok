// coverage:ignore-file
import 'package:omf_netflix/domain/domain.dart';

class LoginOtpPresenter {
  LoginOtpPresenter(this._authUseCases);
  final AuthUseCases _authUseCases;

  

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

        ///  Login API call
  Future<LoginResponse> loginUser({
    required String email,
    required String password,
    required LoginType loginType,
    required String phoneNumber,
    required String countryCode,
    String? verificationId
  }) async =>
      await _authUseCases.loginUser(
        email: email,
        password: password,
        phoneNumber: phoneNumber,
        loginType: loginType,
        countryCode: countryCode,
        verificationId: verificationId,
      );

        /// Config App
  Future<ConfigResponse> config({required TokenType type}) async =>
      _authUseCases.config(type: type);

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
