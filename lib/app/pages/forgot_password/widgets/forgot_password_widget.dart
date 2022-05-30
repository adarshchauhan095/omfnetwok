import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// Widget for [ForgotPasswordView]
class ForgotPasswordWidget extends StatelessWidget {
  static const forgotPasswordWidgetKey = Key('forgot-password-widget-key');

  @override
  Widget build(BuildContext context) => GetBuilder<ForgotPasswordController>(
        builder: (_controller) => GestureDetector(
           onTap: () {
            var currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Padding(
            key: forgotPasswordWidgetKey,
            padding: Dimens.edgeInsets16_0_16_0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      // WebMob(
                      //   web: Responsive.isWeb(context) ||
                      //           Responsive.isTablet(context) ||
                      //           Responsive.isMobile(context)
                      //       ? Dimens.box0
                      //       : Dimens.box0,
                      //   android: Dimens.boxHeight60,
                      // ),
                      WebMob(
                        web: Responsive.isWeb(context) ||
                                Responsive.isTablet(context) ||
                                Responsive.isMobile(context)
                            ? Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.back<void>();
                                  },
                                  child: Icon(
                                    Icons.cancel_sharp,
                                    color: ColorsValue.whiteColor,
                                    size: Dimens.thirty,
                                  ),
                                ),
                              )
                            : Dimens.box0,
                        android: Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              Get.back<void>();
                            },
                            child: Image.asset(
                              AssetConstants.arrowleft,
                              width: Dimens.sixteen,
                              height: Dimens.sixteen,
                            ),
                          ),
                        ),
                      ),
                      Dimens.boxHeight12,
                      Text(
                        'forgotPassword'.tr,
                        style: Styles.primaryText20,
                      ),
                      Dimens.boxHeight4,
                      Padding(
                        padding: Dimens.edgeInsets0_0_52_0,
                        child: Text(
                          'forgotPasswordInfo'.tr,
                          style: Styles.secondaryText13,
                        ),
                      ),
                      Dimens.boxHeight50,
                      FormFieldWidget(
                          contentPadding: Dimens.edgeInsets16,
                          fillColor: ColorsValue.whiteColor,
                          autoFocus: true,
                          textInputType: TextInputType.emailAddress,
                          suffixIcon: _controller.isEmailChecking.value
                              ? Transform.scale(
                                  scale: 0.4,
                                  child: const CircularProgressIndicator(),
                                )
                              : _controller.isEmailIdChecked.value
                                  ? !_controller.isEmailValid
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
                          textInputAction: TextInputAction.next,
                          cursorColor: ColorsValue.blackColor,
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          hintStyle: Styles.greyLight15,
                          hintText: StringConstants.enterEmail,
                          formBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Dimens.seven),
                          ),
                          errorText: _controller.emailErrorText,
                          textEditingController: _controller.emailId,
                          onChange: (v) {
                            _controller.dObject.run(() {
                              _controller.checkIfEmailIsValid(v);
                            });
                          }),
                      Obx(
                        () => Column(
                          children: [
                            !_controller.isEmailIdChecked.value
                                ? Dimens.box0
                                : !_controller.isEmailValid
                                    ? Dimens.box0
                                    : _controller.isEmailIdTaken.value
                                        ? Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Not registered'.tr,
                                              style: Styles.red12,
                                            ),
                                          )
                                        : Dimens.box0,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SafeArea(
                  child: GlobalButton(
                    title: 'confirm'.tr,
                    titleStyle: Styles.primaryText15,
                    isDisable: !_controller.isEnableButton,
                    onTap: () async {
                      if (_controller.isEmailValid &&
                          _controller.emailId.text.isNotEmpty) {
                        await _controller.forgotPassword();
                      }
                    },
                  ),
                ),
                Dimens.boxHeight10,
              ],
            ),
          ),
        ),
      );
}
