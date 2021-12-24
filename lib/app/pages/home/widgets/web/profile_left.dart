import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

class ProfileLeft extends StatelessWidget {
  const ProfileLeft({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (_controller) => Row(
          children: [
            SizedBox(
              width: Responsive.isTablet(context)
                  ? Dimens.percentWidth(0.35)
                  : Responsive.isWeb(context)
                      ? Dimens.percentWidth(0.25)
                      : Dimens.percentWidth(0.15),
              child: const ProfileMenuList(),
            ),
          ],
        ),
      );
}
