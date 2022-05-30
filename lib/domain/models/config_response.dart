// coverage:ignore-file

import 'dart:convert';

/// To parse this JSON data, do
///
///     final configResponse = configResponseFromJson(jsonString);
ConfigResponse configResponseFromJson(String str) =>
    ConfigResponse.fromJson(json.decode(str) as Map<String, dynamic>);

class ConfigResponse {
  ConfigResponse({
    required this.message,
    required this.data,
  });

  factory ConfigResponse.fromJson(Map<String, dynamic> json) => ConfigResponse(
        message: json['message'] as String,
        data: json['data'] != null
            ? ConfigData.fromJson(json['data'] as Map<String, dynamic>)
            : null,
      );

  final String message;
  final ConfigData? data;
}

class ConfigData {
  ConfigData({
    this.defaultLan,
    this.copyrightText,
    this.minValueSubscription,
    this.minPurchasePost,
    this.minValueVipPlan,
    this.minShoutoutValue,
    this.minTipValue,
    this.supportMail,
    this.baseUrl,
    this.imageBaseUrl,
    this.shoutoutDays,
  });

  factory ConfigData.fromJson(Map<String, dynamic> json) => ConfigData(
        defaultLan: json['defaultLan'] as String? ?? '',
        copyrightText: json['copyrightText'] as String? ?? '',
        minValueSubscription: json['minValueSubscription'] as int? ?? 0,
        minPurchasePost: json['minPurchasePost'] as int? ?? 0,
        minValueVipPlan: json['minValueVipPlan'] as int? ?? 0,
        minShoutoutValue: json['minShoutoutValue'] as int? ?? 0,
        minTipValue: json['minTipValue'] as int? ?? 0,
        supportMail: json['supportMail'] as String? ?? '',
        baseUrl: json['baseUrl'] as String? ?? '',
        imageBaseUrl: json['imageBaseUrl'] as String? ?? '',
        shoutoutDays: json['shoutoutDays'] as int? ?? 0,
      );

  final String? defaultLan;
  final String? copyrightText;
  final int? minValueSubscription;
  final int? minPurchasePost;
  final int? minValueVipPlan;
  final int? minShoutoutValue;
  final int? minTipValue;
  final String? supportMail;
  final String? baseUrl;
  final String? imageBaseUrl;
  final int? shoutoutDays;
}
