import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:omf_netflix/app/app.dart';

/// A Widget for [PhonenumberEditView]
class PhonenumberEditView extends StatelessWidget {
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
              'changePhoneNumber'.tr,
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
                      Dimens.boxHeight10,
                      Dimens.boxHeight10,
                      Padding(
                        padding: Dimens.edgeInsets12_0_12_0,
                        child: Obx(
                          () => Container(
                            constraints: BoxConstraints(maxHeight: Get.height),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimens.seven),
                                color: ColorsValue.greyColor),
                            child: Padding(
                              padding: Dimens.edgeInsets15_0_0_0,
                              child: InternationalPhoneNumberInput(
                                onInputChanged: (PhoneNumber number) {
                                  _controller.dObject.run(() {
                                    _controller.storePhoneNumber(number);
                                  });
                                },
                                onInputValidated: (v) {
                                  _controller.checkPhoneNumberValidity(v);
                                },
                                cursorColor: ColorsValue.whiteColor,
                                inputDecoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: Styles.greyLight15,
                                  hintText: 'enterYourPhoneNumber'.tr,
                                  suffixIcon: _controller
                                          .isPhonenumberChecking.value
                                      ? Transform.scale(
                                          scale: 0.4,
                                          child:
                                              const CircularProgressIndicator(),
                                        )
                                      : _controller.isPhoneNumberChecked.value
                                          ? !_controller
                                                  .isPhoneNumberTaken.value
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
                                textStyle: Styles.white14,
                                selectorConfig: const SelectorConfig(
                                  trailingSpace: false,
                                  selectorType: PhoneInputSelectorType.DIALOG,
                                ),
                                ignoreBlank: false,
                                autoValidateMode: AutovalidateMode.disabled,
                                selectorTextStyle: const TextStyle(
                                    color: ColorsValue.whiteColor),
                                initialValue: _controller.pPhoneNumber,
                                textFieldController: _controller.phoneNumber,
                                formatInput: false,
                                keyboardType: TextInputType.number,
                                inputBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => Column(
                          children: [
                            !_controller.isPhoneNumberValid.value ||
                                    _controller.isPhoneNumberTaken.value
                                ? Dimens.boxHeight10
                                : Dimens.box0,
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
                                        ? Container(
                                            padding: Dimens.edgeInsets15_0_0_0,
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'alreadyRegistered'.tr,
                                              style: TextStyle(
                                                color: ColorsValue.redColor,
                                                fontSize: Dimens.fourteen,
                                              ),
                                            ),
                                          )
                                        : Dimens.box0,
                          ],
                        ),
                      ),
                      Dimens.boxHeight10,
                    ],
                  ),
                ),
                Obx(
                  () => Padding(
                    padding: Dimens.edgeInsets12_0_12_0,
                    child: GlobalButton(
                        title: 'update'.tr,
                        isDisable: !_controller.isUpdateButtonEnable.value,
                        onTap: () async {
                          if (_controller.phoneNumber.text.isNotEmpty &&
                              _controller.isPhoneNumberValid.value &&
                              !_controller.isPhoneNumberTaken.value) {
                            await _controller.sendVerificationCode();
                          }
                        }),
                  ),
                ),
                Dimens.boxHeight20
              ],
            ),
          ),
        ),
      );
}
