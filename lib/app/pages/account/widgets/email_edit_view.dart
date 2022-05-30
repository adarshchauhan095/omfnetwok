import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// A Widget for [EmailEditView]
class EmailEditView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) => GetBuilder<AccountController>(
        builder: (_controller) => Scaffold(
          backgroundColor: ColorsValue.scaffoldBackgroundColor,
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
              'changeEmail'.tr,
              style: Styles.primaryText20,
            ),
          ),
          body: GestureDetector(
            onTap: () {
              var currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Dimens.boxHeight20,
                      Padding(
                        padding: Dimens.edgeInsets12_0_12_0,
                        child: Obx(
                          () => FormFieldWidget(
                            contentPadding: Dimens.edgeInsets16,
                            onChange: (v) {
                              _controller.dObject.run(() {
                                _controller.checkIfEmailIsValid(v);
                              });
                            },
                            textInputAction: TextInputAction.next,
                            suffixIcon: _controller.isEmailChecking.value
                                ? Transform.scale(
                                    scale: 0.4,
                                    child: const CircularProgressIndicator(),
                                  )
                                : _controller.isEmailIdChecked.value
                                    ? !_controller.isEmailValid.value
                                        ? Dimens.box0
                                        : !_controller.isEmailIdTaken.value
                                            ? const Icon(
                                                Icons.check_circle,
                                                color: ColorsValue.greenColor,
                                              )
                                            : const Icon(
                                                Icons.cancel,
                                                color: ColorsValue.redColor,
                                              )
                                    : Dimens.box0,
                            textEditingController: _controller.emailId,
                            errorText: _controller.emailErrorText.value == ''
                                ? null
                                : _controller.emailErrorText.value,
                            fillColor: ColorsValue.greyColor,
                            formStyle: Styles.primaryText14,
                            textInputType: TextInputType.emailAddress,
                            hintStyle: Styles.greyLight15,
                            hintText: 'emailAddress'.tr,
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            formBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(Dimens.seven),
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => Column(
                          children: [
                            !_controller.isEmailIdChecked.value
                                ? Dimens.box0
                                : !_controller.isEmailValid.value
                                    ? Dimens.box0
                                    : _controller.isEmailIdTaken.value
                                        ? Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'alreadyRegistered'.tr,
                                              style: Styles.red12,
                                            ),
                                          )
                                        : Dimens.box0,
                            _controller.isEmailIdTaken.value
                                ? Dimens.boxHeight10
                                : Dimens.box0,
                          ],
                        ),
                      ),
                      Dimens.boxHeight10,
                    ],
                  ),
                ),
                Padding(
                  padding: Dimens.edgeInsets56_0_56_0,
                  child: Text(
                    'changeEmailInfo'.tr,
                    textAlign: TextAlign.center,
                    style: Styles.primaryText12,
                  ),
                ),
                Dimens.boxHeight10,
                Padding(
                  padding: Dimens.edgeInsets12_0_12_0,
                  child: GlobalButton(
                      title: 'changeEmail'.tr,
                      onTap: () {
                        if (_controller.emailId.text.isNotEmpty) {
                          Get.bottomSheet<dynamic>(
                            Container(
                              color: ColorsValue.greyColor,
                              height: Dimens.twoHundred,
                              padding: Dimens.edgeInsets15_0_15_0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Dimens.boxHeight10,
                                  Image.asset(
                                    AssetConstants.done,
                                    width: Dimens.seventyFour,
                                    height: Dimens.seventyFour,
                                  ),
                                  Dimens.boxHeight10,
                                  Text(
                                    'checkYourMail'.tr,
                                    style: Styles.boldPrimaryText20,
                                  ),
                                  Dimens.boxHeight10,
                                  Text(
                                    'weHaveSentYouTheLinkTo'.tr,
                                    style: Styles.primaryText16,
                                  ),
                                  Dimens.boxHeight10,
                                  Text(
                                    _controller.emailId.text,
                                    style: Styles.primaryText16,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      }),
                ),
                Dimens.boxHeight20,
              ],
            ),
          ),
        ),
      );
}
