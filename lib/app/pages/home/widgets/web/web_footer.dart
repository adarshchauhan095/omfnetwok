import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

class WebFooter extends StatelessWidget {
  const WebFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (_controller) => Padding(
          padding: Responsive.isWeb(context)
              ? Dimens.edgeInsets150_0_150_0
              : Responsive.isTablet(context)
                  ? Dimens.edgeInsets100_0_100_0
                  : Dimens.edgeInsets35_0_15_0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SocialIcon(
                    icon: Icons.facebook,
                    onTap: () {
                      Get.snackbar<void>(
                        'Message',
                        'Facebook',
                        backgroundColor: ColorsValue.primaryColor
                            .withOpacity(Dimens.pointFive),
                        colorText: ColorsValue.whiteColor,
                      );
                    },
                  ),
                  Dimens.boxWidth15,
                  SocialIcon(
                    icon: Icons.facebook,
                    onTap: () {
                      Get.snackbar<void>(
                        'Message',
                        'Instagram',
                        backgroundColor: ColorsValue.primaryColor
                            .withOpacity(Dimens.pointFive),
                        colorText: ColorsValue.whiteColor,
                      );
                    },
                  ),
                  Dimens.boxWidth15,
                  SocialIcon(
                    icon: Icons.facebook,
                    onTap: () {
                      Get.snackbar<void>(
                        'Message',
                        'Twitter',
                        backgroundColor: ColorsValue.primaryColor
                            .withOpacity(Dimens.pointFive),
                        colorText: ColorsValue.whiteColor,
                      );
                    },
                  ),
                  Dimens.boxWidth15,
                  SocialIcon(
                    icon: Icons.facebook,
                    onTap: () {
                      Get.snackbar<void>(
                        'Message',
                        'Youtube',
                        backgroundColor: ColorsValue.primaryColor
                            .withOpacity(Dimens.pointFive),
                        colorText: ColorsValue.whiteColor,
                      );
                    },
                  ),
                ],
              ),
              Dimens.boxHeight10,
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: Responsive.isWeb(context)
                        ? 4
                        : Responsive.isTablet(context)
                            ? 3
                            : 2,
                    childAspectRatio: Dimens.eight,
                    mainAxisSpacing: Dimens.ten),
                itemCount: _controller.footerMenuList.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Get.snackbar<void>(
                      'Message',
                      _controller.footerMenuList[index],
                      backgroundColor: ColorsValue.primaryColor
                          .withOpacity(Dimens.pointFive),
                      colorText: ColorsValue.whiteColor,
                    );
                  },
                  child: Text(
                    _controller.footerMenuList[index],
                    style: Styles.footerColor11,
                  ),
                ),
              ),
              Dimens.boxHeight15,
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all(Dimens.edgeInsets4_0_4_0),
                    foregroundColor: MaterialStateProperty.all<Color>(
                        ColorsValue.whiteColor),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        ColorsValue.transparent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                            side: BorderSide(
                                color: ColorsValue.footerContentColor)))),
                child: Text(
                  StringConstants.serviceCode,
                  style: Styles.footerColor11,
                ),
              ),
              Dimens.boxHeight15,
              Row(
                children: [
                  Icon(
                    Icons.copyright_outlined,
                    color: ColorsValue.footerContentColor,
                    size: Dimens.ten,
                  ),
                  Text(
                    '1997-2021 OMF Network, Inc, (91ca828a-dc0c-40db-94c6-97c298e2a7cc)',
                    style: Styles.footerColor8,
                  )
                ],
              ),
            ],
          ),
        ),
      );
}
