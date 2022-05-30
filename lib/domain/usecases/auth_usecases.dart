import 'package:flutter/cupertino.dart';
import 'package:omf_netflix/domain/domain.dart';

/// Use case for getting the data from the API
class AuthUseCases {
  AuthUseCases(this.repository);
  final Repository repository;

  void setIsOk() => repository.saveValue(LocalKeys.toHome, true);

  /// Check if the user is logged in or not.
  bool sendToHomeOrNot() {
    var data = repository.getBoolValue(
      LocalKeys.toHome,
    );
    return data;
  }

  /// Delete data stored in locally.
  void deleteSecuredData() {
    repository.deleteAllSecuredValues();
    repository.clearData(LocalKeys.userLoggerIn);
  }

  /// Check if the user is logged in or not.
  bool isUserLoggedIn() {
    var data = repository.getBoolValue(
      LocalKeys.userLoggerIn,
    );
    debugPrint('is user logged in ki value = $data');
    return data;


  }

  /// API to get list of collections
  Future<CollectionListResponse?> getCollections(
          {required String limit,
          required String offset,
          required bool loading}) async =>
      await repository.getCollections(
          limit: limit, offset: offset, loading: loading);


  /// Get stored value form local
  ///
  dynamic getStoredValue(String key) => repository.getStoredValue(key);

  /// Get guesttoken form local
  Future<String?> getSecureValue(String key) => repository.getSecureValue(key);

  /// Guest Login
  Future<GuestLoginModel> guestLogin({required bool loader}) async =>
      await repository.guestLogin(loader: loader);

  ///  Login API call
  Future<LoginResponse> loginUser(
          {required String email,
          required String password,
          required LoginType loginType,
          required String phoneNumber,
          required String countryCode,
          String? verificationId}) async =>
      await repository.loginUser(
          email: email,
          password: password,
          loginType: loginType,
          phoneNumber: phoneNumber,
          countryCode: countryCode,
          verificationId: verificationId);

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
      repository.signupUserModel(
        email: email,
        firstName: firstName,
        lastName: lastName,
        userName: userName,
        password: password,
        phoneNumber: phoneNumber,
        countryCode: countryCode,
        userType: userType,
      );

  /// Logout API call
  Future<void> logout() async => await repository.logout();

  /// Forgot Password API
  Future<ForgotPasswordResponse> forgotPassword({
    required String emailOrPhoneNo,
    required String countryCode,
    required EmailOrPhoneNoType type,
  }) async =>
      await repository.forgotPassword(
        emailOrPhoneNo: emailOrPhoneNo,
        countryCode: countryCode,
        type: type,
      );

  /// Check Username API call
  Future<ResponseModel> checkUsername({
    required String username,
    required String trigger,
  }) async =>
      await repository.checkUsername(
        username: username,
        trigger: trigger,
      );

  /// Validate Phone number
  Future<ResponseModel> validatePhoneNumberApi({
    required String phoneNumber,
    required String countryCode,
  }) async =>
      await repository.validatePhoneNumberApi(
        phoneNumber: phoneNumber,
        countryCode: countryCode,
      );

  /// Send Verification Code
  Future<SendVerificationCodeResponse> sendVerificationCode({
    required String phoneNumber,
    required String countryCode,
    required String trigger,
    required bool isUpdatingPhoneNumber,
  }) async =>
      await repository.sendVerificationCode(
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
      repository.validateVerificationCode(
        phoneNumber: phoneNumber,
        countryCode: countryCode,
        trigger: trigger,
        code: code,
        verificationId: verificationId,
      );

  /// Resend verification code
  Future<ResponseModel> resendVerificationCode({
    required String emailOrPhone,
    required EmailOrPhoneNoType type,
    required String countryCode,
    required String trigger,
  }) async =>
      repository.resendVerificationCode(
          emailOrPhone: emailOrPhone,
          countryCode: countryCode,
          trigger: trigger,
          type: type);

  /// Validate Email code
  Future<ResponseModel> validateEmail({
    required String emailId,
    required TypeOfEntry type,
  }) async =>
      repository.validateEmail(
        emailId: emailId,
        type: type,
      );

  /// Config Api
  Future<ConfigResponse> config({required TokenType type}) async =>
      repository.config(type: type);

  /// API to get the IP of the user
  Future<String?> getIp() async => await repository.getIp();

  /// Profile API
  Future<ProfileResponse?> getProfileData() async =>
      await repository.getProfileData(loading: false);

  /// Report a Problem
  Future<ResponseModel> reportAProblem(
          {required bool loading,
          required String problemText,
          required List<String> attachments}) async =>
      await repository.reportAProblem(
          loading: loading, problemText: problemText, attachments: attachments);

  /// Change password
  Future<ResponseModel> changePassword(
          {required bool loading,
          required String currentPassword,
          required String newPassword}) async =>
      await repository.changePassword(
          loading: loading,
          currentPassword: currentPassword,
          newPassword: newPassword);

  /// terms and policy
  Future<TermsAndPolicyResponse> termsPolicyNsfw({
    required String lan,
    required bool loading,
    required ContentType type,
  }) async =>
      await repository.termsPolicyNsfw(
        lan: lan,
        loading: loading,
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
      await repository.editProfile(
          firstName: firstName,
          lastName: lastName,
          userName: userName,
          countryCode: countryCode,
          phoneNumber: phoneNumber,
          email: email);

            /// API to create a collection
  Future<ResponseModel> createCollection({
  
    required String title,
    required bool loading,
  }) async =>
      await repository.createCollection(
           title: title, loading: loading);



 /// API to bookmark a post
  Future<ResponseModel> bookmarkPost({
    required String postId,
    required String collectionId,
    required bool loading,
  }) async =>
      await repository.bookmarkPost(
          postId: postId, collectionId: collectionId, loading: loading);

}
