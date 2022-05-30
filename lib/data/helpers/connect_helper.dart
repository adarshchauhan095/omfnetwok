// coverage:ignore-file
import 'dart:convert';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:omf_netflix/data/data.dart';
import 'package:omf_netflix/device/device.dart';
import 'package:omf_netflix/domain/domain.dart';

/// The helper class which will connect to the world to get the data.
class ConnectHelper {
  ConnectHelper() {
    _init();
  }

  late Dio _dio;

  /// Api wrapper initialization
  final apiWrapper = ApiWrapper();

  /// Device info plugin initialization
  final deviceinfo = DeviceInfoPlugin();

  /// To get android device info
  AndroidDeviceInfo? androidDeviceInfo;

  /// To get iOS device info
  IosDeviceInfo? iosDeviceInfo;

  // IosDeviceInfo? iosDeviceInfo;

  /// initialize the andorid device information
  void _init() async {
    _dio = Dio();
    if (Platform.isAndroid) {
      androidDeviceInfo = await deviceinfo.androidInfo;
    } else {
      iosDeviceInfo = await deviceinfo.iosInfo;
    }
  }

  /// Device id
  String? get deviceId => Platform.isAndroid
      ? androidDeviceInfo?.androidId
      : iosDeviceInfo?.identifierForVendor;

  /// Device make brand
  String? get deviceMake =>
      Platform.isAndroid ? androidDeviceInfo?.brand : 'Apple';

  /// Device Model
  String? get deviceModel =>
      Platform.isAndroid ? androidDeviceInfo?.model : iosDeviceInfo?.model;

  /// Device is a type of 1 for Android and 2 for iOS
  String get deviceTypeCode => Platform.isAndroid ? '1' : '2';

  /// Device OS
  String get deviceOs => Platform.isAndroid ? 'ANDROID' : 'IOS';

  /// guest login
  Future<ResponseModel> guestLogin({required bool loader}) async {
    var data = <String, dynamic>{
      'deviceId': deviceId,
      'deviceMake': deviceMake,
      'deviceModel': deviceModel,
      'deviceTypeCode': deviceTypeCode,
      'deviceOs': deviceOs,
      'appVersion': DeviceConstants.appVersion,
      'browserVersion': '1',
      'lat': 0,
      'long': 0
    };
    var basicAuth =
        'Basic ${base64Encode(utf8.encode('fanzly:admin@fanzly.app'))}';
    return await apiWrapper.makeRequest(
      'guestLogin',
      Request.post,
      data,
      loader,
      {
        'Content-Type': 'application/json',
        'authorization': basicAuth,
        'lan': 'en',
      },
    );
  }

