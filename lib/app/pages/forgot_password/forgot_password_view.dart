import 'package:flutter/material.dart';
import 'package:omf_netflix/app/app.dart';

/// [ForgotPasswordView] Screen UI allows to Reset the password
class ForgotPasswordView extends StatelessWidget {
  static const forgotPasswordViewKey = Key('forgot-password-view-key');

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          key: forgotPasswordViewKey,
          backgroundColor: ColorsValue.scaffoldBackgroundColor,
          body: ForgotPasswordWidget(),
        ),
      );
}
