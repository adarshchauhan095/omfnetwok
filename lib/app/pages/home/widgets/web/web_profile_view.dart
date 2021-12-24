import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

class WebProfileView extends StatelessWidget {
  const WebProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
      builder: (_controller) => SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const WebAppBar(),
                Dimens.boxHeight50,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: Dimens.edgeInsets35_0_15_0,
                    child: Text(
                      StringConstants.profile,
                      style: Styles.primaryText18,
                    ),
                  ),
                ),
                Dimens.boxHeight30,
                Padding(
                  padding: Dimens.edgeInsets35_0_15_0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ProfileLeft(),
                      Dimens.boxWidth5,
                      Container(
                        height: Get.height,
                        width: Dimens.two,
                        color: ColorsValue.greyBoxColor,
                      ),
                      Dimens.boxWidth20,
                      const ProfileRight()
                    ],
                  ),
                )
              ],
            ),
          ));
}
