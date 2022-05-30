import 'package:flutter/material.dart';
import 'package:omf_netflix/app/app.dart';

/// The view part of the [LoginView], which will be used to
/// show the LoginScreen
class LoginView extends StatelessWidget {
  static const loginViewKey = Key('login-view-key');

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          key: loginViewKey,
          backgroundColor: ColorsValue.scaffoldBackgroundColor,
          body: LoginViewWidget(),
        ),
      );
}
