import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:omf_netflix/data/data.dart';
import 'package:omf_netflix/device/device.dart';
import 'package:omf_netflix/domain/domain.dart';

/// The main repository which will get the data from [DeviceRepository] or the
/// [DataRepository].
class Repository {
  /// [_deviceRepository] : the local repository.
  /// [_dataRepository] : the data repository like api and all.
  Repository(this._deviceRepository, this._dataRepository);

  final DeviceRepository _deviceRepository;
  final DataRepository _dataRepository;

  /// Clear data from local storage for [key].
  void clearData(dynamic key) {
    try {
      _deviceRepository.clearData(
        key,
      );
    } catch (_) {
      _dataRepository.clearData(
        key,
      );
    }
  }

  /// Get the string value for the [key].
  ///
  /// [key] : The key whose value is needed.
  String getStringValue(String key) {
    try {
      return _deviceRepository.getStringValue(
        key,
      );
    } catch (_) {
      return _dataRepository.getStringValue(
        key,
      );
    }
  }

  /// Save the value to the string.
  ///
  /// [key] : The key to which [value] will be saved.
  /// [value] : The value which needs to be saved.
  void saveValue(dynamic key, dynamic value) {
    try {
      _deviceRepository.saveValue(
        key,
        value,
      );
    } catch (_) {
      _dataRepository.saveValue(
        key,
        value,
      );
    }
  }

  /// Get the bool value for the [key].
  ///
  /// [key] : The key whose value is needed.
  bool getBoolValue(String key) {
    try {
      return _deviceRepository.getBoolValue(
        key,
      );
    } catch (_) {
      return _dataRepository.getBoolValue(
        key,
      );
    }
  }

  /// Get the secure value for the [key].
  /// [key] : The key whose value is needed.
  Future<String?> getSecureValue(String key) {
    try {
      return _deviceRepository.getSecuredValue(
        key,
      );
    } catch (_) {
      return _dataRepository.getSecuredValue(
        key,
      );
    }
  }

   /// Get the stored value for the [key].
  ///
  /// [key] : The key whose value is needed.
  bool getStoredValue(String key) {
    try {
      return _deviceRepository.getBoolValue(
        key,
      );
    } catch (_) {
      return _dataRepository.getBoolValue(
        key,
      );
    }
  }

  /// Save the value to the string.
  ///
  /// [key] : The key to which [value] will be saved.
  /// [value] : The value which needs to be saved.
  void saveSecureValue(String key, String value) {
    try {
      _deviceRepository.saveValueSecurely(
        key,
        value,
      );
    } catch (_) {
      _dataRepository.saveValueSecurely(
        key,
        value,
      );
    }
  }

  /// Clear data from secure storage for [key].
  void deleteSecuredValue(String key) {
    try {
      _deviceRepository.deleteSecuredValue(
        key,
      );
    } catch (_) {
      _dataRepository.deleteSecuredValue(
        key,
      );
    }
  }

  /// Clear all data from secure storage .
  void deleteAllSecuredValues() {
    try {
      _deviceRepository.deleteAllSecuredValues();
    } catch (_) {
      _dataRepository.deleteAllSecuredValues();
    }
  }

  /// Guest Login
  Future<GuestLoginModel> guestLogin({required bool loader}) async {
    try {
      var response = await _dataRepository.guestLogin(loader: loader);
      GuestLoginModel? guestLoginData;
      if (!response.hasError) {
        guestLoginData = guestLoginModelFromJson(response.data);
        saveSecureValue(
            LocalKeys.authToken, guestLoginData.data.accessToken.toString());

        var getLocation = await Utility.getCurrentLocation();
        var position = await Utility.getCurrentLatLng();
        var locationDetails = await Utility.getCurrentLocationAndSave();
        Utility.printLog(
            'city: ${getLocation.city}, country: ${getLocation.country}, lat: ${getLocation.latitude}, long: ${getLocation.longitude}');

        var lat = position.latitude.toString();
        var lng = position.longitude.toString();

        Utility.printLog('POSITION ============== lat: $lat, long: $lng');

        var city = locationDetails.city;
        var country = locationDetails.country;

        Utility.printLog(
            'LOCATION Details ============== lat: $city, long: $country');

        saveSecureValue(LocalKeys.city, city);
        saveSecureValue(LocalKeys.country, country);
        saveSecureValue(LocalKeys.lat, lat);
        saveSecureValue(LocalKeys.lng, lng);
      } else {
        Utility.showInfoDialog(response, false);
      }
      return guestLoginData!;
    } catch (e) {
      return await _deviceRepository.guestLogin(loader: loader);
    }
  }

