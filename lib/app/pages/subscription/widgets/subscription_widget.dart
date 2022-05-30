import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// SubscriptionWidget for [SubscriptionView].
class SubscriptionWidget extends StatelessWidget {
  static const subscriptionWidgetKey = Key('subscription-widget-key');
  static const subscriptionButtonKey = Key('subscription-button-key');

  @override
  Widget build(BuildContext context) => Padding(
        key: subscriptionWidgetKey,
        padding: Dimens.edgeInsets16_0_16_0,
        child: SingleChildScrollView(
          child: Responsive.isWeb(context) || Responsive.isTablet(context)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: Dimens.edgeInsets12_0_12_0,
                      height: Dimens.twoHundred,
                      width: Dimens.twoHundred,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(Dimens.twoHundred),
                          bottomRight: Radius.circular(Dimens.twoHundred),
                        ),
                        color: ColorsValue.greyBoxColor,
                        border: Border.all(
                          color: ColorsValue.primaryColor,
                          width: Dimens.five,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Dimens.boxHeight5,
                          Image.asset(
                            AssetConstants.omfLogo,
                            width: Dimens.hundredSixtyTwo,
                            height: Dimens.thirty,
                          ),
                          Dimens.boxHeight3,
                          Text(
                            StringConstants.membership.toUpperCase(),
                            style: Styles.boldSecondaryText12,
                          ),
                          Dimens.boxHeight5,
                          Image.asset(
                            AssetConstants.membership,
                            height: Dimens.hundred,
                            width: Dimens.hundredFifty,
                          ),
                        ],
                      ),
                    ),
                    Dimens.boxHeight25,
                    Text(
                      StringConstants.loremIpsum +
                          StringConstants.loremIpsum +
                          StringConstants.loremIpsum,
                      textAlign: TextAlign.center,
                      style: Styles.primaryText12,
                    ),
                    Dimens.boxHeight10,
                    Text(
                      StringConstants.termsOfServiceAndPrivacyPlicy,
                      style: Styles.primaryText13Underlined,
                    ),
                    Dimens.boxHeight30,
                    GestureDetector(
                      key: subscriptionButtonKey,
                      onTap: () {
                        if (kIsWeb) {
                          if (Responsive.isWeb(context) ||
                              Responsive.isTablet(context) ||
                              Responsive.isMobile(context)) {
                            Get.back<void>();
                            subscriptionSheetDialog(context);
                          }
                        } else {}
                      },
                      child: Container(
                        height: Dimens.eighty,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: ColorsValue.primaryColor,
                          borderRadius: BorderRadius.circular(Dimens.seven),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              StringConstants.subscribe.toUpperCase(),
                              style: Styles.primaryText20,
                            ),
                            Dimens.boxHeight10,
                            Text(
                              StringConstants
                                  .oneMonthFreeTrialThenFourNineDollerPerMonth
                                  .toUpperCase(),
                              style: Styles.primaryText13,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              : Column(
                  children: [
                    Container(
                      padding: Dimens.edgeInsets12_0_12_0,
                      constraints:
                          const BoxConstraints(maxHeight: double.infinity),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(Dimens.twoHundred),
                          bottomRight: Radius.circular(Dimens.twoHundred),
                        ),
                        border: Border.all(
                            color: ColorsValue.primaryColor,
                            width: Dimens.five),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Dimens.boxHeight50,
                          Image.asset(
                            AssetConstants.omfLogo,
                            width: Dimens.hundredSixtyTwo,
                            height: Dimens.fourty,
                          ),
                          Dimens.boxHeight5,
                          Text(
                            StringConstants.membership.toUpperCase(),
                            style: Styles.boldSecondaryText16,
                          ),
                          Dimens.boxHeight10,
                          Image.asset(
                            AssetConstants.membership,
                            height: Dimens.threeHundred,
                            width: Dimens.twoHundredFifty,
                          ),
                          Dimens.boxHeight35,
                        ],
                      ),
                    ),
                    Dimens.boxHeight25,
                    Text(
                      StringConstants.loremIpsum +
                          StringConstants.loremIpsum +
                          StringConstants.loremIpsum,
                      textAlign: TextAlign.center,
                      style: Styles.primaryText12,
                    ),
                    Dimens.boxHeight10,
                    Text(
                      StringConstants.termsOfServiceAndPrivacyPlicy,
                      style: Styles.primaryText13Underlined,
                    ),
                    Dimens.boxHeight30,
                    GestureDetector(
                      key: subscriptionButtonKey,
                      onTap: () {
                        if (kIsWeb) {
                          if (Responsive.isWeb(context) ||
                              Responsive.isTablet(context) ||
                              Responsive.isMobile(context)) {
                            Get.back<void>();
                            Get.bottomSheet<void>(
                              Container(
                                height: Dimens.fourHundred,
                                width: double.infinity,
                                color: ColorsValue.greyBoxColor,
                                child: SubscriptionSheet(),
                              ),
                              barrierColor:
                                  ColorsValue.blackColor.withOpacity(0.9),
                              isDismissible: true,
                              enableDrag: true,
                            );
                          }
                        } else {
                          Get.bottomSheet<void>(
                            Container(
                              height: Dimens.fourHundred,
                              width: double.infinity,
                              color: ColorsValue.greyBoxColor,
                              child: SubscriptionSheet(),
                            ),
                            barrierColor:
                                ColorsValue.blackColor.withOpacity(0.9),
                            isDismissible: true,
                            enableDrag: true,
                          );
                        }
                      },
                      child: Container(
                        height: Dimens.eighty,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: ColorsValue.primaryColor,
                          borderRadius: BorderRadius.circular(Dimens.seven),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              StringConstants.subscribe.toUpperCase(),
                              style: Styles.primaryText20,
                            ),
                            Dimens.boxHeight10,
                            Text(
                              StringConstants
                                  .oneMonthFreeTrialThenFourNineDollerPerMonth
                                  .toUpperCase(),
                              style: Styles.primaryText13,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
        ),
      );

  void subscriptionSheetDialog(
    BuildContext context,
  ) {
    showDialog<String>(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) => Dialog(
        insetPadding: EdgeInsets.all(Dimens.ten),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.ten),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Container(
          width: Responsive.isWeb(context)
              ? Dimens.percentWidth(.30)
              : Responsive.isTablet(context)
                  ? Dimens.percentWidth(.50)
                  : Dimens.percentWidth(.90),
          height: Responsive.isWeb(context)
              ? Dimens.percentHeight(.70)
              : Responsive.isTablet(context)
                  ? Dimens.percentHeight(.60)
                  : Dimens.percentHeight(.90),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.ten),
            color: ColorsValue.scaffoldBackgroundColor,
          ),
          child: SubscriptionSheet(),
        ),
      ),
    );
  }
}
