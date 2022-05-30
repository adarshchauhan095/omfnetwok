// coverage:ignore-file
import 'package:omf_netflix/domain/domain.dart';

class LoginPresenter {
  LoginPresenter(this._authUseCases);
  final AuthUseCases _authUseCases;

  /// Get guesttoken form local
  Future<String?> getSecureValue(String key) =>
      _authUseCases.getSecureValue(key);

        /// API to get the IP of the user
  Future<String?> getIp() async => await _authUseCases.getIp();

  /// Guest Login
  Future<GuestLoginModel> guestLogin({required bool loader}) async =>
      await _authUseCases.guestLogin(loader: loader);

  /// Config App
  Future<ConfigResponse> config({required TokenType type}) async =>
      _authUseCases.config(type: type);

  ///  Login API call
  Future<LoginResponse> loginUser({
    required String email,
    required String password,
    required LoginType loginType,
    required String phoneNumber,
    required String countryCode,
    required String verificationId,
  }) async =>
      await _authUseCases.loginUser(
        email: email,
        password: password,
        loginType: loginType,
        phoneNumber: phoneNumber,
        countryCode: countryCode,
        verificationId: verificationId,
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
          isUpdatingPhoneNumber: isUpdatingPhoneNumber
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
}
