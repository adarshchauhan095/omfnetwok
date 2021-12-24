// coverage:ignore-file
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// A chunk of routes taken in the application.
///
/// Will be ignored for test since all are static values and would not change.
abstract class RouteManagement {
  /// Go to HomeView
  static void goToHome() {
    // Get.offNamed<void>(Routes.home); // uncomment this while working with api
    Get.toNamed<void>(Routes.home); // for testing
  }

  /// Go to LoginView
  static void goToLogin() {
    Get.toNamed<void>(Routes.logIn);
  }

  /// Go to LoginView
  static void goToOffLogin() {
    Get.offNamed<void>(Routes.logIn);
  }

  /// Go to SignupView
  static void goToSignup() {
    Get.toNamed<void>(Routes.signup);
  }

  /// Go to LoginOtpView
  static void goToLoginOtp() {
    Get.toNamed<void>(Routes.loginOtp);
  }

  /// Go to ForgotPasswordView
  static void goToForgotPassword() {
    Get.toNamed<void>(Routes.forgotPassword);
  }

  /// Go to MyListView
  static void goToMyList() {
    Get.toNamed<void>(Routes.myList);
  }

  /// Go to AppSettingsView
  static void goToAppSettings() {
    Get.toNamed<void>(Routes.appSettings);
  }

  /// Go to AccountView
  static void goToAccount() {
    Get.toNamed<void>(Routes.account);
  }

  /// Go to SubscriptionView
  static void goToSubscription() {
    Get.toNamed<void>(Routes.subscription);
  }

  /// Go to CommentView
  static void goToComment() {
    Get.toNamed<void>(Routes.comment);
  }

  /// Go to ChangePasswordView
  static void goToChangePassword() {
    Get.toNamed<void>(Routes.changePassword);
  }

  /// Go to ProductsView
  static void goToProducts() {
    Get.toNamed<void>(Routes.products);
  }

  /// Go to SubscriptionInformationView
  static void goToSubscriptionInformation() {
    Get.toNamed<void>(Routes.subscriptionInformation);
  }

  /// Go to LobbyView
  static void goToLobby(String path) {
    Get.toNamed<void>(Routes.lobby, arguments: path);
  }
}
