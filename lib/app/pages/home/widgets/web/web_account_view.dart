import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:omf_netflix/app/app.dart';

class WebAccountView extends StatelessWidget {
  const WebAccountView({Key? key, required this.controller}) : super(key: key);
  final AccountController controller;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            Dimens.boxHeight10,
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringConstants.firstName,
                        style: Styles.primaryText14,
                      ),
                      Dimens.boxHeight9,
                      FormFieldWidget(
                        contentPadding: Dimens.edgeInsets16,
                        onChange: (va) {},
                        fillColor: ColorsValue.greyBoxColor,
                        formStyle: Styles.primaryText14,
                        hintStyle: Styles.greyLight15,
                        hintText: StringConstants.enterFirstName,
                        textInputType: TextInputType.text,
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        initialValue: StringConstants.testOne,
                        formBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Dimens.seven),
                        ),
                      ),
                      Dimens.boxHeight20,
                      Text(
                        StringConstants.lastName,
                        style: Styles.primaryText14,
                      ),
                      Dimens.boxHeight9,
                      FormFieldWidget(
                        contentPadding: Dimens.edgeInsets16,
                        onChange: (va) {},
                        fillColor: ColorsValue.greyBoxColor,
                        hintStyle: Styles.greyLight15,
                        hintText: StringConstants.enterLastName,
                        formStyle: Styles.primaryText14,
                        textInputType: TextInputType.text,
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        initialValue: StringConstants.testOne,
                        formBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Dimens.seven),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(Dimens.hundred),
                        child: Get.testMode == true
                            ? Dimens.box0
                            : controller.imageFile == null
                                ? Image.network(
                                    AssetConstants.avatarProfile,
                                    width: Dimens.hundred,
                                    height: Dimens.hundred,
                                    fit: BoxFit.cover,
                                  )
                                : Image.file(
                                    controller.imageFile!,
                                    width: Dimens.hundred,
                                    height: Dimens.hundred,
                                    fit: BoxFit.cover,
                                  ),
                      ),
                      Dimens.boxHeight15,
                      GestureDetector(
                        onTap: () {
                          Get.bottomSheet(
                            Container(
                              height: Dimens.twoHundred,
                              width: double.infinity,
                              color: ColorsValue.greyBoxColor,
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: Dimens.edgeInsets10_15_10_15,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          controller
                                              .pickImage(ImageSource.camera);
                                          Get.back<void>();
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: Dimens.fourty,
                                          decoration: BoxDecoration(
                                            color: ColorsValue.greyColor,
                                            borderRadius: BorderRadius.circular(
                                                Dimens.seven),
                                          ),
                                          child: Center(
                                            child: Text(
                                              StringConstants.openCamera,
                                              style: Styles.primaryText16,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Dimens.boxHeight10,
                                      GestureDetector(
                                        onTap: () {
                                          controller
                                              .pickImage(ImageSource.gallery);
                                          Get.back<void>();
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: Dimens.fourty,
                                          decoration: BoxDecoration(
                                            color: ColorsValue.greyColor,
                                            borderRadius: BorderRadius.circular(
                                                Dimens.seven),
                                          ),
                                          child: Center(
                                            child: Text(
                                              StringConstants.openGallery,
                                              style: Styles.primaryText16,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Dimens.boxHeight10,
                                      GlobalButton(
                                          title: StringConstants.cancel,
                                          buttonColor: ColorsValue.redColor,
                                          onTap: () {
                                            Get.back<void>();
                                          })
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            barrierColor:
                                ColorsValue.blackColor.withOpacity(0.9),
                            isDismissible: true,
                            enableDrag: false,
                          );
                        },
                        child: Text(
                          StringConstants.edit,
                          style: Styles.primaryText15,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Dimens.boxHeight20,
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                StringConstants.username,
                style: Styles.primaryText14,
              ),
            ),
            Dimens.boxHeight9,
            FormFieldWidget(
              contentPadding: Dimens.edgeInsets16,
              onChange: (va) {},
              fillColor: ColorsValue.greyBoxColor,
              formStyle: Styles.primaryText14,
              textInputType: TextInputType.text,
              hintStyle: Styles.greyLight15,
              hintText: StringConstants.enterUsername,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.lock,
                  color: ColorsValue.whiteColor,
                ),
              ),
              focusedBorder:
                  const OutlineInputBorder(borderSide: BorderSide.none),
              initialValue: StringConstants.testOne,
              formBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimens.seven),
              ),
            ),
            Dimens.boxHeight20,
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                StringConstants.phoneNumber,
                style: Styles.primaryText14,
              ),
            ),
            Dimens.boxHeight9,
            FormFieldWidget(
              contentPadding: Dimens.edgeInsets16,
              onChange: (va) {},
              fillColor: ColorsValue.greyBoxColor,
              formStyle: Styles.primaryText14,
              textInputType: TextInputType.number,
              prefixIcon: Padding(
                padding: Dimens.edgeInsets15_0_0_0,
                child: InternationalPhoneNumberInput(
                  onInputChanged: (value) {
                    controller.checkIfPhoneNumberValid(value.toString());
                  },
                  onInputValidated: controller.storePhoneNumberCheck,
                  errorMessage: controller.phoneNumberError,
                  spaceBetweenSelectorAndTextField: Dimens.one,
                  selectorConfig: const SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  ),
                  inputBorder:
                      const OutlineInputBorder(borderSide: BorderSide.none),
                  ignoreBlank: false,
                  autoValidateMode: AutovalidateMode.disabled,
                  textStyle: Styles.primaryText14,
                  hintText: StringConstants.phoneNumber,
                  selectorTextStyle: Styles.primaryText14,
                  formatInput: false,
                  keyboardType: const TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                ),
              ),
              hintText: StringConstants.phoneNumber,
              errorText: controller.phoneNumberError,
              errorStyle: Styles.red12,
              focusedBorder:
                  const OutlineInputBorder(borderSide: BorderSide.none),
              initialValue: '9988776655',
              errorBorder:
                  const OutlineInputBorder(borderSide: BorderSide.none),
              formBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimens.seven),
              ),
            ),
            Dimens.boxHeight20,
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                StringConstants.emailAddress,
                style: Styles.primaryText14,
              ),
            ),
            Dimens.boxHeight9,
            FormFieldWidget(
              contentPadding: Dimens.edgeInsets16,
              onChange: (va) {},
              fillColor: ColorsValue.greyBoxColor,
              formStyle: Styles.primaryText14,
              textInputType: TextInputType.emailAddress,
              hintStyle: Styles.greyLight15,
              hintText: StringConstants.emailAddress,
              focusedBorder:
                  const OutlineInputBorder(borderSide: BorderSide.none),
              initialValue: StringConstants.emailExample,
              formBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimens.seven),
              ),
            ),
            Dimens.boxHeight20,
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  Get.find<HomeController>().setWebWidgetIndex(5);
                },
                child: Text(
                  StringConstants.changePassword,
                  style: Styles.red15,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GlobalButton(
                onTap: () {
                  Get.snackbar('Message', 'Profile Details Saved Successfully!',
                      colorText: ColorsValue.whiteColor,
                      snackPosition: SnackPosition.BOTTOM);
                },
                title: StringConstants.save,
                buttonColor: ColorsValue.primaryColor,
                titleStyle: Styles.primaryText16,
                width: Dimens.hundred,
              ),
            )
          ],
        ),
      );
}
