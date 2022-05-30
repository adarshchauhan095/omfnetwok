import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

class AddCollectionContent extends StatelessWidget {
  const AddCollectionContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
      builder: (_controller) => Container(
            color: ColorsValue.greyBoxColor,
            height: Dimens.fourHundred,
            padding: Dimens.edgeInsets15_20_15_0,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'newCollection'.tr,
                    style: Styles.primaryText20,
                  ),
                  Dimens.boxHeight15,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CircleImageAvatar(
                        borderRadius: Dimens.seven,
                        width: Dimens.hundredThirty,
                        height: Dimens.hundredThirty,
                        borderColor: ColorsValue.greyBoxColor,
                        borderWidth: Dimens.zero,
                        child: Image.asset(
                          AssetConstants.movie2,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Dimens.boxWidth10,
                      Text(
                        'change'.tr,
                        style: Styles.primary14,
                      )
                    ],
                  ),
                  Dimens.boxHeight15,
                  FormFieldWidget(
                    contentPadding: Dimens.edgeInsets16,
                    onChange: (v) {},
                    textEditingController: _controller.collectionNameController,
                    textInputAction: TextInputAction.done,
                    fillColor: ColorsValue.greyColor,
                    formStyle: Styles.primaryText14,
                    textInputType: TextInputType.emailAddress,
                    hintStyle: Styles.greyLight15,
                    hintText: 'newCollection'.tr,
                    formBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Dimens.fifty),
                    ),
                  ),
                  Dimens.boxHeight15,
                  GlobalButton(
                      title: 'save'.tr,
                      onTap: () async {
                        if (_controller
                            .collectionNameController.text.isNotEmpty) {
                          await _controller.createCollection();
                          Get.back<void>();
                        } else {
                          Get.snackbar<dynamic>(
                              'Message', 'Enter Collection Name',
                              backgroundColor: ColorsValue.redColor,
                              colorText: ColorsValue.whiteColor);
                        }
                      }),
                  Dimens.boxHeight10,
                ],
              ),
            ),
          ));
}
