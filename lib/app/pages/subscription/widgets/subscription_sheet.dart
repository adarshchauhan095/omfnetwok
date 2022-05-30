import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// [SubscriptionSheet] widget is bottom sheet content.
class SubscriptionSheet extends StatelessWidget {
  static const subscriptionSheetKey = Key('subscription-sheet-key');

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          key: subscriptionSheetKey,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: Dimens.edgeInsets22_10_22_10,
              child: Text(
                StringConstants.googlePlay,
                style: Styles.secondaryText14,
              ),
            ),
            const Divider(
              color: ColorsValue.greyColor,
            ),
            Dimens.boxHeight5,
            Padding(
              padding: Dimens.edgeInsets22_0_22_0,
              child: Row(
                children: [
                  Image.asset(
                    AssetConstants.premiumLogo,
                    width: Dimens.fourty,
                    height: Dimens.fourty,
                  ),
                  Dimens.boxWidth15,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringConstants.premiumMembershipWeekTwo,
                          style: Styles.primaryText16,
                        ),
                        Text(
                          StringConstants.videoMakerMusicVideoEditor,
                          style: Styles.secondaryText14,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Dimens.boxHeight20,
            Padding(
              padding: Dimens.edgeInsets22_0_22_0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringConstants.oneMonthAccess,
                    style: Styles.primaryText14,
                  ),
                  Text(
                    '\$ 4.99',
                    style: Styles.primaryText14,
                  ),
                ],
              ),
            ),
            Dimens.boxHeight25,
            Padding(
              padding: Dimens.edgeInsets22_0_22_0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.circle,
                    size: Dimens.five,
                    color: ColorsValue.secondaryTextColor,
                  ),
                  Dimens.boxWidth15,
                  Expanded(
                    child: Text(
                      StringConstants
                          .youArePurchasingOneWeekOfAccessWhichExpiresOnDate,
                      style: Styles.secondaryText13,
                    ),
                  ),
                ],
              ),
            ),
            Dimens.boxHeight10,
            Padding(
              padding: Dimens.edgeInsets22_0_22_0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.circle,
                    size: Dimens.five,
                    color: ColorsValue.secondaryTextColor,
                  ),
                  Dimens.boxWidth15,
                  Expanded(
                    child: Text(
                      StringConstants.theSubscriptionWillNotAutometicallyRenew,
                      style: Styles.secondaryText13,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: ColorsValue.greyColor,
            ),
            Padding(
              padding: Dimens.edgeInsets22_10_22_10,
              child: Row(
                children: [
                  Image.asset(
                    AssetConstants.googlePlayIcon,
                    width: Dimens.thirtyFive,
                    height: Dimens.twenty,
                  ),
                  Dimens.boxWidth10,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringConstants.googlePlayBalance,
                          style: Styles.primaryText14,
                        ),
                        Dimens.boxHeight2,
                        Text(
                          StringConstants.insufficientBalance,
                          style: Styles.red12,
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.keyboard_arrow_right_outlined,
                    size: Dimens.twenty,
                    color: ColorsValue.whiteColor,
                  ),
                ],
              ),
            ),
            Dimens.boxHeight10,
            Padding(
              padding: Dimens.edgeInsets22_0_22_0,
              child: GlobalButton(
                  title: StringConstants.continues,
                  onTap: () {
                    if (kIsWeb) {
                      if (Responsive.isWeb(context) ||
                          Responsive.isTablet(context) ||
                          Responsive.isMobile(context)) {
                        Get.back<void>();
                      } else {
                        
                      }
                    } else {
                      RouteManagement.goToOffHome();
                    }
                  }),
            )
          ],
        ),
      );
}