  /// Login API
  Future<ResponseModel> loginUser(
      String email,
      String password,
      String token,
      LoginType loginType,
      String phoneNumber,
      String countryCode,
      String? verificationId) async {
    var data = loginType != LoginType.phoneNumber
        ? {
            'loginType': loginType == LoginType.email
                ? 1
                : loginType == LoginType.facebook
                    ? 2
                    : loginType == LoginType.google
                        ? 3
                        : 4,
            'email': email,
            'password': password,
            'deviceId': deviceId,
            'deviceMake': deviceMake,
            'deviceModel': deviceModel,
            'deviceTypeCode': deviceTypeCode,
            'deviceOs': deviceOs,
            'browserVersion': '1',
          }
        : {
            'loginType': 5,
            'countryCode': countryCode,
            'phoneNumber': phoneNumber,
            'verificationId': verificationId,
            'password': password,
            'deviceId': deviceId,
            'deviceMake': deviceMake,
            'deviceModel': deviceModel,
            'deviceTypeCode': deviceTypeCode,
            'deviceOs': deviceOs,
            'browserVersion': '1',
          };
    return await apiWrapper.makeRequest(
      'login',
      Request.post,
      data,
      true,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': 'en',
      },
    );
  }

  /// Signup API
  ///
  /// // 1 - user, 2 - model
  Future<ResponseModel> signupUserModel(
    String email,
    String password,
    String firstName,
    String lastName,
    String userName,
    String token,
    String countryCode,
    String phoneNumber,
    UserType userType,
  ) async {
    var data = {
      'userType': userType == UserType.user ? 1 : 2,
      'firstName': firstName,
      'lastName': lastName,
      'username': userName,
      'countryCode': countryCode,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
      'profilePic': userType == UserType.user
          ? ''
          : '61b0b19e618d793fda9753d0/profile/1639980943882.jpg',
      'dateOfBirth': userType == UserType.user ? '' : '1997/11/01',
      'gender': 'Male',
      'inviterReferralCode': 'UJ0OWX',
      'socialMediaLink': 'facebook.com',
      'isNSFWAllow': true,
      'deviceId': deviceId,
      'deviceMake': deviceMake,
      'deviceModel': deviceModel,
      'deviceTypeCode': deviceTypeCode,
      'deviceOs': deviceOs,
      'browserVersion': '1'
    };
    return await apiWrapper.makeRequest(
      'signUp',
      Request.post,
      data,
      true,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': 'en',
      },
    );
  }

  ///Logout API
  Future<ResponseModel> logout(
    String authToken,
    String refreshToken,
  ) async {
    var data = {'refreshToken': refreshToken, 'deviceId': deviceId};
    return await apiWrapper.makeRequest(
      'signOut',
      Request.post,
      data,
      true,
      {
        'Content-Type': 'application/json',
        'authorization': authToken,
        'lan': 'en',
      },
    );
  }

  /// Forgot Password API
  Future<ResponseModel> forgotPassword(
    String emailOrPhoneNo,
    EmailOrPhoneNoType type,
    String countryCode,
    String token,
  ) async {
    var data = {
      'emailOrPhone': emailOrPhoneNo,
      'type': type == EmailOrPhoneNoType.phoneNumber ? 1 : 2,
      'countryCode': countryCode
    };
    return await apiWrapper
        .makeRequest('forgotPassword', Request.post, data, true, {
      'Content-Type': 'application/json',
      'authorization': token,
      'lan': 'en',
      'platform': Utility.platFormType()
    });
  }

  /// Check Username is valid or not (1-Signup, 2-Login)
  Future<ResponseModel> checkUsername(
    String trigger,
    String username,
    String token,
  ) async {
    var data = {'username': username, 'trigger': trigger};
    return await apiWrapper.makeRequest(
      'userName?username=$username&trigger=$trigger',
      Request.post,
      data,
      false,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': 'en',
      },
    );
  }

  /// Validate phone number - Api is being use for user can check phone number
  Future<ResponseModel> validatePhoneNumberApi(
    String phoneNumber,
    String countryCode,
    String token,
  ) async {
    var data = {'phoneNumber': phoneNumber, 'countryCode': countryCode};
    return await apiWrapper.makeRequest(
      'validatePhoneNumber',
      Request.post,
      data,
      false,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': 'en',
      },
    );
  }

  /// Send Verification code
  Future<ResponseModel> sendVerificationCode(
    String phoneNumber,
    String countryCode,
    String userId,
    String trigger,
    bool isUpdatingPhoneNumber,
    String token,
  ) async {
    var data = isUpdatingPhoneNumber
        ? {
            'phoneNumber': phoneNumber,
            'countryCode': countryCode,
            'trigger': trigger,
            'userId': userId
          }
        : {
            'phoneNumber': phoneNumber,
            'countryCode': countryCode,
            'trigger': trigger,
          };
    return await apiWrapper.makeRequest(
      'sendVerificationCode',
      Request.post,
      data,
      true,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': 'en',
        'platform': Utility.platFormType()
      },
    );
  }

  /// Validate Verification code
  ///
  /// trigger is For 1-register, 2-forgotpassword, 3-change number
  Future<ResponseModel> validateVerificationCode(
    String phoneNumber,
    String countryCode,
    String trigger,
    String code,
    String verificationId,
    String token,
  ) async {
    var data = {
      'phoneNumber': phoneNumber,
      'countryCode': countryCode,
      'trigger': trigger,
      'verificationId': verificationId,
      'code': int.parse(code),
    };
    return await apiWrapper.makeRequest(
      'validateVerificationCode',
      Request.post,
      data,
      true,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': 'en',
      },
    );
  }

  /// Resend Verification Code
  Future<ResponseModel> resendVerificationCode(
    String emailOrPhone,
    EmailOrPhoneNoType type,
    String countryCode,
    String trigger,
    String token,
  ) async {
    var data = {
      'emailOrPhone': emailOrPhone,
      'type': type == EmailOrPhoneNoType.phoneNumber ? 1 : 2,
      'countryCode': countryCode,
      'trigger': trigger,
    };
    return await apiWrapper.makeRequest(
      'resendVerificationCode',
      Request.post,
      data,
      true,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': 'en',
        'platform': Utility.platFormType()
      },
    );
  }

  /// Validate Email
  Future<ResponseModel> validateEmail(
    String emailId,
    TypeOfEntry type,
    String token,
  ) async {
    var data = {
      'type': type == TypeOfEntry.login ? '1' : '2',
      'email': emailId,
    };
    return await apiWrapper.makeRequest(
      'validateEmail',
      Request.post,
      data,
      false,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': 'en',
      },
    );
  }

  /// Config App
  Future<ResponseModel> config(
    String token,
  ) async {
    var res = await apiWrapper.makeRequest(
      'config',
      Request.get,
      null,
      false,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': 'en',
      },
    );
    return res;
  }

  Future<ResponseModel> socialVerify(
      {required String token,
      required bool loading,
      required String langCode,
      required String id,
      required SocialTrigger trigger}) async {
    var data = {
      'id': id,
      'trigger': trigger == SocialTrigger.facebook
          ? 1
          : trigger == SocialTrigger.google
              ? 2
              : 3
    };

    return await apiWrapper.makeRequest(
      'socialVerify',
      Request.post,
      data,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': langCode,
      },
    );
  }

  /// API to get the cognito auth token
  Future<ResponseModel> getCognitoToken(
          {required String token, required bool loading}) async =>
      await apiWrapper.makeRequest(
        'cognitoToken',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
        },
      );

  /// API to search a model by the name
  Future<ResponseModel> searchModel(
          {required String token,
          required String lan,
          required String searchText,
          required String offset,
          required String limit,
          required bool loading}) async =>
      await apiWrapper.makeRequest(
        'models/search?searchText=$searchText&offset=$offset&limit=$limit',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': lan
        },
      );

  /// API to get the popular posts
  Future<ResponseModel> getPopularPosts(
          {required String token,
          required String lan,
          required bool loading,
          required String pageNumber}) async =>
      await apiWrapper.makeRequest(
        'popularPosts/?page=$pageNumber',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': lan
        },
      );

  /// API to get the IP of the user
  Future<ResponseModel> getIp() async {
    if (await Utility.isNetworkAvailable()) {
      debugPrint('=================================================== get ip');
      var response = await _dio.get<String>('https://api.ipify.org');
      return ResponseModel(
          data: response.data!, hasError: false, errorCode: 200);
    }
    return ResponseModel(data: '0.0.0.0', hasError: true, errorCode: 0);
  }

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
  }) async =>
      await apiWrapper.makeRequest(
        'profile?userId=$userId',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
          'lan': lan,
          'city': city,
          'country': country,
          'ipaddress': ipAddress,
          'latitude': lat,
          'longitude': lng,
          'platform': Utility.platFormType(),
        },
      );

  /// API to Report a Problem
  Future<ResponseModel> reportAProblem({
    required String token,
    required String lan,
    required bool loading,
    required String problemText,
    required List<String> attachments,
  }) async {
    var data = {'problemText': problemText, 'attachments': attachments};
    return await apiWrapper.makeRequest(
      'reportProblem',
      Request.post,
      data,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': lan,
      },
    );
  }

  /// API to Change Password
  Future<ResponseModel> changePassword({
    required String token,
    required String lan,
    required bool loading,
    required String currentPassword,
    required String newPassword,
  }) async {
    var data = {'currentPassword': currentPassword, 'newPassword': newPassword};

    var response = await apiWrapper.makeRequest(
      'password',
      Request.patch,
      data,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': lan,
      },
    );
    debugPrint('${response.data} ${response.errorCode}');
    return response;
  }

  /// API to Terms&Conditions(2), PrivacyPolicy(1), Nsfw(3)
  Future<ResponseModel> termsPolicyNsfw({
    required String token,
    required String lan,
    required bool loading,
    required ContentType type,
  }) async {
    var res = await apiWrapper.makeRequest(
      'htmlPage?type=${type == ContentType.termsAndConditions ? '2' : type == ContentType.privacyPoliciy ? '1' : '3'}&lan=$lan',
      Request.get,
      null,
      loading,
      {
        'authorization': token,
        'lan': lan,
      },
    );
    return res;
  }

  /// Edit Profile API
  Future<ResponseModel> editProfile(
    String firstName,
    String lastName,
    String userName,
    String countryCode,
    String phoneNumber,
    String email,
    String token,
  ) async {
    var data = {
      'firstName': firstName,
      'lastName': lastName,
      'profilePic': '61b0b19e618d793fda9753d0/profile/1639980943882.jpg',
      'bio': 'hello 😜😆',
      'bannerImage': '61b0b19e618d793fda9753d0/profileBanner/1642660025164.jpg',
      'shoutoutPrice': {
        'price': '5',
        'currencyCode': 'DOLLAR',
        'currencySymbol': '\$'
      },
      'isNSFWAllow': true,
      // 'countryCode': countryCode,
      // 'phoneNumber': phoneNumber,
      // 'email': email,
    };

    return await apiWrapper.makeRequest(
      'profile',
      Request.patch,
      data,
      true,
      {
        'Content-Type': 'application/json',
        'authorization': token,
        'lan': 'en',
      },
    );
  }

  /// API to get list of collections
  Future<ResponseModel> getCollections({
    required String token,
    required String limit,
    required String offset,
    required bool loading,
  }) async =>
      await apiWrapper.makeRequest(
        'collection?limit=$limit&offset=$offset',
        Request.get,
        null,
        loading,
        {
          'Content-Type': 'application/json',
          'authorization': token,
        },
      );

  /// API to create a new collection
  Future<ResponseModel> createCollection({
    required String token,
    required String title,
    required bool loading,
  }) async {
    var data = {'title': title};
    return await apiWrapper.makeRequest(
      'collection',
      Request.post,
      data,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
      },
    );
  }

  /// API to bookmark a post
  Future<ResponseModel> bookmarkPost({
    required String token,
    required String postId,
    required String collectionId,
    required bool loading,
  }) async {
    var data = {'postId': postId, 'collectionId': collectionId};
    return await apiWrapper.makeRequest(
      'bookmark',
      Request.post,
      data,
      loading,
      {
        'Content-Type': 'application/json',
        'authorization': token,
      },
    );
  }
}
