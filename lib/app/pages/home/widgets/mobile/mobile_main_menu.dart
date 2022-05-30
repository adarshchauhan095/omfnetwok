import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

class MobileMainMenus extends StatelessWidget {
  const MobileMainMenus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Positioned(
        top: Dimens.eighty,
        left: kIsWeb ? Dimens.twentyTwo : Dimens.zero,
        child: Row(
          children: [
            Dimens.boxWidth16,
            Text(
              StringConstants.shows,
              style: Styles.primaryText16,
            ),
            Dimens.boxWidth35,
            Text(
              StringConstants.omfApp,
              style: Styles.primaryText16,
            ),
            Dimens.boxWidth35,
            GestureDetector(
              onTap: () {
                Get.bottomSheet<void>(
                  const DropdownShows(),
                  isScrollControlled: true,
                  barrierColor: ColorsValue.blackColor,
                  isDismissible: true,
                  enableDrag: false,
                );
              },
              child: Row(
                children: [
                  Text(
                    StringConstants.shop,
                    style: Styles.primaryText16,
                  ),
                  Dimens.boxWidth5,
                  const Icon(
                    Icons.arrow_drop_down,
                    color: ColorsValue.whiteColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
