// coverage:ignore-file

import 'package:omf_netflix/domain/domain.dart';

/// Abstract classes that define functionality for data and device layers.
///
/// Will be ignored for test since all are static values and would not change.
abstract class DomainRepository {
  /// Get the string value for the [key].
  ///LoginResponsewhich [value] will be saved.
  /// [value] : The value which needs to be saved.
  void saveValue(dynamic key, dynamic value);

  /// Clear data from local storage for [key].
  void clearData(dynamic key);

  /// Delete box
  void deleteBox();

  /// Get stored value
  String getStringValue(String key);

  /// Get the boolean value for the [key].
  ///
  /// [key] : The key whose value is needed.
  bool getBoolValue(String key);

  /// [key] : The key whose value is needed.
  Future<String?> getSecuredValue(String key);

  /// Save the value to the string.
  ///
  /// [key] : The key to which [value] will be saved in secure storage.
  /// [value] : The value which needs to be saved.
  void saveValueSecurely(String key, String value);

  /// Clear data from secure storage for [key].
  void deleteSecuredValue(String key);

  /// Remove all data from secure storage.
  void deleteAllSecuredValues();

  //=============

  /// Guest Login
  Future<dynamic> guestLogin({required bool loader});

  /// User Login API call
  Future<dynamic> loginUser({
    required String email,
    required String password,
    required LoginType loginType,
      required String phoneNumber,
       required String  countryCode,
        required String verificationId,
    required String token,
  });

  /// User/Model Signup API call
  Future<dynamic> signupUserModel({
    required String firstName,
    required String lastName,
    required String userName,
    required String email,
    required String password,
    required String countryCode,
    required String phoneNumber,
    required UserType userType,
    required String token,
  });

  /// Forgot Password API
  Future<dynamic> forgotPassword({
    required String emailOrPhoneNo,
    required String countryCode,
    required EmailOrPhoneNoType type,
    required String token,
  });

  ///logout
  Future<void> logout({
    required String authToken,
    required String refreshToken,
  });

  /// Check Username is valid or not (1-Signup, 2-Login)
  Future<ResponseModel> checkUsername({
    required String username,
    required String trigger,
    required String token,
  });

  /// Validate Phone number
  Future<ResponseModel> validatePhoneNumberApi({
    required String phoneNumber,
    required String countryCode,
    required String token,
  });

  /// Send Verification code
  Future<dynamic> sendVerificationCode({
    required String phoneNumber,
    required String countryCode,
    required String trigger,
    required String userId,
    required bool isUpdatingPhoneNumber,
    required String token,
  });

  /// Validate Verification code
  Future<ResponseModel> validateVerificationCode({
    required String phoneNumber,
    required String countryCode,
    required String trigger,
    required String code,
    required String verificationId,
    required String token,
  });

  /// Resend Verification code
  Future<ResponseModel> resendVerificationCode({
    required String emailOrPhone,
    required EmailOrPhoneNoType type,
    required String countryCode,
    required String trigger,
    required String token,
  });

  /// Validate email code
  Future<ResponseModel> validateEmail({
    required String emailId,
    required TypeOfEntry type,
    required String token,
  });

  /// Config App
  Future<dynamic> config({
    required String token,
  });

  /// Social verify
  Future<ResponseModel> socialVerify(
      {required String token,
      required bool loading,
      required String langCode,
      required String id,
      required SocialTrigger trigger});

  /// API to get the cognito token
  Future<ResponseModel> getCognitoToken(
      {required String token, required bool loading});

  /// API to search a model by the name
  Future<ResponseModel> searchModel(
      {required String token,
      required String lan,
      required String searchText,
      required String offset,
      required String limit,
      required bool loading});

  /// API to get the popular posts
  Future<ResponseModel> getPopularPosts(
      {required String token,
      required String lan,
      required bool loading,
      required String pageNumber});

  /// API to get the IP of the user
  Future<ResponseModel> getIp();

  /// API to get the user profile
  Future<ResponseModel> getProfile({
    required String token,
    required String lan,
    required bool loading,
    required String ipAddress,
    required String city,
    required String country,
    required String lat,
    required String lng,
    required String userId,
  });

  /// API Report a problem
  Future<ResponseModel> reportAProblem({
    required String token,
    required String lan,
    required bool loading,
    required String problemText,
    required List<String> attachments,
  });

  /// API Change password
  Future<ResponseModel> changePassword({
    required String token,
    required String lan,
    required bool loading,
    required String currentPassword,
    required String newPassword,
  });

  /// API to Terms&Conditions(2), PrivacyPolicy(1), Nsfw(3)
  Future<ResponseModel> termsPolicyNsfw({
    required String token,
    required String lan,
    required bool loading,
    required ContentType type,
  });

  /// Edit Profile API
  Future<ResponseModel> editProfile({
   required String firstName,
   required String lastName,
   required String userName,
   required String countryCode,
   required String phoneNumber,
  required String email,
   required String token,
  });

   /// API to create a new collection
  Future<ResponseModel> getCollections({
    required String token,
    required String limit,
    required String offset,
    required bool loading,
  });

    /// API to create a new collection
  Future<ResponseModel> createCollection({
    required String token,
    required String title,
    required bool loading,
  });

   /// API to bookmark a post
  Future<ResponseModel> bookmarkPost({
    required String token,
    required String postId,
    required String collectionId,
    required bool loading,
  });

}
