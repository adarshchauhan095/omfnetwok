// coverage:ignore-file
import 'package:flutter/material.dart';
import 'package:omf_netflix/app/app.dart';

/// Ui for No Internet widget
class NoInternetWidget extends StatelessWidget {
  static const noInternetWidgetKey = Key('no-internet-widget-key');
  @override
  Widget build(BuildContext context) => Scaffold(
    key: noInternetWidgetKey,
        backgroundColor: Colors.black12,
        body: Padding(
          padding: Dimens.edgeInsets15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                StringConstants.noInternet,
                textAlign: TextAlign.center,
                style: Styles.boldPrimary16,
              ),
            ],
          ),
        ),
      );
}
