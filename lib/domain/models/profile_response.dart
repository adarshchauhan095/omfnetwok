// To parse this JSON data, do
//
//     final profileResponse = profileResponseFromJson(jsonString);

import 'dart:convert';

ProfileResponse profileResponseFromJson(String str) =>
    ProfileResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String profileResponseToJson(ProfileResponse data) =>
    json.encode(data.toJson());

class ProfileResponse {
  ProfileResponse({
    this.message,
    this.data,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      ProfileResponse(
        message: json['message'] as String? ?? '',
        data: json['data'] == null
            ? null
            : ProfileData.fromJson(json['data'] as Map<String, dynamic>),
      );

  String? message;
  ProfileData? data;

  Map<String, dynamic> toJson() => <String,dynamic>{
        'message': message == null ? null : message,
        'data': data,
      };
}

class ProfileData {
  ProfileData({
    this.id,
    this.userTypeCode,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.username,
    this.referralCode,
    this.fcmTopic,
    this.socialMediaLink,
    this.statusCode,
    this.profilePic,
    this.phoneNumber,
    this.countryCode,
    this.dateOfBirth,
    this.bannerImage,
    this.bio,
    this.fullName,
    this.shoutoutPrice,
    this.document,
    this.userMode,
    this.streamUserId,
    this.isNsfwAllow,
    this.orderCount,
    this.isFollow,
    this.subscriptionData,
    this.postCount,
    this.mySubscriber,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
        id: json['_id'] as String? ?? '',
        userTypeCode: json['userTypeCode'] as int? ?? 0,
        firstName: json['firstName'] as String? ?? '',
        lastName: json['lastName'] as String? ?? '',
        email: json['email'] as String? ?? '',
        gender: json['gender'] as String? ?? '',
        username: json['username'] as String? ?? '',
        referralCode: json['referralCode'] as String? ?? '',
        fcmTopic: json['fcmTopic'] as String? ?? '',
        socialMediaLink: json['socialMediaLink'] as String? ?? '',
        statusCode: json['statusCode'] as int? ?? 0,
        profilePic: json['profilePic'] as String? ?? '',
        phoneNumber: json['phoneNumber'] as String? ?? '',
        countryCode: json['countryCode'] as String? ?? '',
        dateOfBirth: json['dateOfBirth'] as String? ?? '',
        bannerImage: json['bannerImage'] as String? ?? '',
        bio: json['bio'] as String? ?? '',
        fullName: json['fullName'] as String? ?? '',
        shoutoutPrice: json['shoutoutPrice'] == null
            ? null
            : ShoutoutPrice.fromJson(
                json['shoutoutPrice'] as Map<String, dynamic>),
        document: json['document'] == null
            ? null
            : DocumentDataFromProfile.fromJson(
                json['document'] as Map<String, dynamic>),
        userMode: json['userMode'] as String? ?? '',
        streamUserId: json['streamUserId'] as String? ?? '',
        isNsfwAllow: json['isNSFWAllow'] as bool? ?? false,
        orderCount: json['orderCount'] as int? ?? 0,
        isFollow: json['isFollow'] as bool? ?? false,
        subscriptionData: json['subscriptionData'] == null
            ? null
            : SubscriptionData.fromJson(
                json['subscriptionData'] as Map<String, dynamic>),
        postCount: json['postCount'] as int? ?? 0,
        mySubscriber: json['mySubscriber'] as int? ?? 0,
      );

  String? id;
  int? userTypeCode;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? username;
  String? referralCode;
  String? fcmTopic;
  String? socialMediaLink;
  int? statusCode;
  String? profilePic;
  String? phoneNumber;
  String? countryCode;
  String? dateOfBirth;
  String? bannerImage;
  String? bio;
  String? fullName;
  ShoutoutPrice? shoutoutPrice;
  DocumentDataFromProfile? document;
  String? userMode;
  String? streamUserId;
  bool? isNsfwAllow;
  int? orderCount;
  bool? isFollow;
  SubscriptionData? subscriptionData;
  int? postCount;
  int? mySubscriber;

  Map<String, dynamic> toJson() => <String,dynamic>{
        '_id': id == null ? null : id,
        'userTypeCode': userTypeCode == null ? null : userTypeCode,
        'firstName': firstName == null ? null : firstName,
        'lastName': lastName == null ? null : lastName,
        'email': email == null ? null : email,
        'gender': gender == null ? null : gender,
        'username': username == null ? null : username,
        'referralCode': referralCode == null ? null : referralCode,
        'fcmTopic': fcmTopic == null ? null : fcmTopic,
        'socialMediaLink': socialMediaLink == null ? null : socialMediaLink,
        'statusCode': statusCode == null ? null : statusCode,
        'profilePic': profilePic == null ? null : profilePic,
        'phoneNumber': phoneNumber == null ? null : phoneNumber,
        'countryCode': countryCode == null ? null : countryCode,
        'dateOfBirth': dateOfBirth,
        'bannerImage': bannerImage == null ? null : bannerImage,
        'bio': bio == null ? null : bio,
        'fullName': fullName == null ? null : fullName,
        'shoutoutPrice': shoutoutPrice,
        'document': document,
        'userMode': userMode == null ? null : userMode,
        'streamUserId': streamUserId == null ? null : streamUserId,
        'isNSFWAllow': isNsfwAllow == null ? null : isNsfwAllow,
        'orderCount': orderCount == null ? null : orderCount,
        'isFollow': isFollow == null ? null : isFollow,
        'subscriptionData': subscriptionData,
        'postCount': postCount == null ? null : postCount,
        'mySubscriber': mySubscriber == null ? null : mySubscriber,
      };
}

class DocumentDataFromProfile {
  DocumentDataFromProfile({
    this.documentTypeId,
    this.name,
    this.frontImage,
    this.backImage,
    this.uploadedTs,
    this.uploadedDate,
    this.approvedOn,
  });

  factory DocumentDataFromProfile.fromJson(Map<String, dynamic> json) =>
      DocumentDataFromProfile(
        documentTypeId: json['documentTypeId'] as String? ?? '',
        name: json['name'] as String? ?? '',
        frontImage: json['frontImage'] as String? ?? '',
        backImage: json['backImage'] as String? ?? '',
        uploadedTs: json['uploadedTs'] as int? ?? 0,
        uploadedDate: json['uploadedDate'] as String? ?? '',
        approvedOn: json['approvedOn'] as int? ?? 0,
      );

  String? documentTypeId;
  String? name;
  String? frontImage;
  String? backImage;
  int? uploadedTs;
  String? uploadedDate;
  int? approvedOn;

  Map<String, dynamic> toJson() => <String,dynamic>{
        'documentTypeId': documentTypeId == null ? null : documentTypeId,
        'name': name == null ? null : name,
        'frontImage': frontImage == null ? null : frontImage,
        'backImage': backImage == null ? null : backImage,
        'uploadedTs': uploadedTs == null ? null : uploadedTs,
        'uploadedDate': uploadedDate,
        'approvedOn': approvedOn == null ? null : approvedOn,
      };
}

class ShoutoutPrice {
  ShoutoutPrice({
    this.price,
    this.currencyCode,
    this.currencySymbol,
  });

  factory ShoutoutPrice.fromJson(Map<String, dynamic> json) => ShoutoutPrice(
        price: json['price'] as int? ?? 0,
        currencyCode: json['currencyCode'] as String? ?? '',
        currencySymbol: json['currencySymbol'] as String? ?? '',
      );

  int? price;
  String? currencyCode;
  String? currencySymbol;

  Map<String, dynamic> toJson() => <String,dynamic>{
        'price': price == null ? null : price,
        'currencyCode': currencyCode == null ? null : currencyCode,
        'currencySymbol': currencySymbol == null ? null : currencySymbol,
      };
}

class SubscriptionData {
  SubscriptionData({
    this.planCount,
  });

  factory SubscriptionData.fromJson(Map<String, dynamic> json) =>
      SubscriptionData(
        planCount: json['planCount'] as int? ?? 0,
      );

  int? planCount;

  Map<String, dynamic> toJson() => <String,dynamic>{
        'planCount': planCount == null ? null : planCount,
      };
}
