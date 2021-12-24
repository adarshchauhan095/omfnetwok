import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// [SubscriptionInformationView] shows the subscription plans currenty using
/// the user.
class SubscriptionInformationView extends StatelessWidget {
  static const subscriptionInformationViewKey =
      Key('subscription-information-view-key');
  @override
  Widget build(BuildContext context) => Scaffold(
    key: subscriptionInformationViewKey,
        backgroundColor: ColorsValue.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: ColorsValue.scaffoldBackgroundColor,
          leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: ColorsValue.whiteColor,
              size: Dimens.thirty,
            ),
            onPressed: () {
              Get.back<void>();
            },
          ),
          centerTitle: true,
          title: Text(
            StringConstants.subscriptionInformation,
            style: Styles.primaryText20,
          ),
        ),
        body: SubscriptionInformationWidget(),
      );
}
