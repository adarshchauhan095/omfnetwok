// coverage:ignore-file
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// The splash controller which will be used to control the [SplashView].
///
/// Testing has been ignored because all the details depend on the
/// location permission. Which can't be tested. API calls are being tested.
class SplashController extends GetxController {
  SplashController(this.splashPresenter);
  final SplashPresenter splashPresenter;

  /// method to navigate [LoginView] or direct to [HomeView].
  void navigateToLogin() {
    Future.delayed(const Duration(seconds: 5),
        kIsWeb ? RouteManagement.goToHome : RouteManagement.goToOffLogin);
  }

  @override
  void onInit() {
    navigateToLogin();
    super.onInit();
  }
}
