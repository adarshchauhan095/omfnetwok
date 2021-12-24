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
              StringConstants.shop,
              style: Styles.boldPrimaryText22,
            ),
            Dimens.boxHeight25,
            Text(
              StringConstants.myList,
              style: Styles.secondaryText18,
            ),
            Dimens.boxHeight25,
            Text(
              StringConstants.availableForDownload,
              style: Styles.secondaryText18,
            ),
            Dimens.boxHeight25,
            Text(
              StringConstants.hindi,
              style: Styles.secondaryText18,
            ),
            Dimens.boxHeight25,
            Text(
              StringConstants.tamil,
              style: Styles.secondaryText18,
            ),
            Dimens.boxHeight25,
            Text(
              StringConstants.punjabi,
              style: Styles.secondaryText18,
            ),
            Dimens.boxHeight25,
            Text(
              StringConstants.telugu,
              style: Styles.secondaryText18,
            ),
            Dimens.boxHeight25,
            Text(
              StringConstants.malyalam,
              style: Styles.secondaryText18,
            ),
            Dimens.boxHeight25,
            Text(
              StringConstants.marathi,
              style: Styles.secondaryText18,
            ),
            Dimens.boxHeight25,
            Text(
              StringConstants.bengali,
              style: Styles.secondaryText18,
            ),
            Dimens.boxHeight25,
            Text(
              StringConstants.english,
              style: Styles.secondaryText18,
            ),
            Dimens.boxHeight25,
            Text(
              StringConstants.heloween,
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
