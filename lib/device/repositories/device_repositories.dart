import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:omf_netflix/data/data.dart';
import 'package:omf_netflix/device/device.dart';
import 'package:omf_netflix/domain/domain.dart';

/// Repositories that communicate with the platform e.g. GPS
class DeviceRepository extends DomainRepository {
  /// initialize flutter secure storage
  final _flutterSecureStorage = const FlutterSecureStorage();

  /// initialize the hive box
  Future<void> init({bool isTest = false}) async {
    if (isTest) {
      Hive.init('HIVE_TEST');
      await Hive.openBox<dynamic>(StringConstants.appName);
    } else {
      await Hive.initFlutter();
      await Hive.openBox<dynamic>(
        StringConstants.appName,
      );
    }
  }

  /// Returns the box in which the data is stored.
  Box _getBox() => Hive.box<dynamic>(StringConstants.appName);

  @override
  void clearData(dynamic key) {
    _getBox().delete(key);
  }

  /// Delete the box
  @override
  void deleteBox() {
    Hive.box<dynamic>(StringConstants.appName).clear();
  }

  /// returns stored string value
  @override
  String getStringValue(String key) {
    var box = _getBox();
    var defaultValue = '';
    if (key == DeviceConstants.localLang) {
      defaultValue = DataConstants.defaultLang;
    }
    String? value = box.get(key, defaultValue: defaultValue) as String;
    return value;
  }

  /// store the data
  @override
  void saveValue(dynamic key, dynamic value) {
    _getBox().put(key, value);
  }

  /// return bool value
  @override
  bool getBoolValue(String key) =>
      _getBox().get(key, defaultValue: false) as bool;

  /// Get data from secure storage
  @override
  Future<String?> getSecuredValue(String key) async {
    var value = await _flutterSecureStorage.read(key: key);
    return value;
  }

  /// Save data in secure storage
  @override
  void saveValueSecurely(String key, String value) {
    _flutterSecureStorage.write(key: key, value: value);
  }

  /// Delete data from secure storage
  @override
  void deleteSecuredValue(String key) {
    _flutterSecureStorage.delete(key: key);
  }

  /// Delete all data from secure storage
  @override
  void deleteAllSecuredValues() {
    _flutterSecureStorage.deleteAll();
  }

  ///Guest Login
  @override
  Future<GuestLoginModel> guestLogin({required bool loader}) {
    throw UnimplementedError();
  }

  ///  Login API call
  ///
  @override
  Future<LoginResponse> loginUser({
    required String email,
    required String password,
    required LoginType loginType,
    required String token,
    required String phoneNumber,
    required String countryCode,
    String? verificationId
  }) {
    throw UnimplementedError();
  }

  /// Logout api
  @override
  Future<void> logout({
    required String authToken,
    required String refreshToken,
  }) {
    throw UnimplementedError();
  }

  /// Signup Api
  @override
  Future<SignupResponse> signupUserModel(
      {required String firstName,
      required String lastName,
      required String userName,
      required String email,
      required String password,
      required String countryCode,
      required String phoneNumber,
      required UserType userType,
      required String token}) {
    throw UnimplementedError();
  }

  /// Forgot Password API
  @override
  Future<ForgotPasswordResponse> forgotPassword({
    required String emailOrPhoneNo,
    required String countryCode,
    required EmailOrPhoneNoType type,
    required String token,
  }) {
    throw UnimplementedError();
  }

  /// Check username API
  @override
  Future<ResponseModel> checkUsername({
    required String username,
    required String trigger,
    required String token,
  }) {
    throw UnimplementedError();
  }

  /// validate phone number API
  @override
  Future<ResponseModel> validatePhoneNumberApi({
    required String phoneNumber,
    required String countryCode,
    required String token,
  }) {
    throw UnimplementedError();
  }

  /// Send Verification Code
  @override
  Future<ResponseModel> sendVerificationCode({
    required String phoneNumber,
    required String countryCode,
    required String trigger,
    required String userId,
    required bool isUpdatingPhoneNumber,
    required String token,
  }) {
    throw UnimplementedError();
  }

  /// Validate Verification code
  @override
  Future<ResponseModel> validateVerificationCode({
    required String phoneNumber,
    required String countryCode,
    required String trigger,
    required String code,
    required String verificationId,
    required String token,
  }) {
    throw UnimplementedError();
  }

  /// Resend Verification code
  @override
  Future<ResponseModel> resendVerificationCode({
    required String emailOrPhone,
    required EmailOrPhoneNoType type,
    required String countryCode,
    required String trigger,
    required String token,
  }) {
    throw UnimplementedError();
  }

  /// Validate email
  @override
  Future<ResponseModel> validateEmail({
    required String emailId,
    required TypeOfEntry type,
    required String token,
  }) {
    throw UnimplementedError();
  }

  /// Config App
  @override
  Future<ConfigResponse> config({required String token}) {
    throw UnimplementedError();
  }

  /// API to verify the social account
  @override
  Future<ResponseModel> socialVerify(
      {required String token,
      required bool loading,
      required String langCode,
      required String id,
      required SocialTrigger trigger}) {
    throw UnimplementedError();
  }

  /// API to get the cognito token
  @override
  Future<ResponseModel> getCognitoToken(
      {required String token, required bool loading}) {
    throw UnimplementedError();
  }

  /// API to search a model by the name
  @override
  Future<ResponseModel> searchModel(
      {required String token,
      required String lan,
      required String searchText,
      required String offset,
      required String limit,
      required bool loading}) {
    throw UnimplementedError();
  }

  /// API to get the popular posts
  @override
  Future<ResponseModel> getPopularPosts(
      {required String token,
      required String lan,
      required bool loading,
      required String pageNumber}) {
    throw UnimplementedError();
  }

  /// API to get the IP of the user
  @override
  Future<ResponseModel> getIp() {
    throw UnimplementedError();
  }

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
  }) {
    throw UnimplementedError();
  }

  /// Report a problem
  @override
  Future<ResponseModel> reportAProblem({
    required String token,
    required String lan,
    required bool loading,
    required String problemText,
    required List<String> attachments,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> changePassword({
    required String token,
    required String lan,
    required bool loading,
    required String currentPassword,
    required String newPassword,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> termsPolicyNsfw({
    required String token,
    required String lan,
    required bool loading,
    required ContentType type,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> editProfile({required String firstName, required String lastName, required String userName, required String countryCode, required String phoneNumber, required String email, required String token,}) {
  
    throw UnimplementedError();
  }

    @override
  Future<ResponseModel> getCollections(
      {required String token,
      required String limit,
      required String offset,
      required bool loading}) {
    throw UnimplementedError();
  }


  @override
  Future<ResponseModel> createCollection(
      {required String token, required String title, required bool loading}) {
    throw UnimplementedError();
  }

    @override
  Future<ResponseModel> bookmarkPost(
      {required String token,
      required String postId,
      required String collectionId,
      required bool loading}) {
    throw UnimplementedError();
  }
}
