import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:omf_netflix/app/app.dart';

/// Widget for [SignupView]
class SignupWidget extends StatelessWidget {
  const SignupWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<SignupController>(
        builder: (_controller) => Padding(
          padding: Dimens.edgeInsets16_0_16_0,
          child: ListView(
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
                        StringConstants.createAccount,
                        style: Styles.primaryText20,
                      ),
                    )
                  : Text(
                      StringConstants.createAccount,
                      style: Styles.primaryText20,
                    ),
              Dimens.boxHeight4,
              Responsive.isWeb(context) || Responsive.isTablet(context)
                  ? Center(
                      child: Text(
                        StringConstants.signupInfo,
                        style: Styles.secondaryText13,
                      ),
                    )
                  : Padding(
                      padding: Dimens.edgeInsets0_0_52_0,
                      child: Text(
                        StringConstants.signupInfo,
                        style: Styles.secondaryText13,
                      ),
                    ),
              Dimens.boxHeight20,
              Responsive.isWeb(context) || Responsive.isTablet(context)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringConstants.firstName,
                              style: Styles.primaryText13,
                            ),
                            Dimens.boxHeight10,
                            SizedBox(
                              width: Responsive.isWeb(context)
                                  ? Dimens.percentWidth(.12)
                                  : Dimens.percentWidth(.3),
                              child: FormFieldWidget(
                                contentPadding: Dimens.edgeInsets16,
                                onChange: (val) {},
                                fillColor: ColorsValue.whiteColor,
                                textInputType: TextInputType.text,
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                hintStyle: Styles.greyLight15,
                                inputFormatters: [
                                  // WhitelistingTextInputFormatter(RegExp('[a-zA-Z]')),
                                ],
                                hintText: StringConstants.enterFirstName
                                    .toLowerCase(),
                                formBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(Dimens.seven),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringConstants.lastName,
                              style: Styles.primaryText13,
                            ),
                            Dimens.boxHeight10,
                            SizedBox(
                              width: Responsive.isWeb(context)
                                  ? Dimens.percentWidth(.12)
                                  : Dimens.percentWidth(.3),
                              child: FormFieldWidget(
                                contentPadding: Dimens.edgeInsets16,
                                onChange: (val) {},
                                fillColor: ColorsValue.whiteColor,
                                textInputType: TextInputType.text,
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                hintStyle: Styles.greyLight15,
                                hintText:
                                    StringConstants.enterLastName.toLowerCase(),
                                inputFormatters: [
                                  // WhitelistingTextInputFormatter(RegExp('[a-zA-Z]')),
                                ],
                                formBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(Dimens.seven),
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
                          StringConstants.firstName,
                          style: Styles.primaryText13,
                        ),
                        Dimens.boxHeight10,
                        FormFieldWidget(
                          contentPadding: Dimens.edgeInsets16,
                          onChange: (val) {},
                          fillColor: ColorsValue.whiteColor,
                          textInputType: TextInputType.text,
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          hintStyle: Styles.greyLight15,
                          inputFormatters: [
                            // WhitelistingTextInputFormatter(RegExp('[a-zA-Z]')),
                          ],
                          hintText:
                              StringConstants.enterFirstName.toLowerCase(),
                          formBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Dimens.seven),
                          ),
                        ),
                        Text(
                          StringConstants.lastName,
                          style: Styles.primaryText13,
                        ),
                        Dimens.boxHeight10,
                        FormFieldWidget(
                          contentPadding: Dimens.edgeInsets16,
                          onChange: (val) {},
                          fillColor: ColorsValue.whiteColor,
                          textInputType: TextInputType.text,
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          hintStyle: Styles.greyLight15,
                          hintText: StringConstants.enterLastName.toLowerCase(),
                          inputFormatters: [
                            // WhitelistingTextInputFormatter(RegExp('[a-zA-Z]')),
                          ],
                          formBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Dimens.seven),
                          ),
                        ),
                      ],
                    ),
              Text(
                StringConstants.username,
                style: Styles.primaryText13,
              ),
              Dimens.boxHeight10,
              FormFieldWidget(
                contentPadding: Dimens.edgeInsets16,
                onChange: _controller.enterUserName,
                errorText: _controller.userNameError,
                fillColor: ColorsValue.whiteColor,
                suffixIcon: _controller.isUsernameValid
                    ? const Icon(
                        Icons.check_circle,
                        color: ColorsValue.greenColor,
                      )
                    : Dimens.box0,
                textInputType: TextInputType.text,
                focusedBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none),
                hintStyle: Styles.greyLight15,
                hintText: StringConstants.enterUsername.toLowerCase(),
                formBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimens.seven),
                ),
              ),
              Text(
                StringConstants.phoneNumberCmp,
                style: Styles.primaryText13,
              ),
              Dimens.boxHeight10,
              FormFieldWidget(
                onChange: (value) {},
                maxLength: 10,
                fillColor: ColorsValue.whiteColor,
                textInputType: TextInputType.number,
                focusedBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none),
                prefixIcon: Padding(
                  padding: Dimens.edgeInsets15_0_0_0,
                  child: InternationalPhoneNumberInput(
                    onInputChanged: (value) {
                      _controller.checkIfPhoneNumberValid(value.toString());
                    },
                    onInputValidated: _controller.phoneNumberCheck,
                    errorMessage: _controller.phoneNumberError,
                    spaceBetweenSelectorAndTextField: Dimens.one,
                    selectorConfig: const SelectorConfig(
                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                    ),
                    inputBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    ignoreBlank: false,
                    autoValidateMode: AutovalidateMode.disabled,
                    textStyle: Styles.secondaryText14,
                    hintText: StringConstants.phoneNumber,
                    selectorTextStyle: Styles.secondaryText14,
                    formatInput: false,
                    keyboardType: const TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                  ),
                ),
                hintStyle: Styles.greyLight15,
                errorBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none),
                errorStyle: Styles.red12,
                errorText: _controller.phoneNumberError,
                hintText: StringConstants.phoneNumber,
                formBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimens.seven),
                ),
              ),
              Text(
                StringConstants.emailAddressCmp,
                style: Styles.primaryText13,
              ),
              Dimens.boxHeight10,
              FormFieldWidget(
                contentPadding: Dimens.edgeInsets16,
                onChange: _controller.checkIfEmailIsValid,
                errorText: _controller.emailErrorText,
                fillColor: ColorsValue.whiteColor,
                textInputType: TextInputType.emailAddress,
                focusedBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none),
                hintStyle: Styles.greyLight15,
                hintText: StringConstants.enterEmail.toLowerCase(),
                formBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimens.seven),
                ),
              ),
              Text(
                StringConstants.passwordCmp,
                style: Styles.primaryText13,
              ),
              Dimens.boxHeight10,
              FormFieldWidget(
                contentPadding: Dimens.edgeInsets16,
                onChange: _controller.checkIfPasswordIsValid,
                errorText: _controller.passwordErrors,
                fillColor: ColorsValue.whiteColor,
                suffixIcon: GestureDetector(
                  onTap: _controller.passwordVisibility,
                  child: _controller.isPasswordVisible
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
                isObscureText: _controller.isPasswordVisible ? false : true,
                textInputType: TextInputType.emailAddress,
                focusedBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none),
                hintStyle: Styles.greyLight15,
                hintText: StringConstants.enterPassword.toLowerCase(),
                formBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimens.seven),
                ),
              ),
              Text(
                StringConstants.confirmPasswordCmp,
                style: Styles.primaryText13,
              ),
              Dimens.boxHeight10,
              FormFieldWidget(
                contentPadding: Dimens.edgeInsets16,
                onChange: _controller.checkPasswordConfirmation,
                errorText: _controller.confirmPasswordError,
                fillColor: ColorsValue.whiteColor,
                suffixIcon: GestureDetector(
                  onTap: _controller.passwordVisibility,
                  child: _controller.isPasswordVisible
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
                isObscureText: _controller.isPasswordVisible ? false : true,
                textInputType: TextInputType.emailAddress,
                focusedBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none),
                hintStyle: Styles.greyLight15,
                hintText: StringConstants.enterConfirmPassword.toLowerCase(),
                formBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimens.seven),
                ),
              ),
              Dimens.boxHeight5,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: _controller.termsAndPolicy,
                    child: _controller.isTermsAndPolicyAccept
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
                  Dimens.boxWidth5,
                  Expanded(
                    child: RichText(
                      maxLines: 2,
                      text: TextSpan(
                        text: StringConstants.iAcceptThe,
                        style: Styles.primaryText14,
                        children: <TextSpan>[
                          const TextSpan(text: ' '),
                          TextSpan(
                              text: StringConstants.termsOfService,
                              style: Styles.primary14),
                          const TextSpan(text: ' '),
                          TextSpan(
                              text: StringConstants.andThe,
                              style: Styles.primaryText14),
                          const TextSpan(text: ' '),
                          TextSpan(
                              text: StringConstants.privacyPolicy,
                              style: Styles.primary14),
                          const TextSpan(text: ' '),
                          TextSpan(
                              text: StringConstants.ofOnMyFeet,
                              style: Styles.primaryText14),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Dimens.boxHeight30,
              GlobalButton(
                  title: StringConstants.create,
                  isDisable: !_controller.isSubmitButtonEnable,
                  titleStyle: Styles.primaryText15,
                  onTap: () {
                    if (Responsive.isWeb(context) ||
                        Responsive.isTablet(context) ||
                        Responsive.isMobile(context)) {
                      Get.back<void>();
                      verificationDialog(context);
                    } else {
                      RouteManagement.goToLoginOtp();
                    }
                  }),
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
      );

  void verificationDialog(
    BuildContext context,
  ) {
    showDialog<String>(
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
