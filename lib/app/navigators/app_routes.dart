// coverage:ignore-file
part of 'app_pages.dart';

/// A chunks of routes and the path names which will be used to create
/// routes in [AppPages].
abstract class Routes {
  static const splash = _Paths.splash;
  static const logIn = _Paths.logIn;
  static const signup = _Paths.signup;
  static const home = _Paths.home;
  static const loginOtp = _Paths.loginOtp;
  static const forgotPassword = _Paths.forgotPassword;
  static const myList = _Paths.myList;
  static const appSettings = _Paths.appSettings;
  static const account = _Paths.account;
  static const subscription = _Paths.subscription;
  static const comment = _Paths.comment;
  static const changePassword = _Paths.changePassword;
  static const products = _Paths.products;
  static const subscriptionInformation = _Paths.subscriptionInformation;
  static const lobby = _Paths.lobby;
  static const reportAProblem = _Paths.reportAProblem;
  static const termsAndPolicy = _Paths.termsAndPolicy;
  static const firstAndLastnameEditView = _Paths.firstAndLastnameEditView;
  static const phonenumberEditView = _Paths.phonenumberEditView;
  static const emailEditView = _Paths.emailEditView;
  static const accountSettingsView = _Paths.accountSettingsView;
  static const deviceLogView = _Paths.deviceLogView;
}

abstract class _Paths {
  static const splash = '/splash-screen';
  static const logIn = '/log-in-screen';
  static const signup = '/sign-up-screen';
  static const home = '/home-screen';
  static const loginOtp = '/login-otp-screen';
  static const forgotPassword = '/forgot-password-screen';
  static const myList = '/my-list-screen';
  static const appSettings = '/app-settings-screen';
  static const account = '/account-screen';
  static const subscription = '/subscription-screen';
  static const comment = '/comment-screen';
  static const changePassword = '/change-password-screen';
  static const products = '/products-screen';
  static const subscriptionInformation = '/subscription-information-screen';
  static const lobby = '/lobby';
  static const reportAProblem = '/report-a-problem-view';
  static const termsAndPolicy = '/terms-and-policy-view';
  static const firstAndLastnameEditView = '/first-and-lastname-edit-view';
  static const phonenumberEditView = '/phonenumber-edit-view';
  static const emailEditView = '/email-edit-view';
  static const accountSettingsView = '/account-settings-view';
  static const deviceLogView = '/device-log-view';
}
