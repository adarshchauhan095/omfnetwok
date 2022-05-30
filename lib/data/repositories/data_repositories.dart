import 'package:flutter/material.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:omf_netflix/data/data.dart';
import 'package:omf_netflix/domain/domain.dart';

/// Repositories (retrieve data, heavy processing etc..)
class DataRepository extends DomainRepository {
  /// [connectHelper] : A connection helper which will connect to the
  /// remote to get the data.
  DataRepository(this.connectHelper);

  final ConnectHelper connectHelper;

  @override
  void clearData(dynamic key) {
    throw UnimplementedError();
  }

  /// Delete the box
  @override
  void deleteBox() {
    throw UnimplementedError();
  }

  /// returns stored string value
  @override
  String getStringValue(String key) {
    throw UnimplementedError();
  }

  /// store the data
  @override
  void saveValue(dynamic key, dynamic value) {
    throw UnimplementedError();
  }

  /// return bool value
  @override
  bool getBoolValue(String key) => throw UnimplementedError();

  /// Get data from secure storage
  @override
  Future<String?> getSecuredValue(String key) async {
    throw UnimplementedError();
  }

  /// Save data in secure storage
  @override
  void saveValueSecurely(String key, String value) {
    throw UnimplementedError();
  }

  /// Delete data from secure storage
  @override
  void deleteSecuredValue(String key) {
    throw UnimplementedError();
  }

  /// Delete all data from secure storage
  @override
  void deleteAllSecuredValues() {
    throw UnimplementedError();
  }

  /// Guest Login
  @override
  Future<ResponseModel> guestLogin({required bool loader}) async {
    var response = await connectHelper.guestLogin(loader: loader);
    return response;
  }

  /// Login Api
  @override
  Future<ResponseModel> loginUser(
          {required String email,
          required String password,
          required LoginType loginType,
            required String countryCode,
            required String phoneNumber,
            String? verificationId,
          required String token}) async =>
      await connectHelper.loginUser(email, password, token, loginType, phoneNumber, countryCode, verificationId);


  /// Logout Api
  @override
  Future<void> logout(
      {required String authToken, required String refreshToken}) async {
    var response = await connectHelper.logout(authToken, refreshToken);
    if (!response.hasError) {
      // Utility.showMessage(
      //     'Logged out', MessageType.success, () => null, 'okay'.tr);
    } else {
      Utility.showInfoDialog(response, false);
    }
  }

  /// Signup API
  @override
  Future<ResponseModel> signupUserModel({
    required String firstName,
    required String lastName,
    required String userName,
    required String email,
    required String password,
    required String countryCode,
    required String phoneNumber,
    required UserType userType,
    required String token,
  }) async =>
      await connectHelper.signupUserModel(email, password, firstName, lastName,
          userName, token, countryCode, phoneNumber, userType);

  /// ForgotPassword API
  @override
  Future<ResponseModel> forgotPassword({
    required String emailOrPhoneNo,
    required String countryCode,
    required EmailOrPhoneNoType type,
    required String token,
  }) async =>
      await connectHelper.forgotPassword(
          emailOrPhoneNo, type, countryCode, token);

  /// Check username
  @override
  Future<ResponseModel> checkUsername({
    required String username,
    required String trigger,
    required String token,
  }) async =>
      await connectHelper.checkUsername(trigger, username, token);

  /// Validate phone number
  @override
  Future<ResponseModel> validatePhoneNumberApi({
    required String phoneNumber,
    required String countryCode,
    required String token,
  }) async =>
      await connectHelper.validatePhoneNumberApi(
          phoneNumber, countryCode, token);

  /// Send Verification code
  @override
  Future<ResponseModel> sendVerificationCode({
    required String phoneNumber,
    required String countryCode,
    required String trigger,
    required String userId,
    required bool isUpdatingPhoneNumber,
    required String token,
  }) async {
    var response = await connectHelper.sendVerificationCode(
      phoneNumber,
      countryCode,
      userId,
      trigger,
      isUpdatingPhoneNumber,
      token,
    );
    var sendVerificationCodeResponse =
        sendVerificationCodeResponseFromJson(response.data);
    debugPrint(
        'SendVerificationCode Response message: ${sendVerificationCodeResponse.message}');
    return response;
  }

  /// Validate Verification code
  ///
  /// trigger is For 1-register, 2-forgotpassword, 3-change number
  @override
  Future<ResponseModel> validateVerificationCode({
    required String phoneNumber,
    required String countryCode,
    required String trigger,
    required String code,
    required String verificationId,
    required String token,
  }) async {
    var response = await connectHelper.validateVerificationCode(
      phoneNumber,
      countryCode,
      trigger,
      code,
      verificationId,
      token,
    );
    return response;
  }

