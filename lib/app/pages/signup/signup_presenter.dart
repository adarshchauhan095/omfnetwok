// coverage:ignore-file

import 'package:omf_netflix/domain/domain.dart';

class SignupPresenter {
  SignupPresenter(this._authUseCases);
  final AuthUseCases _authUseCases;

  /// Get guesttoken form local
  Future<String?> getSecureValue(String key) =>
      _authUseCases.getSecureValue(key);

  /// Config App
  Future<ConfigResponse> config({required TokenType type}) async =>
      _authUseCases.config(type: type);

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

  /// Signup Api call
  Future<SignupResponse> signupUserModel({
    required String firstName,
    required String lastName,
    required String userName,
    required String email,
    required String password,
    required String countryCode,
    required String phoneNumber,
    required UserType userType,
  }) async =>
      _authUseCases.signupUserModel(
        email: email,
        firstName: firstName,
        lastName: lastName,
        userName: userName,
        password: password,
        countryCode: countryCode,
        phoneNumber: phoneNumber,
        userType: userType,
      );

  /// terms and policy
  Future<TermsAndPolicyResponse> termsPolicyNsfw({
    required String lan,
    required bool loading,
    required ContentType type,
  }) async =>
      await _authUseCases.termsPolicyNsfw(
        lan: lan,
        loading: loading,
        type: type,
      );
}
