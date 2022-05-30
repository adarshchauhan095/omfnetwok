import 'package:flutter/material.dart';
import 'package:omf_netflix/app/app.dart';

/// The view part of the [SignupView], which will be used to
/// show the SignupScreen
class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const SafeArea(
        child: Scaffold(
          backgroundColor: ColorsValue.scaffoldBackgroundColor,
          
          body: SignupWidget(),
        ),
      );
}
