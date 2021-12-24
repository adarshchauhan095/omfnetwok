import 'package:flutter/material.dart';
import 'package:omf_netflix/app/app.dart';

/// The view part of the [SubscriptionView], which will be used to
/// show the SubscriptionScreen
class SubscriptionView extends StatelessWidget {
  static const subscriptionViewKey = Key('subscription-view-key');
  @override
  Widget build(BuildContext context) => Scaffold(
        key: subscriptionViewKey,
        backgroundColor: ColorsValue.scaffoldBackgroundColor,
        body: SubscriptionWidget(),
      );
}
