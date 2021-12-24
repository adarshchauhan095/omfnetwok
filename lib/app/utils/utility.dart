// coverage:ignore-file
import 'dart:io';
import 'dart:math';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

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
              return StringConstants.shouldBe6Characters;
            } else {
              return null;
            }
          } else {
            return StringConstants.shouldHaveOneDigit;
          }
        } else {
          return StringConstants.shouldHaveOneUppercaseLetter;
        }
      } else {
        return StringConstants.shouldHaveOneSpecialCharacter;
      }
    } else {
      return StringConstants.passwordRequired;
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

  /// get formated [DateTime] eg. 12 Jul 2021
  static String getDayAbbrMonthYear(DateTime dateTime) =>
      '${DateFormat.d().format(dateTime)} ${DateFormat.yMMM().format(dateTime)}';

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
  static void showTextLoader(String? loadingFor) async {
    await Get.dialog(
      Center(
        child: Container(
          height: Dimens.hundred,
          constraints: const BoxConstraints(maxWidth: double.infinity),
          child: Card(
            child: Padding(
              padding: Dimens.edgeInsets10,
              child: Column(
                children: [
                  const CircularProgressIndicator(),
                  Dimens.boxHeight10,
                  Text(
                    loadingFor!,
                    style: Styles.black15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  /// Show loader
  static void showLoader() async {
    await Get.dialog(
      Center(
        child: SizedBox(
          height: 60,
          width: 60,
          child: Card(
            child: Padding(
              padding: Dimens.edgeInsets10,
              child: const CircularProgressIndicator(),
            ),
          ),
        ),
      ),
      barrierDismissible: false,
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
    await Get.dialog(
      CupertinoAlertDialog(
        title: const Text('Info'),
        content: Text(
          message,
        ),
        actions: [
          TextButton(
            onPressed: Get.back,
            child: Text(
              StringConstants.okay,
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
    await Get.dialog(
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
    if (Get.isSnackbarOpen ?? false) Get.back<void>();
  }

  /// Show no internet dialog if there is no
  /// internet available.
  static void showNoInternetDialog() {
    closeDialog();
    Get.dialog<void>(
      NoInternetWidget(),
      barrierDismissible: false,
    );
  }

  static int getPercentageValue(int propotionateValue, int totalValue) =>
      ((propotionateValue / totalValue) * 100).round();

  // static Future<String> getFileSize(String? filepath, int decimals) async {
  //   if (filepath != null) {
  //     var file = File(filepath);
  //     var bytes = await file.length();
  //     if (bytes <= 0) return '0 B';
  //     const suffixes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
  //     var i = (log(bytes) / log(1024)).floor();
  //     return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}'
  //         .toString();
  //   } else {
  //     return '0 kb';
  //   }
  // }

  static int getRandomNumer() {
    var random = Random();
    return random.nextInt(100);
  }

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

  /// method to get the thumbail from the video file.
  static Future<File> getVideoThumbnail(String? file) async {
    var fileName = await VideoThumbnail.thumbnailFile(
      video: file!,
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.JPEG,
      maxHeight: 100,
      maxWidth: 100,
      quality: 75,
    );
    return File(fileName!);
  }
}