  /// Method for user login from the [DataRepository] and [DeviceRepository]
  Future<LoginResponse> loginUser(
      {required String email,
      required String password,
      required LoginType loginType,
      required String phoneNumber,
      required String countryCode,
      String? verificationId}) async {
    var token = await getSecureValue(LocalKeys.authToken);
    try {
      var response = await _dataRepository.loginUser(
        email: email,
        password: password,
        loginType: loginType,
        phoneNumber: phoneNumber,
        countryCode: countryCode,
        verificationId: verificationId,
        token: token!,
      );
      LoginResponse? loginResponse;
      if (!response.hasError) {
        loginResponse = loginResponseFromJson(response.data);

        saveValue(LocalKeys.isAppExists, true);
        
        saveSecureValue(
            LocalKeys.refreshToken, loginResponse.data!.token!.refreshToken!);
        
        saveSecureValue(
            LocalKeys.authToken, loginResponse.data!.token!.accessToken!);
        
        saveSecureValue(LocalKeys.userId, loginResponse.data!.user!.id!);
        
        saveSecureValue(LocalKeys.userType,
            loginResponse.data!.user!.userTypeCode!.toString());
        
        saveSecureValue(
            LocalKeys.fcmTopic, loginResponse.data!.user!.fcmTopic!);
        
        saveSecureValue(
            LocalKeys.streamUserId, loginResponse.data!.user!.streamUserId!);
        
        saveSecureValue(LocalKeys.defaultCurrency,
            loginResponse.data!.user!.defaultCurrency!);
      } else {
        Utility.showInfoDialog(response, false);
      }
      return loginResponse!;
    } catch (_) {
      return await _deviceRepository.loginUser(
        email: email,
        password: password,
        loginType: loginType,
        phoneNumber: phoneNumber,
        countryCode: countryCode,
        verificationId: verificationId,
        token: token!,
      );
    }
  }

  /// Method for user/model signup from the [DataRepository] and [DeviceRepository]
  Future<SignupResponse> signupUserModel({
    required String firstName,
    required String lastName,
    required String userName,
    required String email,
    required String password,
    required String countryCode,
    required String phoneNumber,
    required UserType userType,
  }) async {
    var token = await getSecureValue(LocalKeys.authToken);
    try {
      var response = await _dataRepository.signupUserModel(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName,
          userName: userName,
          phoneNumber: phoneNumber,
          countryCode: countryCode,
          token: token!,
          userType: userType);
      SignupResponse? signupResponse;
      if (!response.hasError) {
        signupResponse = signupResponseFromJson(response.data);
        debugPrint('Signup Response message: ${signupResponse.message}');
      } else {
        Utility.showInfoDialog(response, false);
      }
      return signupResponse!;
    } catch (_) {
      return await _deviceRepository.signupUserModel(
        firstName: firstName,
        lastName: lastName,
        userName: userName,
        email: email,
        password: password,
        phoneNumber: phoneNumber,
        countryCode: countryCode,
        userType: userType,
        token: token!,
      );
    }
  }

  /// Method for user logout from the [DataRepository] and [DeviceRepository]
  Future<void> logout() async {
    var authToken = await getSecureValue(LocalKeys.authToken);
    var refreshToken = await getSecureValue(LocalKeys.refreshToken);
    try {
     clearData(StringConstants.appName);
      clearData(LocalKeys.isAppExists);
      deleteAllSecuredValues();
      return await _dataRepository.logout(
        authToken: authToken!,
        refreshToken: refreshToken!,
      );
    } catch (_) {
      return await _deviceRepository.logout(
        authToken: authToken!,
        refreshToken: refreshToken!,
      );
    }
  }

    /// API to get list of collections
  Future<CollectionListResponse?> getCollections(
      {required String limit,
      required String offset,
      required bool loading}) async {
    var token = await getSecureValue(LocalKeys.authToken);
    
    try {
      var resp = await _dataRepository.getCollections(
          token: token!, limit: limit, offset: offset, loading: loading);
      if (!resp.hasError) {
        return collectionListResponseFromJson(resp.data);
      } else {
        return null;
      }
    } catch (_) {
      var resp = await _deviceRepository.getCollections(
          token: token!, limit: limit, offset: offset, loading: loading);
      return collectionListResponseFromJson(resp.data);
    }
  }


