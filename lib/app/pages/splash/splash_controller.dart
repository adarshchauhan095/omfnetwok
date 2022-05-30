// coverage:ignore-file
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:omf_netflix/domain/domain.dart';

/// The splash controller which will be used to control the [SplashView].
///
/// Testing has been ignored because all the details depend on the
/// location permission. Which can't be tested. API calls are being tested.
class SplashController extends GetxController {
  SplashController(this._splashPresenter);
  final SplashPresenter _splashPresenter;

  /// method to navigate [LoginView] or direct to HomeView.
  void navigateToHome() async {
    // Future.delayed(const Duration(seconds: 2), RouteManagement.goToHome);
    var token = await _splashPresenter.getSecureValue(LocalKeys.authToken);

    // Checks if the app is uninstalled from device or not.
    final isAppExists =
        _splashPresenter.getStoredValue(LocalKeys.isAppExists) as bool;

    await Future.delayed(
      const Duration(seconds: 2),
      () {
        if (token != null && token.isNotEmpty && isAppExists) {
          RouteManagement.goToOffHome();
          return;
        }
        RouteManagement.goToLogin();
      },
    );
  }
  @override
  void onInit() async {
    navigateToHome();
    super.onInit();
  }
}
