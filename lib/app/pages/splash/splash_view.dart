import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// The view part of the [SplashView], which will be used to
/// show the SplashScreen
class SplashView extends StatelessWidget {
  static const String splashViewKey = 'splash-view-key';

  @override
  Widget build(BuildContext context) => Scaffold(
        key: const Key(splashViewKey),
        backgroundColor: ColorsValue.scaffoldBackgroundColor,
        body: GetBuilder<SplashController>(
            builder: (_controller) => const SplashWidget()),
      );
}