  /// Method for Forgot Password from the [DataRepository] and [DeviceRepository]
  Future<ForgotPasswordResponse> forgotPassword({
    required String emailOrPhoneNo,
    required String countryCode,
    required EmailOrPhoneNoType type,
  }) async {
    var token = await getSecureValue(LocalKeys.authToken);
    try {
      var response = await _dataRepository.forgotPassword(
          emailOrPhoneNo: emailOrPhoneNo,
          type: type,
          countryCode: countryCode,
          token: token!);
      ForgotPasswordResponse? forgotPasswordResponse;
      if (!response.hasError) {
        forgotPasswordResponse = forgotPasswordResponseFromJson(response.data);
        debugPrint(
            'ForgotPassword Response message: ${forgotPasswordResponse.message}');
        Utility.showInfoDialog(response, true);
      } else {
        Utility.showInfoDialog(response, false);
      }
      return forgotPasswordResponse!;
    } catch (_) {
      return await _deviceRepository.forgotPassword(
        emailOrPhoneNo: emailOrPhoneNo,
        countryCode: countryCode,
        type: type,
        token: token!,
      );
    }
  }

  /// Method for check username from the [DataRepository] and [DeviceRepository]
  Future<ResponseModel> checkUsername({
    required String username,
    required String trigger,
  }) async {
    var token = await getSecureValue(LocalKeys.authToken);
    try {
      return await _dataRepository.checkUsername(
          username: username, trigger: trigger, token: token!);
    } catch (_) {
      return await _deviceRepository.checkUsername(
          username: username, trigger: trigger, token: token!);
    }
  }

  /// Method for validate phone number from the [DataRepository] and [DeviceRepository]
  Future<ResponseModel> validatePhoneNumberApi({
    required String phoneNumber,
    required String countryCode,
  }) async {
    var token = await getSecureValue(LocalKeys.authToken);
    try {
      return await _dataRepository.validatePhoneNumberApi(
        phoneNumber: phoneNumber,
        countryCode: countryCode,
        token: token!,
      );
    } catch (_) {
      return await _deviceRepository.validatePhoneNumberApi(
        phoneNumber: phoneNumber,
        countryCode: countryCode,
        token: token!,
      );
    }
  }

  /// Method for SendVerification Code  from the [DataRepository] and [DeviceRepository]
  Future<SendVerificationCodeResponse> sendVerificationCode({
    required String phoneNumber,
    required String countryCode,
    required String trigger,
    required bool isUpdatingPhoneNumber,
  }) async {
    var token = await getSecureValue(LocalKeys.authToken);
    var userId = await getSecureValue(LocalKeys.userId);
    try {
      var response = await _dataRepository.sendVerificationCode(
          phoneNumber: phoneNumber,
          countryCode: countryCode,
          trigger: trigger,
          userId: isUpdatingPhoneNumber ? userId! : '',
          isUpdatingPhoneNumber: isUpdatingPhoneNumber,
          token: token!);

      SendVerificationCodeResponse? sendVerificationCodeResponse;

      if (!response.hasError) {
        sendVerificationCodeResponse =
            sendVerificationCodeResponseFromJson(response.data);
        debugPrint(
            'SendVerfication Response message: ${sendVerificationCodeResponse.message}');
      } else {
        Utility.showInfoDialog(response, false);
      }
      return sendVerificationCodeResponse!;
    } catch (_) {
      var response = await _deviceRepository.sendVerificationCode(
          phoneNumber: phoneNumber,
          countryCode: countryCode,
          trigger: trigger,
          userId: isUpdatingPhoneNumber ? userId! : '',
          isUpdatingPhoneNumber: isUpdatingPhoneNumber,
          token: token!);
      return sendVerificationCodeResponseFromJson(response.data);
    }
  }

  /// Method for Validate Verification Code  from the [DataRepository] and [DeviceRepository]
  Future<ResponseModel> validateVerificationCode({
    required String phoneNumber,
    required String countryCode,
    required String trigger,
    required String code,
    required String verificationId,
  }) async {
    var token = await getSecureValue(LocalKeys.authToken);
    try {
      return await _dataRepository.validateVerificationCode(
        phoneNumber: phoneNumber,
        countryCode: countryCode,
        code: code,
        trigger: trigger,
        verificationId: verificationId,
        token: token!,
      );
    } catch (_) {
      return await _deviceRepository.validateVerificationCode(
        phoneNumber: phoneNumber,
        countryCode: countryCode,
        code: code,
        trigger: trigger,
        verificationId: verificationId,
        token: token!,
      );
    }
  }

