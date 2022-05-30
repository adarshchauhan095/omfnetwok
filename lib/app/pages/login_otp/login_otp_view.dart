import 'package:flutter/material.dart';
import 'package:omf_netflix/app/app.dart';

/// the View part of the [LoginOtpView], which will be used
/// to show the LoginOtpScreen
class LoginOtpView extends StatelessWidget {
  static const loginOtpViewKey = Key('login-otp-view-key');
  static const loginOtpWidgetKey = Key('login-otp-widget-key');
  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          key: loginOtpViewKey,
          backgroundColor: ColorsValue.scaffoldBackgroundColor,
          body: LoginOtpWidget(
            key: loginOtpWidgetKey,
          ),
        ),
      );
}
