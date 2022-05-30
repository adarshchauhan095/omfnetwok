import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:omf_netflix/domain/domain.dart';

/// Widget for [SignupView]
class SignupWidget extends StatelessWidget {
  const SignupWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<SignupController>(
        builder: (_controller) => GestureDetector(
          onTap: () {
            var currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Padding(
            padding: Dimens.edgeInsets16_0_16_0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WebMob(
                  web: Responsive.isWeb(context) ||
                          Responsive.isTablet(context) ||
                          Responsive.isMobile(context)
                      ? Dimens.box0
                      : Dimens.box0,
                  android: Dimens.boxHeight20,
                ),
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
                  android: GestureDetector(
                    onTap: () {
                      Get.back<void>();
                    },
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.arrow_back,
                        color: ColorsValue.whiteColor,
                      ),
                    ),
                  ),
                ),
                WebMob(
                  web: Responsive.isWeb(context) ||
                          Responsive.isTablet(context) ||
                          Responsive.isMobile(context)
                      ? Dimens.box0
                      : Dimens.box0,
                  android: Dimens.boxHeight12,
                ),
                Responsive.isWeb(context) || Responsive.isTablet(context)
                    ? Center(
                        child: Text(
                          'createAccount'.tr,
                          style: Styles.primaryText20,
                        ),
                      )
                    : Text(
                        'createAccount'.tr,
                        style: Styles.primaryText20,
                      ),
                Dimens.boxHeight4,
                Responsive.isWeb(context) || Responsive.isTablet(context)
                    ? Center(
                        child: Text(
                          'signupInfo'.tr,
                          style: Styles.secondaryText13,
                        ),
                      )
                    : Padding(
                        padding: Dimens.edgeInsets0_0_52_0,
                        child: Text(
                          'signupInfo'.tr,
                          style: Styles.secondaryText13,
                        ),
                      ),
                Dimens.boxHeight20,
                Expanded(
                  child: ListView(
                    children: [
                      Responsive.isWeb(context) || Responsive.isTablet(context)
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'firstName'.tr,
                                      style: Styles.primaryText13,
                                    ),
                                    Dimens.boxHeight10,
                                    SizedBox(
                                      width: Responsive.isWeb(context)
                                          ? Dimens.percentWidth(.12)
                                          : Dimens.percentWidth(.3),
                                      child: FormFieldWidget(
                                        contentPadding: Dimens.edgeInsets16,
                                        onChange: _controller.enterFirstName,
                                        textEditingController:
                                            _controller.firstName,
                                        fillColor: ColorsValue.whiteColor,
                                        cursorColor: ColorsValue.blackColor,
                                        textInputType: TextInputType.text,
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        hintStyle: Styles.greyLight15,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.allow(
                                              RegExp('[a-zA-Z]'))
                                        ],
                                        hintText: 'enterFirstName'.tr,
                                        formBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              Dimens.seven),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'lastName'.tr,
                                      style: Styles.primaryText13,
                                    ),
                                    Dimens.boxHeight10,
                                    SizedBox(
                                      width: Responsive.isWeb(context)
                                          ? Dimens.percentWidth(.12)
                                          : Dimens.percentWidth(.3),
                                      child: FormFieldWidget(
                                        contentPadding: Dimens.edgeInsets16,
                                        onChange: _controller.enterLastName,
                                        textEditingController:
                                            _controller.lastName,
                                        cursorColor: ColorsValue.blackColor,
                                        fillColor: ColorsValue.whiteColor,
                                        textInputType: TextInputType.text,
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        hintStyle: Styles.greyLight15,
                                        hintText: 'enterLastName'.tr,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.allow(
                                              RegExp('[a-zA-Z]'))
                                        ],
                                        formBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              Dimens.seven),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'firstName'.tr,
                                  style: Styles.primaryText13,
                                ),
                                Dimens.boxHeight10,
                                Obx(
                                  () => FormFieldWidget(
                                    contentPadding: Dimens.edgeInsets16,
                                    onChange: _controller.enterFirstName,
                                    errorText:
                                        _controller.firstNameError.value == ''
                                            ? null
                                            : _controller.firstNameError.value,
                                    textEditingController:
                                        _controller.firstName,
                                    textInputAction: TextInputAction.next,
                                    cursorColor: ColorsValue.blackColor,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    fillColor: ColorsValue.whiteColor,
                                    textInputType: TextInputType.text,
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    hintStyle: Styles.greyLight15,
                                    hintText: 'enterFirstName'.tr,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[a-zA-Z]'))
                                    ],
                                    formBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(Dimens.seven),
                                    ),
                                  ),
                                ),
                                Text(
                                  'lastName'.tr,
                                  style: Styles.primaryText13,
                                ),
                                Dimens.boxHeight10,
                                Obx(
                                  () => FormFieldWidget(
                                    contentPadding: Dimens.edgeInsets16,
                                    onChange: _controller.enterLastName,
                                    textEditingController: _controller.lastName,
                                    textInputAction: TextInputAction.next,
                                    cursorColor: ColorsValue.blackColor,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    errorText:
                                        _controller.lastNameError.value == ''
                                            ? null
                                            : _controller.lastNameError.value,
                                    fillColor: ColorsValue.whiteColor,
                                    textInputType: TextInputType.text,
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    hintStyle: Styles.greyLight15,
                                    hintText: 'enterLastName'.tr,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[a-zA-Z]'))
                                    ],
                                    formBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(Dimens.seven),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      Text(
                        'username'.tr,
                        style: Styles.primaryText13,
                      ),
                      Dimens.boxHeight10,
                      Obx(
                        () => FormFieldWidget(
                          contentPadding: Dimens.edgeInsets16,
                          onChange: (v) {
                            _controller.dObject.run(() {
                              _controller.enterUserName(v);
                            });
                          },
                          textEditingController: _controller.userName,
                          errorText: _controller.userNameError.value == ''
                              ? null
                              : _controller.userNameError.value,
                          fillColor: ColorsValue.whiteColor,
                          textInputAction: TextInputAction.next,
                          cursorColor: ColorsValue.blackColor,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[A-Za-z0-9!@#$%^&*(),.?":{}|<>]'))
                          ],
                          suffixIcon: _controller.isUsernameChecking.value
                              ? Transform.scale(
                                  scale: 0.4,
                                  child: const CircularProgressIndicator(),
                                )
                              : _controller.isUsernameChecked.value
                                  ? !_controller.isUsernameValid.value
                                      ? const Icon(
                                          Icons.check_circle,
                                          color: ColorsValue.greenColor,
                                        )
                                      : const Icon(
                                          Icons.cancel,
                                          color: ColorsValue.redColor,
                                        )
                                  : Dimens.box0,
                          textInputType: TextInputType.text,
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          hintStyle: Styles.greyLight15,
                          hintText: 'enterUsername'.tr,
                          formBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Dimens.seven),
                          ),
                        ),
                      ),
                      Text(
                        'phoneNumberCmp'.tr,
                        style: Styles.primaryText13,
                      ),
                      Dimens.boxHeight10,
                      Obx(
                        () => Container(
                          constraints: BoxConstraints(maxHeight: Get.height),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimens.seven),
                              color: ColorsValue.whiteColor),
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
                              cursorColor: ColorsValue.blackColor,
                              inputDecoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'enterYourPhoneNumber'.tr,
                                hintStyle: Styles.greyLight15,
                                suffixIcon: _controller
                                        .isPhonenumberChecking.value
                                    ? Transform.scale(
                                        scale: 0.4,
                                        child:
                                            const CircularProgressIndicator(),
                                      )
                                    : _controller.isPhoneNumberChecked.value
                                        ? !_controller.isPhoneNumberTaken.value
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
                              selectorConfig: const SelectorConfig(
                                trailingSpace: false,
                                selectorType: PhoneInputSelectorType.DIALOG,
                              ),
                              ignoreBlank: false,
                              autoValidateMode: AutovalidateMode.disabled,
                              selectorTextStyle: const TextStyle(
                                  color: ColorsValue.blackColor),
                              initialValue: _controller.pPhoneNumber,
                              textFieldController: _controller.phoneNumber,
                              formatInput: false,
                              keyboardType: TextInputType.number,
                              inputBorder: InputBorder.none,
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
                      Text(
                        'emailAddressCmp'.tr,
                        style: Styles.primaryText13,
                      ),
                      Dimens.boxHeight10,
                      Obx(
                        () => FormFieldWidget(
                          contentPadding: Dimens.edgeInsets16,
                          onChange: (v) {
                            _controller.dObject.run(() {
                              _controller.checkIfEmailIsValid(v);
                            });
                          },
                          textInputAction: TextInputAction.next,
                          cursorColor: ColorsValue.blackColor,
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
                          fillColor: ColorsValue.whiteColor,
                          textInputType: TextInputType.emailAddress,
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          hintStyle: Styles.greyLight15,
                          hintText: 'enterEmail'.tr,
                          formBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Dimens.seven),
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
                      Text(
                        'passwordCmp'.tr,
                        style: Styles.primaryText13,
                      ),
                      Dimens.boxHeight10,
                      Obx(
                        () => FormFieldWidget(
                          contentPadding: Dimens.edgeInsets16,
                          cursorColor: ColorsValue.blackColor,
                          onChange: _controller.checkIfPasswordIsValid,
                          textInputAction: TextInputAction.next,
                          textEditingController: _controller.password,
                          errorText: _controller.passwordErrors.value == ''
                              ? null
                              : _controller.passwordErrors.value,
                          fillColor: ColorsValue.whiteColor,
                          suffixIcon: GestureDetector(
                            onTap: _controller.passwordVisibility,
                            child: _controller.isPasswordVisible.value
                                ? const Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: ColorsValue.blackColor,
                                  )
                                : const Icon(
                                    Icons.remove_red_eye,
                                    color: ColorsValue.blackColor,
                                  ),
                          ),
                          obscureCharacter: '*',
                          isObscureText: _controller.isPasswordVisible.value
                              ? false
                              : true,
                          textInputType: TextInputType.emailAddress,
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          hintStyle: Styles.greyLight15,
                          hintText: 'enterPassword'.tr,
                          formBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Dimens.seven),
                          ),
                        ),
                      ),
                      Text(
                        'confirmPasswordCmp'.tr,
                        style: Styles.primaryText13,
                      ),
                      Dimens.boxHeight10,
                      Obx(
                        () => FormFieldWidget(
                          contentPadding: Dimens.edgeInsets16,
                          onChange: _controller.checkConfirmPassword,
                          // textEditingController: _controller.confirmPassword,
                          cursorColor: ColorsValue.blackColor,
                          errorText:
                              _controller.confirmPasswordErrors.value == ''
                                  ? null
                                  : _controller.confirmPasswordErrors.value,
                          fillColor: ColorsValue.whiteColor,
                          textInputAction: TextInputAction.next,
                          suffixIcon: GestureDetector(
                            onTap: _controller.confirmPasswordVisibility,
                            child: _controller.isConfirmPasswordVisible.value
                                ? const Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: ColorsValue.blackColor,
                                  )
                                : const Icon(
                                    Icons.remove_red_eye,
                                    color: ColorsValue.blackColor,
                                  ),
                          ),
                          obscureCharacter: '*',
                          isObscureText:
                              _controller.isConfirmPasswordVisible.value
                                  ? false
                                  : true,
                          textInputType: TextInputType.emailAddress,
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          hintStyle: Styles.greyLight15,
                          hintText: 'enterConfirmPassword'.tr,
                          formBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Dimens.seven),
                          ),
                        ),
                      ),
                      Dimens.boxHeight5,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => GestureDetector(
                              onTap: _controller.termsAndPolicy,
                              child: _controller.isTermsAndPolicyAccept.value
                                  ? Icon(
                                      Icons.check_box,
                                      size: Dimens.twenty,
                                      color: ColorsValue.primaryColor,
                                    )
                                  : Icon(
                                      Icons.crop_square,
                                      size: Dimens.twenty,
                                      color: ColorsValue.greyColor,
                                    ),
                            ),
                          ),
                          Dimens.boxWidth5,
                          Expanded(
                            child: Wrap(
                              children: [
                                Text(
                                  'iAcceptThe'.tr,
                                  style: Styles.primaryText14,
                                ),
                                Dimens.boxWidth3,
                                GestureDetector(
                                  onTap: () async {
                                    await _controller.termsPolicyNsfw(
                                        contentType:
                                            ContentType.termsAndConditions);
                                  },
                                  child: Text(
                                    'termsOfService'.tr,
                                    style: Styles.primary14,
                                  ),
                                ),
                                Dimens.boxWidth3,
                                Text('andThe'.tr, style: Styles.primaryText14),
                                Dimens.boxWidth3,
                                GestureDetector(
                                    onTap: () async {
                                      await _controller.termsPolicyNsfw(
                                          contentType:
                                              ContentType.privacyPoliciy);
                                    },
                                    child: Text('privacyPolicy'.tr,
                                        style: Styles.primary14)),
                                Dimens.boxWidth3,
                                Text('ofOnMyFeet'.tr,
                                    style: Styles.primaryText14),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Dimens.boxHeight25,
                      Obx(
                        () => GlobalButton(
                            title: 'create'.tr,
                            isDisable: !_controller.isSubmitButtonEnable.value,
                            titleStyle: Styles.primaryText15,
                            onTap: () {
                              if (kIsWeb) {
                                Get.back<void>();
                                verificationDialog(context);
                              } else {
                                _controller.loginAsGuestFirst();
                              }
                            }),
                      ),
                      Dimens.boxHeight30,
                      WebMob(
                        web: Responsive.isWeb(context) ||
                                Responsive.isTablet(context) ||
                                Responsive.isMobile(context)
                            ? Dimens.boxHeight10
                            : Dimens.box0,
                        android: Dimens.box0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