  /// Method for Resend Verification Code  from the [DataRepository] and [DeviceRepository]
  Future<ResponseModel> resendVerificationCode({
    required String emailOrPhone,
    required EmailOrPhoneNoType type,
    required String countryCode,
    required String trigger,
  }) async {
    var token = await getSecureValue(LocalKeys.authToken);
    try {
      return await _dataRepository.resendVerificationCode(
        emailOrPhone: emailOrPhone,
        countryCode: countryCode,
        trigger: trigger,
        type: type,
        token: token!,
      );
    } catch (_) {
      return await _deviceRepository.resendVerificationCode(
        emailOrPhone: emailOrPhone,
        countryCode: countryCode,
        trigger: trigger,
        type: type,
        token: token!,
      );
    }
  }

  /// Method for Validate Email Code  from the [DataRepository] and [DeviceRepository]
  Future<ResponseModel> validateEmail({
    required String emailId,
    required TypeOfEntry type,
  }) async {
    var token = await getSecureValue(LocalKeys.authToken);
    try {
      return await _dataRepository.validateEmail(
        emailId: emailId,
        type: type,
        token: token!,
      );
    } catch (_) {
      return await _deviceRepository.validateEmail(
        emailId: emailId,
        type: type,
        token: token!,
      );
    }
  }

  /// Method for Config API  from the [DataRepository] and [DeviceRepository]
  Future<ConfigResponse> config({required TokenType type}) async {
    var authToken = await getSecureValue(LocalKeys.authToken);
    try {
      var response = await _dataRepository.config(
          token: type == TokenType.guest ? authToken! : authToken!);
      ConfigResponse? configResponse;
      if (!response.hasError) {
        configResponse = configResponseFromJson(response.data);
        saveSecureValue(LocalKeys.defaultLan, configResponse.data!.defaultLan!);
        saveSecureValue(
            LocalKeys.copyrightText, configResponse.data!.copyrightText!);
        saveSecureValue(LocalKeys.minValueSubscription,
            configResponse.data!.minValueSubscription!.toString());
        saveSecureValue(LocalKeys.minPurchasePost,
            configResponse.data!.minPurchasePost!.toString());
        saveSecureValue(LocalKeys.minValueVipPlan,
            configResponse.data!.minValueVipPlan!.toString());
        saveSecureValue(LocalKeys.minShoutoutValue,
            configResponse.data!.minShoutoutValue!.toString());
        saveSecureValue(LocalKeys.minTipValue,
            configResponse.data!.minTipValue!.toString());
        saveSecureValue(
            LocalKeys.supportMail, configResponse.data!.supportMail!);
        saveSecureValue(LocalKeys.baseUrl, configResponse.data!.baseUrl!);
        saveSecureValue(
            LocalKeys.imageBaseUrl, configResponse.data!.imageBaseUrl!);
        saveSecureValue(LocalKeys.shoutoutDays,
            configResponse.data!.shoutoutDays!.toString());
        debugPrint('Base url is: ${configResponse.data!.imageBaseUrl!}');
        debugPrint('Config Response message: ${configResponse.message}');
      } else {
        Utility.showInfoDialog(response, false);
      }
      return configResponse!;
    } catch (_) {
      return await _deviceRepository.config(
          token: type == TokenType.guest ? authToken! : authToken!);
    }
  }

  /// Method for social verify  from the [DataRepository] and [DeviceRepository]
  Future<ResponseModel> socialVerify(
      {required bool loading,
      required String id,
      required SocialTrigger trigger}) async {
    var token = await getSecureValue(LocalKeys.authToken);
    try {
      return await _dataRepository.socialVerify(
          token: token!,
          loading: loading,
          langCode: 'en',
          id: id,
          trigger: trigger);
    } catch (_) {
      return await _deviceRepository.socialVerify(
          token: token!,
          loading: loading,
          langCode: 'en',
          id: id,
          trigger: trigger);
    }
  }

