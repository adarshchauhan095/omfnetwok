import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:omf_netflix/app/app.dart';

/// Widget will active when user wants to Login using Phonenumber.
class PhoneNumberWidget extends StatelessWidget {
  const PhoneNumberWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<LoginController>(
        builder: (_controller) => GestureDetector(
          onTap: () {
            var currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Text(
                'phoneNumber'.tr,
                style: Styles.primaryText13,
              ),
              Dimens.boxHeight10,
              Container(
                constraints: BoxConstraints(maxHeight: Get.height),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimens.seven),
                    color: ColorsValue.whiteColor),
                child: Padding(
                  padding: Dimens.edgeInsets15_0_0_0,
                  child: InternationalPhoneNumberInput(
                    onInputChanged: (PhoneNumber number) {
                      _controller.storePhoneNumber(number);
                    },
                    autoFocus: false,
                    onInputValidated: (v) {
                      _controller.checkPhoneNumberValidity(v);
                    },
                    selectorConfig: const SelectorConfig(
                      selectorType: PhoneInputSelectorType.DIALOG,
                    ),
                    ignoreBlank: false,
                    autoValidateMode: AutovalidateMode.disabled,
                    selectorTextStyle:
                        const TextStyle(color: ColorsValue.primaryColor),
                    initialValue: _controller.pPhoneNumber,
                    textFieldController: _controller.phoneNumber,
                    formatInput: false,
                    keyboardType: TextInputType.number,
                    inputBorder: InputBorder.none,
                    inputDecoration: InputDecoration(
                      contentPadding: Dimens.edgeInsets0,
                      hintStyle: Styles.grey14,
                      hintText: 'phoneNumber'.tr,
                      border: InputBorder.none,
                      suffixIcon: _controller.isPhonenumberChecking.value
                          ? Transform.scale(
                              scale: 0.4,
                              child: const CircularProgressIndicator(),
                            )
                          : _controller.isPhoneNumberChecked.value
                              ? _controller.isPhoneNumberTaken.value
                                  ? const Icon(
                                      Icons.check_circle,
                                      color: ColorsValue.greenColor,
                                    )
                                  : const Icon(
                                      Icons.cancel,
                                      color: ColorsValue.redColor,
                                    )
                              : Dimens.box0,
                    ),
                    cursorColor: ColorsValue.blackColor,
                    textStyle: Styles.black14,
                  ),
                ),
              ),
              Obx(
                () => Column(
                  children: [
                    Dimens.boxHeight5,
                    !_controller.isPhoneNumberValid.value
                        ? Container(
                            padding: Dimens.edgeInsets15_0_0_0,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'enterAValidNumber'.tr,
                              style: Styles.red12,
                            ),
                          )
                        : !_controller.isPhoneNumberChecked.value
                            ? Dimens.box0
                            : _controller.isPhoneNumberTaken.value
                                ? Dimens.box0
                                : Container(
                                    padding: Dimens.edgeInsets15_0_0_0,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'notRegistered'.tr,
                                      style: Styles.red12,
                                    ),
                                  ),
                  ],
                ),
              ),
              Dimens.boxHeight25,
              
              GlobalButton(
                  title: 'continues'.tr,
                  titleStyle: Styles.primaryText15,
                  height: kIsWeb
                      ? Responsive.isWeb(context) || Responsive.isWeb(context)
                          ? 50
                          : Dimens.fourty
                      : Dimens.fifty,
                  isDisable: !_controller.isButtonEnable,
                  onTap: () async {
                    if (kIsWeb) {
                      if (Responsive.isWeb(context) ||
                          Responsive.isTablet(context) ||
                          Responsive.isMobile(context)) {
                        Get.back<void>();
                        verificationDialog(context);
                      }
                    } else {
                      // await _controller.loginAsGuestFirstPhoneNumber();
                      await _controller.sendVerificationCode();
                    }
                  }),
            ],
          ),
        ),
      );

  void verificationDialog(
    BuildContext context,
  ) {
    showDialog<void>(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) => Dialog(
        insetPadding: EdgeInsets.all(Dimens.ten),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.ten),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Container(
          alignment: Alignment.center,
          width: Responsive.isWeb(context)
              ? Dimens.percentWidth(.40)
              : Responsive.isTablet(context)
                  ? Dimens.percentWidth(.60)
                  : Dimens.percentWidth(.80),
          height: Responsive.isWeb(context)
              ? Dimens.percentHeight(.50)
              : Responsive.isTablet(context)
                  ? Dimens.percentHeight(.50)
                  : Dimens.percentHeight(.50),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.ten),
            color: ColorsValue.scaffoldBackgroundColor,
          ),
          child: LoginOtpWidget(),
        ),
      ),
    );
  }
}
