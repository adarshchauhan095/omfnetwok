// coverage:ignore-file

import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart' show Placemark, GeocodingPlatform;
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:location/location.dart' show Location;
import 'package:logger/logger.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:omf_netflix/domain/domain.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class Utility {
  // coverage:ignore-start
  static void printDLog(String message) {
    Logger().d('${StringConstants.appName}: $message');
  }

  /// Print info log.
  ///
  /// [message] : The message which needed to be print.
  static void printILog(dynamic message) {
    Logger().i('${StringConstants.appName}: $message');
  }

  /// Print info log.
  ///
  /// [message] : The message which needed to be print.
  static void printLog(dynamic message) {
    Logger().log(Level.info, message);
  }

  /// Print error log.
  ///
  /// [message] : The message which needed to be print.
  static void printELog(String message) {
    Logger().e('${StringConstants.appName}: $message');
  }

  /// Returns a error String by validating password.
  ///
  /// for at least one upper case, at least one digit,
  /// at least one special character and and at least 6 characters long
  /// return [List<bool>] for each case.
  /// Validation logic
  /// r'^
  ///   (?=.*[A-Z])             // should contain at least one upper case
  ///   (?=.*?[0-9])            // should contain at least one digit
  ///  (?=.*?[!@#\$&*~]).{8,}   // should contain at least one Special character
  /// $
  static String? validatePassword(String value) {
    if (value.trim().isNotEmpty) {
      if (value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        if (value.contains(RegExp(r'[A-Z]'))) {
          if (value.contains(RegExp(r'[0-9]'))) {
            if (value.length < 6) {
              return 'shouldBe6Characters'.tr;
            } else {
              return null;
            }
          } else {
            return 'shouldHaveOneDigit'.tr;
          }
        } else {
          return 'shouldHaveOneUppercaseLetter'.tr;
        }
      } else {
        return 'shouldHaveOneSpecialCharacter'.tr;
      }
    } else {
      return 'passwordRequired'.tr;
    }
  }

  /// Returns true if email is Valid
  static bool emailValidator(String email) => EmailValidator.validate(email);

  /// Returns true if the internet connection is available.
  static Future<bool> isNetworkAvailable() async =>
      await InternetConnectionChecker().hasConnection;

  /// Print the details of the [response].
  static void printResponseDetails(Response? response) {
    if (response != null) {
      var isOkay = response.isOk;
      var statusCode = response.statusCode;
      var statusText = response.statusText;
      var method = response.request?.method ?? '';
      var path = response.request?.url.path ?? '';
      var query = response.request?.url.queryParameters ?? '';
      if (isOkay) {
        printILog(
            'Path: $path, Method: $method, Status Text: $statusText, Status Code: $statusCode, Query $query');
      } else {
        printELog(
            'Path: $path, Method: $method, Status Text: $statusText, Status Code: $statusCode, Query $query');
      }
    }
  }

  /// returns the date time in particular given formate
  static String getWeekDayMonthNumYear(DateTime dateTime) =>
      DateFormat.yMMMMEEEEd().format(dateTime);

  /// get formated [DateTime] eg. 12-01-2021
  static String getDayMonthYear(DateTime dateTime) =>
      '${getOnlyDate(dateTime)}-${DateFormat('MM').format(dateTime)}-${DateFormat.y().format(dateTime)}';

  /// get formated [DateTime] eg. 12
  static String getOnlyDate(DateTime dateTime) =>
      DateFormat('dd').format(dateTime);

  /// get formated [DateTime] eg. 12 Sep
  static String getDateAndMonth(DateTime dateTime) =>
      DateFormat('dd MMM').format(dateTime);

  /// get formated [DateTime]
  static String getWeekDay(DateTime dateTime) =>
      DateFormat.EEEE().format(dateTime);

  /// Calculates number of weeks for a given year as per https://en.wikipedia.org/wiki/ISO_week_date#Weeks_per_year
  static int _numOfWeeks(int year) {
    var dec28 = DateTime(year, 12, 28);
    var dayOfDec28 = int.parse(DateFormat('D').format(dec28));
    return ((dayOfDec28 - dec28.weekday + 10) / 7).floor();
  }

  // Calculates week number from a date as per https://en.wikipedia.org/wiki/ISO_week_date#Calculation
  static int weekNumber(DateTime date) {
    var dayOfYear = int.parse(DateFormat('D').format(date));
    var woy = ((dayOfYear - date.weekday + 10) / 7).floor();
    if (woy < 1) {
      woy = _numOfWeeks(date.year - 1);
    } else if (woy > _numOfWeeks(date.year)) {
      woy = 1;
    }
    return woy;
  }

  /// Show loader
  static void showLoader() async {
    await Get.dialog<dynamic>(
      Center(
        child: LoadingAnimationWidget.discreteCircle(
          color: ColorsValue.primaryColor,
          size: 40,
        ),
      ),
      barrierDismissible: false,
      barrierColor: Colors.transparent,
    );
  }

  /// Close loader
  static void closeLoader() {
    closeDialog();
  }

  /// URL Launcher
  static void launchURL(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : showDialog('Could not open $_url');

  /// Show info dialog
  static void showDialog(
    String message,
  ) async {
    await Get.dialog<void>(
      CupertinoAlertDialog(
        title: const Text('Info'),
        content: Text(
          message,
        ),
        actions: [
          TextButton(
            onPressed: Get.back,
            child: const Text(
              'Okey',
            ),
          ),
        ],
      ),
    );
  }

  /// Show alert dialog
  static void showAlertDialog({
    String? message,
    String? title,
    Function()? onPress,
  }) async {
    await Get.dialog<void>(
      CupertinoAlertDialog(
        title: Text('$title'),
        content: Text('$message'),
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: onPress,
            child: const Text('Yes'),
          ),
          const CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: closeDialog,
            child: Text('No'),
          )
        ],
      ),
    );
  }

  /// Close any open dialog.
  static void closeDialog() {
    if (Get.isDialogOpen ?? false) Get.back<void>();
  }

  /// Close any open snackbar
  static void closeSnackbar() {
    if (Get.isSnackbarOpen!) {
      Get.back<void>();
    }
  }

  /// Show no internet dialog if there is no
  /// internet available.
  static Future<void> showNoInternetDialog() async {
    await Get.dialog<void>(
      const NoInternetWidget(),
      barrierDismissible: false,
    );
  }

  /// Show a message to the user.
  ///
  /// [message] : Message you need to show to the user.
  // ignore: comment_references
  /// [messageType] : Type of the message for different background color.
  // ignore: comment_references
  /// [onTap] : An event for onTap.
  // ignore: comment_references
  /// [actionName] : The name for the action.
  static void showMessage(String? message, MessageType messageType,
      Function()? onTap, String actionName) {
    if (message == null || message.isEmpty) return;
    closeDialog();
    closeSnackbar();
    var backgroundColor = Colors.black;
    switch (messageType) {
      case MessageType.error:
        backgroundColor = Colors.red;
        break;
      case MessageType.information:
        backgroundColor = Colors.black.withOpacity(0.3);
        break;
      case MessageType.success:
        backgroundColor = Colors.green;
        break;
      default:
        backgroundColor = Colors.black;
        break;
    }
    Future.delayed(
      const Duration(seconds: 0),
      () {
        Get.rawSnackbar(
          messageText: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
          mainButton: TextButton(
            onPressed: onTap ?? Get.back,
            child: Text(
              actionName,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: backgroundColor,
          margin: const EdgeInsets.all(15.0),
          borderRadius: 15,
          snackStyle: SnackStyle.FLOATING,
        );
      },
    );
  }

  /// Returns Platform type
  static String platFormType() {
    var value = kIsWeb
        ? 3
        : Platform.isAndroid
            ? 1
            : 2;
    return value.toString();
  }

  /// Random number generator
  static int getRandomNumer() {
    var random = Random();
    return random.nextInt(100);
  }

  /// Return file size
  static String getFileSize(int size) {
    if (size == 0) {
      return '0 KB';
    } else {
      var val = size / pow(1024, (log(size) / log(1024)).floor());
      if (size < 1024) {
        return '$val KB';
      } else {
        return '${val.toStringAsFixed(1)} MB';
      }
    }
  }

  /// calculate percentage
  static int getPercentageValue(int propotionateValue, int totalValue) =>
      ((propotionateValue / totalValue) * 100).round();

  /// Get current location and update the view.
  static Future<LocationDataLocal> getCurrentLocation() async {
    var currentLocation = Location();
    var location = await currentLocation.getLocation();
    printLog('Lat: ${location.latitude} , Lng: ${location.longitude}');
    double? lat = location.latitude ?? 0.0;
    double? longi = location.longitude ?? 0.0;
    var locationDetails = await getAddressThroughLatLng(lat, longi);
    return getLocationData(
      locationDetails,
      lat,
      longi,
    );
  }

  /// Get current location in string.
  static Future<LocationDataLocal> getCurrentLocationAndSave() async {
    var position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    var locationDetails =
        await getAddressThroughLatLng(position.latitude, position.longitude);
    return getLocationData(
      locationDetails,
      position.latitude,
      position.longitude,
    );
  }

  /// Get current lat long of the device.
  static Future<Position> getCurrentLatLng() async =>
      await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

  /// Get the location name by giving the lat long.
  ///
  /// [latitude] : latitude of the location.
  /// [longitude] : longitude of the location.
  static Future<Placemark?> getAddressThroughLatLng(
      double? latitude, double? longitude) async {
    if (latitude != null && longitude != null) {
      var addresses = await GeocodingPlatform.instance.placemarkFromCoordinates(
        latitude,
        longitude,
      );
      return addresses[0];
    } else {
      return null;
    }
  }

  /// Get all location details from the address object.
  ///
  /// [locationDetails] : the location details got from geocoder.
  static LocationDataLocal getLocationData(
    Placemark? locationDetails,
    double lat,
    double long,
  ) =>
      LocationDataLocal(
        placeName: locationDetails?.name == 'Unnamed Road'
            ? locationDetails?.subLocality ?? ''
            : locationDetails?.name ?? '',
        addressLine1: locationDetails?.subLocality ?? '',
        addressLine2: locationDetails?.administrativeArea ?? '',
        area: locationDetails?.locality == ''
            ? locationDetails?.subLocality ?? ''
            : locationDetails?.locality ?? '',
        city: locationDetails?.subAdministrativeArea ?? '',
        postalCode: locationDetails?.postalCode ?? '',
        country: locationDetails?.country ?? '',
        latitude: lat,
        longitude: long,
      );

  static String getFormatedDate(String date) {
    var date = DateTime.parse('2018-04-10T04:00:00.000Z');
    return Utility.getDayMonthYear(date);
  }

  static Widget? setUserDefaultImageSmall() => Container(
        width: ScreenUtil().setSp(58),
        height: ScreenUtil().setSp(58),
        child: Padding(
          padding: Dimens.edgeInsets12,
          child: Image.asset(
            AssetConstants.person,
            width: ScreenUtil().setSp(58),
            height: ScreenUtil().setSp(58),
            fit: BoxFit.contain,
          ),
        ),
        decoration: BoxDecoration(
          color: ColorsValue.blackColor,
          borderRadius: const BorderRadius.all(Radius.circular(50.0)),
          border: Border.all(
            color: ColorsValue.primaryColor,
            width: 1.0,
          ),
        ),
      );

  /// Show error dialog from response model
  static void showInfoDialog(ResponseModel data,
      [bool isSuccess = false]) async {
    await Get.dialog<dynamic>(
      CupertinoAlertDialog(
        title: Text(isSuccess ? 'SUCCESS' : 'ERROR'),
        content: Text(
          jsonDecode(data.data)['message'] as String,
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: Get.back,
            isDefaultAction: true,
            child: Text(
              'okay'.tr,
            ),
          ),
        ],
      ),
    );
  }
}