  /// API to get the cognito token
  Future<CognitoTokenResp?> getCognitoToken(
      {required bool loading, required bool beforeLogin}) async {
    var token = beforeLogin == true
        ? await getSecureValue(LocalKeys.authToken)
        : await getSecureValue(LocalKeys.authToken);
    CognitoTokenResp? cognitoTokenResp;
    try {
      var data = await _dataRepository.getCognitoToken(
          token: token!, loading: loading);
      if (!data.hasError) {
        var resp = cognitoTokenRespFromJson(data.data);
        saveSecureValue(LocalKeys.cognitoIdentityId, resp.data!.identityId!);
        saveSecureValue(LocalKeys.cognitoToken, resp.data!.token!);
        saveSecureValue(LocalKeys.cognitoBucket, resp.data!.bucket!);
        saveSecureValue(LocalKeys.cognitoRegion, resp.data!.region!);
        saveSecureValue(LocalKeys.cognitoVideoBucket, resp.data!.videoBucket!);
        saveSecureValue(LocalKeys.cognitoVideoFolder, resp.data!.videoFolder!);
        saveSecureValue(LocalKeys.cognitoImageBucket, resp.data!.imageBucket!);
        cognitoTokenResp = resp;
      }
    } catch (_) {
      var data = await _deviceRepository.getCognitoToken(
          token: token!, loading: loading);
      var resp = cognitoTokenRespFromJson(data.data);
      cognitoTokenResp = resp;
    }
    return cognitoTokenResp;
  }

  /// API to search a model by the name
  Future<ModelSearchResp?> searchModel(
      {required String searchText,
      required String offset,
      required String limit,
      required bool loading}) async {
    var token = await getSecureValue(LocalKeys.authToken);
    ModelSearchResp? modelSearchResp;
    try {
      var response = await _dataRepository.searchModel(
          token: token!,
          lan: 'en',
          searchText: searchText,
          offset: offset,
          limit: limit,
          loading: loading);
      if (!response.hasError) {
        var data = modelSearchRespFromJson(response.data);
        modelSearchResp = data;
      } else {
        Utility.showMessage(
            response.data, MessageType.error, () => null, 'okay'.tr);
      }
    } catch (_) {
      var response = await _deviceRepository.searchModel(
          token: token!,
          lan: 'en',
          searchText: searchText,
          offset: offset,
          limit: limit,
          loading: loading);
      var data = modelSearchRespFromJson(response.data);

      modelSearchResp = data;
    }
    return modelSearchResp;
  }

  /// API to get the popular posts
  Future<PopularPostsResp?> getPopularPosts(
      {required bool loading, required String pageNumber}) async {
    var token = await getSecureValue(LocalKeys.authToken);
    PopularPostsResp? popularPostsResp;
    try {
      var response = await _dataRepository.getPopularPosts(
          token: token!, lan: 'en', loading: loading, pageNumber: pageNumber);
      if (!response.hasError) {
        var data = popularPostsRespFromJson(response.data);
        popularPostsResp = data;
      } else {
        Utility.showMessage(
            response.data, MessageType.error, () => null, 'okay'.tr);
      }
    } catch (_) {
      var response = await _deviceRepository.getPopularPosts(
          token: token!, lan: 'en', loading: loading, pageNumber: pageNumber);
      var data = popularPostsRespFromJson(response.data);
      popularPostsResp = data;
    }
    return popularPostsResp;
  }

  /// API to get the IP of the user
  Future<String?> getIp() async {
    String? ip;
    try {
      var response = await _dataRepository.getIp();
      if (!response.hasError) {
        saveSecureValue(LocalKeys.userIP, response.data);
        debugPrint('IP Address Response: ${response.data}');
        ip = response.data;
      } else {
        saveSecureValue(LocalKeys.userIP, '0.0.0.0');
      }
    } catch (_) {
      var response = await _deviceRepository.getIp();
      ip = response.data;
    }
    return ip;
  }

  /// API to get the profile data
  Future<ProfileResponse?> getProfileData({required bool loading}) async {
    var token = await getSecureValue(LocalKeys.authToken);
    var userId = await getSecureValue(LocalKeys.userId);
    var ipAddress = await getSecureValue(LocalKeys.userIP);
    var city = await getSecureValue(LocalKeys.city);
    var country = await getSecureValue(LocalKeys.country);
    var lat = await getSecureValue(LocalKeys.lat);
    var lng = await getSecureValue(LocalKeys.lng);
    ProfileResponse? profileResponse;
    try {
      var response = await _dataRepository.getProfile(
        token: token!,
        lan: 'en',
        loading: loading,
        ipAddress: ipAddress != null ? ipAddress : '0.0.0.0',
        city: city != null ? city : 'mohali' ,
        country: country != null ? country: 'india',
        lat: lat != null ? lat: '0.0' ,
        lng: lng != null ? lng : '0.0',
        userId: userId!,
      );
      if (!response.hasError) {
        var data = profileResponseFromJson(response.data);
        profileResponse = data;
      } else {
        Utility.showInfoDialog(response, false);
      }
    } catch (_) {
      var response = await _dataRepository.getProfile(
          token: token!,
          lan: 'en',
          loading: loading,
          ipAddress: ipAddress!,
          city: city!,
          country: country!,
          lat: lat!,
          lng: lng!,
          userId: userId!);
      var data = profileResponseFromJson(response.data);
      profileResponse = data;
    }
    return profileResponse;
  }

