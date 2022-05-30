import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:omf_netflix/app/app.dart';

class ImagePickingWidget extends StatelessWidget {
  const ImagePickingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<AccountController>(
    builder: (_controller) => Container(
            height: Dimens.twoHundred,
            width: double.infinity,
            color: ColorsValue.greyBoxColor,
            child: SingleChildScrollView(
              child: Padding(
                padding: Dimens.edgeInsets10_15_10_15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _controller.pickImage(ImageSource.camera);
                        Get.back<void>();
                      },
                      child: Container(
                        width: double.infinity,
                        height: Dimens.fourty,
                        decoration: BoxDecoration(
                          color: ColorsValue.greyColor,
                          borderRadius: BorderRadius.circular(Dimens.seven),
                        ),
                        child: Center(
                          child: Text(
                            'openCamera'.tr,
                            style: Styles.primaryText16,
                          ),
                        ),
                      ),
                    ),
                    Dimens.boxHeight10,
                    GestureDetector(
                      onTap: () {
                        _controller.pickImage(ImageSource.gallery);
                        Get.back<void>();
                      },
                      child: Container(
                        width: double.infinity,
                        height: Dimens.fourty,
                        decoration: BoxDecoration(
                          color: ColorsValue.greyColor,
                          borderRadius: BorderRadius.circular(Dimens.seven),
                        ),
                        child: Center(
                          child: Text(
                            'openGallery'.tr,
                            style: Styles.primaryText16,
                          ),
                        ),
                      ),
                    ),
                    Dimens.boxHeight10,
                    GlobalButton(
                        title: 'cancel'.tr,
                        buttonColor: ColorsValue.redColor,
                        onTap: () {
                          Get.back<void>();
                        })
                  ],
                ),
              ),
            ),
          )
  );
}
