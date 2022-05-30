import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// DropdownShows is the bottom sheet from has all languages link.
class DropdownShows extends StatelessWidget {
  const DropdownShows({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        constraints: const BoxConstraints(maxHeight: double.infinity),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Dimens.boxHeight60,
            Text(
              'shop'.tr,
              style: Styles.boldPrimaryText22,
            ),
            Dimens.boxHeight25,
            Text(
              'myList'.tr,
              style: Styles.secondaryText18,
            ),
            Dimens.boxHeight25,
            Text(
              'availableForDownload'.tr,
              style: Styles.secondaryText18,
            ),
            Dimens.boxHeight25,
            Text(
              'hindi'.tr,
              style: Styles.secondaryText18,
            ),
            Dimens.boxHeight25,
            Text(
              'tamil'.tr,
              style: Styles.secondaryText18,
            ),
            Dimens.boxHeight25,
            Text(
              'punjabi'.tr,
              style: Styles.secondaryText18,
            ),
            Dimens.boxHeight25,
            Text(
              'telugu'.tr,
              style: Styles.secondaryText18,
            ),
            Dimens.boxHeight25,
            Text(
              'malyalam'.tr,
              style: Styles.secondaryText18,
            ),
            Dimens.boxHeight25,
            Text(
              'marathi'.tr,
              style: Styles.secondaryText18,
            ),
            Dimens.boxHeight25,
            Text(
              'bengali'.tr,
              style: Styles.secondaryText18,
            ),
            Dimens.boxHeight25,
            Text(
              'english'.tr,
              style: Styles.secondaryText18,
            ),
            Dimens.boxHeight25,
            Text(
              'heloween'.tr,
              style: Styles.secondaryText18,
            ),
            Dimens.boxHeight25,
            GestureDetector(
              onTap: () {
                Get.back<void>();
              },
              child: Container(
                width: Dimens.sixty,
                height: Dimens.sixty,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Dimens.hundred,
                    ),
                    color: ColorsValue.whiteColor),
                child: Center(
                  child: Image.asset(AssetConstants.cancel),
                ),
              ),
            )
          ],
        ),
      );
}