  /// Resend Verification code
  @override
  Future<ResponseModel> resendVerificationCode({
    required String emailOrPhone,
    required EmailOrPhoneNoType type,
    required String countryCode,
    required String trigger,
    required String token,
  }) async {
    var response = await connectHelper.resendVerificationCode(
      emailOrPhone,
      type,
      countryCode,
      trigger,
      token,
    );
    return response;
  }

  /// Validate Email
  @override
  Future<ResponseModel> validateEmail({
    required String emailId,
    required TypeOfEntry type,
    required String token,
  }) async {
    var response = await connectHelper.validateEmail(
      emailId,
      type,
      token,
    );
    return response;
  }

  /// Config App
  @override
  Future<ResponseModel> config({required String token}) async =>
      await connectHelper.config(token);

  @override
  Future<ResponseModel> socialVerify(
      {required String token,
      required bool loading,
      required String langCode,
      required String id,
      required SocialTrigger trigger}) async {
    var response = await connectHelper.socialVerify(
        token: token,
        loading: loading,
        langCode: langCode,
        id: id,
        trigger: trigger);
    return response;
  }

  @override
  Future<ResponseModel> getCognitoToken(
      {required String token, required bool loading}) async {
    var response =
        await connectHelper.getCognitoToken(token: token, loading: loading);
    return response;
  }

  /// API to search a model by the name
  @override
  Future<ResponseModel> searchModel(
      {required String token,
      required String lan,
      required String searchText,
      required String offset,
      required String limit,
      required bool loading}) async {
    var response = await connectHelper.searchModel(
        token: token,
        lan: lan,
        searchText: searchText,
        offset: offset,
        limit: limit,
        loading: loading);
    return response;
  }

  /// API to get the popular posts
  @override
  Future<ResponseModel> getPopularPosts(
      {required String token,
      required String lan,
      required bool loading,
      required String pageNumber}) async {
    var response = await connectHelper.getPopularPosts(
        token: token, lan: lan, loading: loading, pageNumber: pageNumber);
    return response;
  }

  /// API to get the IP of the user
  @override
  Future<ResponseModel> getIp() async => await connectHelper.getIp();

  /// API to get the profile data
  @override
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
  }) async {
    var response = await connectHelper.getProfile(
      token: token,
      lan: lan,
      loading: loading,
      ipAddress: ipAddress,
      city: city,
      country: country,
      lat: lat,
      lng: lng,
      userId: userId,
    );
    return response;
  }

  /// Report a Problem
  @override
  Future<ResponseModel> reportAProblem(
          {required String token,
          required String lan,
          required bool loading,
          required String problemText,
          required List<String> attachments}) async =>
      await connectHelper.reportAProblem(
        token: token,
        lan: lan,
        loading: loading,
        problemText: problemText,
        attachments: attachments,
      );

  /// Change password
  @override
  Future<ResponseModel> changePassword({
    required String token,
    required String lan,
    required bool loading,
    required String currentPassword,
    required String newPassword,
  }) async =>
      await connectHelper.changePassword(
        token: token,
        lan: lan,
        loading: loading,
        currentPassword: currentPassword,
        newPassword: newPassword,
      );

  @override
  Future<ResponseModel> termsPolicyNsfw({
    required String token,
    required String lan,
    required bool loading,
    required ContentType type,
  }) async =>
      await connectHelper.termsPolicyNsfw(
        token: token,
        lan: lan,
        loading: loading,
        type: type,
      );

  @override
  Future<ResponseModel> editProfile({
    required String firstName,
    required String lastName,
    required String userName,
    required String countryCode,
    required String phoneNumber,
    required String email,
    required String token,
  }) async =>
      await connectHelper.editProfile(firstName, lastName, userName,
          countryCode, phoneNumber, email, token);

            @override
  Future<ResponseModel> getCollections(
          {required String token,
          required String limit,
          required String offset,
          required bool loading}) async =>
      await connectHelper.getCollections(
          token: token, limit: limit, offset: offset, loading: loading);


            /// API to create a collection if not available
  @override
  Future<ResponseModel> createCollection(
          {required String token,
          required String title,
          required bool loading}) async =>
      await connectHelper.createCollection(
          token: token, title: title, loading: loading);

            /// API to bookmark a post
  @override
  Future<ResponseModel> bookmarkPost(
          {required String token,
          required String postId,
          required String collectionId,
          required bool loading}) async =>
      await connectHelper.bookmarkPost(
          token: token,
          postId: postId,
          collectionId: collectionId,
          loading: loading);

}