  /// Report a Problem
  Future<ResponseModel> reportAProblem(
      {required bool loading,
      required String problemText,
      required List<String> attachments}) async {
    var token = await getSecureValue(LocalKeys.authToken);
    try {
      var response = await _dataRepository.reportAProblem(
          token: token!,
          lan: 'en',
          loading: loading,
          problemText: problemText,
          attachments: attachments);
      return response;
    } catch (_) {
      var response = await _deviceRepository.reportAProblem(
          token: token!,
          lan: 'en',
          loading: loading,
          problemText: problemText,
          attachments: attachments);
      return response;
    }
  }

  /// Change password
  Future<ResponseModel> changePassword(
      {required bool loading,
      required String currentPassword,
      required String newPassword}) async {
    var token = await getSecureValue(LocalKeys.authToken);
    debugPrint(token);
    try {
      var response = await _dataRepository.changePassword(
        token: token!,
        lan: 'en',
        loading: loading,
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      return response;
    } catch (_) {
      var response = await _deviceRepository.changePassword(
        token: token!,
        lan: 'en',
        loading: loading,
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      return response;
    }
  }

  /// terms and policy
  Future<TermsAndPolicyResponse> termsPolicyNsfw({
    required String lan,
    required bool loading,
    required ContentType type,
  }) async {
    var token = await getSecureValue(LocalKeys.authToken);
    try {
      var response = await _dataRepository.termsPolicyNsfw(
        token: token!,
        lan: lan,
        loading: loading,
        type: type,
      );
      TermsAndPolicyResponse? termsAndPolicyResponse;
      if (!response.hasError) {
        termsAndPolicyResponse = termsAndPolicyResponseFromJson(response.data);
        debugPrint('Terms and Policy Response:  $termsAndPolicyResponse');
      } else {
        Utility.showInfoDialog(response, false);
      }
      return termsAndPolicyResponse!;
    } catch (_) {
      var response = await _deviceRepository.termsPolicyNsfw(
        token: token!,
        lan: lan,
        loading: loading,
        type: type,
      );
      TermsAndPolicyResponse? termsAndPolicyResponse;
      termsAndPolicyResponse = termsAndPolicyResponseFromJson(response.data);
      return termsAndPolicyResponse;
    }
  }

  Future<ResponseModel> editProfile({
    required String firstName,
    required String lastName,
    required String userName,
    required String countryCode,
    required String phoneNumber,
    required String email,
  }) async {
    var token = await getSecureValue(LocalKeys.authToken);
    try {
      var response = await _dataRepository.editProfile(
          firstName: firstName,
          lastName: lastName,
          userName: userName,
          countryCode: countryCode,
          phoneNumber: phoneNumber,
          email: email,
          token: token!);
      return response;
    } catch (_) {
      var response = await _deviceRepository.editProfile(
          firstName: firstName,
          lastName: lastName,
          userName: userName,
          countryCode: countryCode,
          phoneNumber: phoneNumber,
          email: email,
          token: token!);
      return response;
    }
  }

    /// API to create a collection
  Future<ResponseModel> createCollection({
    
    required String title,
    required bool loading,
  }) async {
    var token = await getSecureValue(LocalKeys.authToken);
    try {
      return await _dataRepository.createCollection(
          token: token!, title: title, loading: loading);
    } catch (_) {
      return await _deviceRepository.createCollection(
          token: token!, title: title, loading: loading);
    }
  }

/// API to bookmark a post
  Future<ResponseModel> bookmarkPost({
    required String postId,
    required String collectionId,
    required bool loading,
  }) async {
    var token = await getSecureValue(LocalKeys.authToken);
    try {
      return await _dataRepository.bookmarkPost(
          token: token!,
          postId: postId,
          collectionId: collectionId,
          loading: loading);
    } catch (_) {
      return await _deviceRepository.bookmarkPost(
          token: token!,
          postId: postId,
          collectionId: collectionId,
          loading: loading);
    }
  }

}
