import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

class ContentSaveProfilePopup extends StatelessWidget {
  const ContentSaveProfilePopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<AccountController>(
      builder: (_controller) => Container(
            height: Dimens.twoHundred,
            width: double.infinity,
            color: ColorsValue.greyBoxColor,
            child: Padding(
              padding: Dimens.edgeInsets15_20_15_0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Message',
                    style: Styles.primaryText23,
                  ),
                  Dimens.boxHeight10,
                  Text(
                    'Are you sure want to save profile.',
                    maxLines: 2,
                    style: Styles.primaryText16,
                  ),
                  Dimens.boxHeight20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleImageAvatar(
                        onTap: () {
                          _controller.saveProfile();
                          Get.back<void>();
                        },
                        borderRadius: Dimens.ten,
                        color: ColorsValue.primaryColor,
                        width: Dimens.hundredFifty,
                        height: Dimens.fifty,
                        child: Center(
                          child: Text(
                            'Yes',
                            style: Styles.primaryText16,
                          ),
                        ),
                      ),
                      CircleImageAvatar(
                        onTap: () {
                          Get.back<void>();
                        },
                        borderRadius: Dimens.ten,
                        color: ColorsValue.redColor,
                        width: Dimens.hundredFifty,
                        height: Dimens.fifty,
                        child: Center(
                          child: Text(
                            'Cancel',
                            style: Styles.primaryText16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ));
}
