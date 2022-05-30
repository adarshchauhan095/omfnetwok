import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// Widget for [ChangePasswordView]
class ChangePasswordWidget extends StatelessWidget {
  static const changePasswordWidgetKey = Key('change-password-widget-key');
  @override
  Widget build(BuildContext context) => GetBuilder<ChangePasswordController>(
        builder: (_controller) => Responsive.isWeb(context) ||
                Responsive.isTablet(context)
            ? Column(
                children: [
                  FormFieldWidget(
                    contentPadding: Dimens.edgeInsets16,
                    fillColor: ColorsValue.greyColor,
                    suffixIcon: GestureDetector(
                      onTap: _controller.passwordVisibility,
                      child: _controller.isPasswordVisible
                          ? const Icon(
                              Icons.remove_red_eye_outlined,
                              color: ColorsValue.greyColor,
                            )
                          : const Icon(
                              Icons.remove_red_eye,
                              color: ColorsValue.greyColor,
                            ),
                    ),
                    obscureCharacter: '*',
                    formStyle: Styles.primaryText14,
                    isObscureText: _controller.isPasswordVisible ? false : true,
                    textInputType: TextInputType.emailAddress,
                    focusedBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    hintStyle: Styles.secondaryText14,
                    hintText: StringConstants.oldPassword,
                    formBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Dimens.seven),
                    ),
                    onChange: _controller.checkIfPasswordIsValid,
                  ),
                  FormFieldWidget(
                    contentPadding: Dimens.edgeInsets16,
                    fillColor: ColorsValue.greyColor,
                    suffixIcon: GestureDetector(
                      onTap: _controller.newPasswordVisibility,
                      child: _controller.isNewPasswordVisible
                          ? const Icon(
                              Icons.remove_red_eye_outlined,
                              color: ColorsValue.greyColor,
                            )
                          : const Icon(
                              Icons.remove_red_eye,
                              color: ColorsValue.greyColor,
                            ),
                    ),
                    obscureCharacter: '*',
                    formStyle: Styles.primaryText14,
                    isObscureText:
                        _controller.isNewPasswordVisible ? false : true,
                    textInputType: TextInputType.emailAddress,
                    focusedBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    hintStyle: Styles.primaryText14,
                    hintText: 'newPassword'.tr,
                    formBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Dimens.seven),
                    ),
                    errorText: _controller.newPasswordErrors,
                    onChange: _controller.checkIfNewPasswordIsValid,
                  ),
                  FormFieldWidget(
                    contentPadding: Dimens.edgeInsets16,
                    fillColor: ColorsValue.greyColor,
                    suffixIcon: GestureDetector(
                      onTap: _controller.confirmPasswordVisibility,
                      child: _controller.isConfirmPasswordVisible
                          ? const Icon(
                              Icons.remove_red_eye_outlined,
                              color: ColorsValue.greyColor,
                            )
                          : const Icon(
                              Icons.remove_red_eye,
                              color: ColorsValue.greyColor,
                            ),
                    ),
                    obscureCharacter: '*',
                    formStyle: Styles.primaryText14,
                    isObscureText:
                        _controller.isConfirmPasswordVisible ? false : true,
                    textInputType: TextInputType.emailAddress,
                    focusedBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    hintStyle: Styles.primaryText14,
                    hintText: 'confirmPassword'.tr,
                    formBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Dimens.seven),
                    ),
                    errorText: _controller.confirmPasswordError,
                    onChange: _controller.checkPasswordConfirmation,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GlobalButton(
                      key: const Key('button-a1'),
                      title: StringConstants.changePassword,
                      width: Dimens.hundredFifty,
                      onTap: () {
                        passwordChandedDialog(context);
                      },
                      isDisable: !_controller.isSubmitButtonEnable,
                    ),
                  )
                ],
              )
            : GestureDetector(
                onTap: () {
                  var currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
                child: Padding(
                  key: changePasswordWidgetKey,
                  padding: Dimens.edgeInsets15_0_15_0,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ListView(
                          children: [
                            FormFieldWidget(
                              contentPadding: Dimens.edgeInsets16,
                              fillColor: ColorsValue.greyColor,
                              textInputAction: TextInputAction.next,
                              suffixIcon: GestureDetector(
                                onTap: _controller.passwordVisibility,
                                child: _controller.isPasswordVisible
                                    ? Icon(
                                        Icons.remove_red_eye_outlined,
                                        color: ColorsValue.whiteColor
                                            .withOpacity(
                                                Dimens.pointFiveStatic),
                                      )
                                    : Icon(
                                        Icons.remove_red_eye,
                                        color: ColorsValue.whiteColor
                                            .withOpacity(
                                                Dimens.pointFiveStatic),
                                      ),
                              ),
                              obscureCharacter: '*',
                              formStyle: Styles.primaryText14,
                              isObscureText:
                                  _controller.isPasswordVisible ? false : true,
                              textInputType: TextInputType.emailAddress,
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintStyle: Styles.secondaryText14,
                              hintText: 'currentPassword'.tr,
                              formBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimens.seven),
                              ),
                              onChange: _controller.checkIfPasswordIsValid,
                            ),
                            FormFieldWidget(
                              contentPadding: Dimens.edgeInsets16,
                              fillColor: ColorsValue.greyColor,
                              textInputAction: TextInputAction.next,
                              suffixIcon: GestureDetector(
                                onTap: _controller.newPasswordVisibility,
                                child: _controller.isNewPasswordVisible
                                    ? Icon(
                                        Icons.remove_red_eye_outlined,
                                        color: ColorsValue.whiteColor
                                            .withOpacity(
                                                Dimens.pointFiveStatic),
                                      )
                                    : Icon(
                                        Icons.remove_red_eye,
                                        color: ColorsValue.whiteColor
                                            .withOpacity(
                                                Dimens.pointFiveStatic),
                                      ),
                              ),
                              obscureCharacter: '*',
                              formStyle: Styles.primaryText14,
                              isObscureText: _controller.isNewPasswordVisible
                                  ? false
                                  : true,
                              textInputType: TextInputType.emailAddress,
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintStyle: Styles.secondaryText14,
                              hintText: 'newPassword'.tr,
                              formBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimens.seven),
                              ),
                              errorText: _controller.newPasswordErrors,
                              onChange: _controller.checkIfNewPasswordIsValid,
                            ),
                            FormFieldWidget(
                              contentPadding: Dimens.edgeInsets16,
                              fillColor: ColorsValue.greyColor,
                              textInputAction: TextInputAction.done,
                              suffixIcon: GestureDetector(
                                onTap: _controller.confirmPasswordVisibility,
                                child: _controller.isConfirmPasswordVisible
                                    ? Icon(
                                        Icons.remove_red_eye_outlined,
                                        color: ColorsValue.whiteColor
                                            .withOpacity(
                                                Dimens.pointFiveStatic),
                                      )
                                    : Icon(
                                        Icons.remove_red_eye,
                                        color: ColorsValue.whiteColor
                                            .withOpacity(
                                                Dimens.pointFiveStatic),
                                      ),
                              ),
                              obscureCharacter: '*',
                              formStyle: Styles.primaryText14,
                              isObscureText:
                                  _controller.isConfirmPasswordVisible
                                      ? false
                                      : true,
                              textInputType: TextInputType.emailAddress,
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintStyle: Styles.secondaryText14,
                              hintText: 'confirmPassword'.tr,
                              formBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimens.seven),
                              ),
                              errorText: _controller.confirmPasswordError,
                              onChange: _controller.checkPasswordConfirmation,
                            ),
                          ],
                        ),
                      ),
                      GlobalButton(
                        key: const Key('button-a1'),
                        title: 'changePassword'.tr,
                        onTap: () {
                          _controller.changePassword();
                        },
                        isDisable: !_controller.isSubmitButtonEnable,
                      ),
                      Dimens.boxHeight20
                    ],
                  ),
                ),
              ),
      );

  void passwordChandedDialog(
    BuildContext context,
  ) {
    showDialog<String>(
      barrierDismissible: true,
      barrierColor: Colors.black38,
      context: context,
      builder: (BuildContext context) => Dialog(
        insetPadding: EdgeInsets.all(Dimens.ten),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.ten),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: ChangedPasswordDialog(),
      ),
    );
  }
}
