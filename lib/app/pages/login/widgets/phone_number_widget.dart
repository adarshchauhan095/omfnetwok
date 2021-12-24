import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:omf_netflix/app/app.dart';

/// Widget will active when user wants to Login using Phonenumber.
class PhoneNumberWidget extends StatelessWidget {
  const PhoneNumberWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<LoginController>(
        builder: (_controller) => ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Text(
              StringConstants.phoneNumber,
              style: Styles.primaryText13,
            ),
            Dimens.boxHeight5,
            FormFieldWidget(
              onChange: (v) {},
              fillColor: ColorsValue.whiteColor,
              maxLength: 10,
              textInputType: TextInputType.number,
              focusedBorder:
                  const OutlineInputBorder(borderSide: BorderSide.none),
              prefixIcon: Padding(
                padding: Dimens.edgeInsets15_0_0_0,
                child: InternationalPhoneNumberInput(
                  onInputChanged: (val) {
                    _controller.storeIfPhoneNumberValid(val.toString());
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
            _controller.loginWithEmail
                ? Dimens.boxHeight10
                : Dimens.boxHeight10,
            GlobalButton(
              title: StringConstants.continues,
              titleStyle: Styles.primaryText15,
              height: Responsive.isWeb(context) || Responsive.isWeb(context)
                  ? 50
                  : Dimens.fourty,
              isDisable: !_controller.isbutton,
              onTap: RouteManagement.goToLoginOtp,
            ),
          ],
        ),
      );
}
