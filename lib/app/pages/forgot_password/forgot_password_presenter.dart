// coverage:ignore-file

import 'package:omf_netflix/domain/domain.dart';

class ForgotPasswordPresenter {
  ForgotPasswordPresenter(this._authUseCases);
  final AuthUseCases _authUseCases;

  /// Get guesttoken form local
  Future<String?> getSecureValue(String key) =>
      _authUseCases.getSecureValue(key);

              /// Validate Email code
  Future<ResponseModel> validateEmail({
    required String emailId,
    required TypeOfEntry type,
  }) async =>
      _authUseCases.validateEmail(
        emailId: emailId,
        type: type,
      );
      
  /// Forgot Password API
  Future<ForgotPasswordResponse> forgotPassword({
    required String emailOrPhoneNo,
    required String countryCode,
    required EmailOrPhoneNoType type,
  }) async =>
      await _authUseCases.forgotPassword(
        emailOrPhoneNo: emailOrPhoneNo,
        countryCode: countryCode,
        type: type,
      );
}
