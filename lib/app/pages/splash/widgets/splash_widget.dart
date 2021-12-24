import 'package:flutter/material.dart';
import 'package:omf_netflix/app/app.dart';

/// Containers UI for SpashScren with Logo
class SplashWidget extends StatelessWidget {
  const SplashWidget({Key? key}) : super(key: key);

static const String splashImage = 'splash-image-key';

  @override
  Widget build(BuildContext context) => Padding(
    key: const Key('splashImage'),
        padding: Dimens.edgeInsets56_336_56_336,
        child: Center(child: Image.asset(AssetConstants.omfLogo)),
      );
}
