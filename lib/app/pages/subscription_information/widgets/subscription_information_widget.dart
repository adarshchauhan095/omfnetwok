import 'package:flutter/material.dart';
import 'package:omf_netflix/app/app.dart';

/// Widget for [SubscriptionInformationView] screen.
class SubscriptionInformationWidget extends StatelessWidget {
  static const subscriptionInformationWidgetKey =
      Key('subscription-information-widget-key');
  @override
  Widget build(BuildContext context) => Padding(
        key: subscriptionInformationWidgetKey,
        padding: Dimens.edgeInsets56_0_56_0,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Responsive.isWeb(context) || Responsive.isTablet(context)
                    ? Dimens.box0
                    : Dimens.boxHeight50,
                Text(
                  '${StringConstants.currentPlan}:',
                  style: Styles.primaryText17,
                ),
                Dimens.boxHeight12,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AssetConstants.omfImage,
                      width: Responsive.isWeb(context) ||
                              Responsive.isTablet(context)
                          ? Dimens.eighty
                          : Dimens.hundredSixtyTwo,
                      height: Responsive.isWeb(context) ||
                              Responsive.isTablet(context)
                          ? Dimens.thirty
                          : Dimens.thirtyNine,
                    ),
                    Image.asset(
                      AssetConstants.premium,
                      width: Responsive.isWeb(context) ||
                              Responsive.isTablet(context)
                          ? Dimens.seventyFour
                          : Dimens.eightyFive,
                      height: Responsive.isWeb(context) ||
                              Responsive.isTablet(context)
                          ? Dimens.fifteen
                          : Dimens.twentyFive,
                    ),
                  ],
                ),
                Dimens.boxHeight15,
                Divider(
                  color: ColorsValue.greyColor,
                  thickness: Dimens.three,
                ),
                Responsive.isWeb(context) || Responsive.isTablet(context)
                    ? Dimens.boxHeight15
                    : Dimens.boxHeight45,
                Image.asset(
                  AssetConstants.membership,
                  width: Dimens.twoHundredThirtySix,
                  height: Dimens.twoHundredEighty,
                ),
                Responsive.isWeb(context) || Responsive.isTablet(context)
                    ? Dimens.boxHeight15
                    : Dimens.boxHeight45,
                Padding(
                  padding: Dimens.edgeInsets20_0_20_0,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: StringConstants.youAreCurrentlySubscribedToOmf,
                      style: Styles.primaryText15,
                      children: <TextSpan>[
                        TextSpan(
                            text: ' ${StringConstants.iTunes}',
                            style: Styles.primary15Underlined),
                      ],
                    ),
                  ),
                ),
                Dimens.boxHeight12,
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: StringConstants.yourSubscriptionIsSubjectToThe,
                    style: Styles.primaryText12,
                    children: <TextSpan>[
                      TextSpan(
                          text: ' ${StringConstants.omfNetwork}',
                          style: Styles.primary12Underlinded),
                      TextSpan(
                          text: ' ${StringConstants.subscriptionTerms}',
                          style: Styles.primary12Underlinded),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
