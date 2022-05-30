import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// [ReportAProblemView] 
class ReportAProblemView extends StatelessWidget {
  const ReportAProblemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<AppSettingsController>(
      builder: (_controller) => Scaffold(
            appBar: AppBar(
              backgroundColor: ColorsValue.scaffoldBackgroundColor,
              leading: IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  color: ColorsValue.whiteColor,
                  size: Dimens.thirty,
                ),
                onPressed: () {
                  Get.back<void>();
                },
              ),
              centerTitle: true,
              title: Text(
                'reportAProblem'.tr,
                style: Styles.primaryText20,
              ),
            ),
            backgroundColor: ColorsValue.scaffoldBackgroundColor,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: Dimens.edgeInsets20_0_20_0,
                        child: FormFieldWidget(
                          contentPadding: Dimens.edgeInsets16,
                          onChange: _controller.enterProblemText,
                          textEditingController: _controller.problemText,
                          errorText: _controller.problemTextError,
                          fillColor: ColorsValue.greyColor,
                          formStyle: Styles.primaryText14,
                          textInputType: TextInputType.text,
                          hintStyle: Styles.greyLight15,
                          hintText: 'textHere'.tr,
                          maxlines: 4,
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          formBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Dimens.seven),
                          ),
                        ),
                      ),
                      Dimens.boxHeight10,
                      Padding(
                        padding: Dimens.edgeInsets20_0_20_0,
                        child: Text(
                          'addImage'.tr,
                          style: Styles.primaryText16,
                        ),
                      ),
                      Dimens.boxHeight10,
                      Padding(
                        padding: Dimens.edgeInsets20_0_20_0,
                        child: Text(
                          'pleaseUploadTheImage'.tr,
                          style: Styles.greyLight15,
                        ),
                      ),
                      Dimens.boxHeight10,
                      Padding(
                        padding: Dimens.edgeInsets20_0_20_0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                CircleImageAvatar(
                                  borderRadius: Dimens.seven,
                                  color: ColorsValue.blackColor,
                                  width: Dimens.seventy,
                                  borderColor: ColorsValue.redColor,
                                  borderWidth: Dimens.one,
                                  height: Dimens.seventy,
                                  child: Image.asset(
                                    AssetConstants.movie1,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Positioned(
                                  bottom: -Dimens.four,
                                  right: -Dimens.four,
                                  child: Icon(
                                    Icons.cancel,
                                    size: Dimens.twenty,
                                    color: ColorsValue.whiteColor,
                                  ),
                                )
                              ],
                            ),
                            Dimens.boxWidth10,
                            CircleImageAvatar(
                              onTap: () {
                                _controller.addImageToAttachments('image.jpg');
                              },
                              borderRadius: Dimens.seven,
                              color: ColorsValue.greyLightColor
                                  .withOpacity(Dimens.pointFiveStatic),
                              width: Dimens.seventyFour,
                              height: Dimens.seventyFour,
                              child: Center(
                                child: CircleImageAvatar(
                                  borderRadius: Dimens.fifty,
                                  width: Dimens.thirtyFour,
                                  height: Dimens.thirtyFour,
                                  child: const Center(
                                    child: Icon(
                                      Icons.add,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: Dimens.edgeInsets20_0_20_0,
                  child: GlobalButton(
                      title: 'submit'.tr,
                      isDisable: !_controller.isSubmitButtonEnable,
                      onTap: () async {
                        await _controller.reportAProblem();
                      }),
                ),
                Dimens.boxHeight10,
              ],
            ),
          ));
}
