import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// Widget will active when user wants to Login using Email and Password.
class EmailWidget extends StatelessWidget {
  const EmailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<LoginController>(
        builder: (_controller) => ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Text(
              StringConstants.emailAddress,
              style: Styles.primaryText13,
            ),
            Dimens.boxHeight10,
            FormFieldWidget(
              contentPadding: Dimens.edgeInsets16,
              fillColor: ColorsValue.whiteColor,
              textInputType: TextInputType.emailAddress,
              focusedBorder:
                  const OutlineInputBorder(borderSide: BorderSide.none),
              hintStyle: Styles.greyLight15,
              hintText: StringConstants.enterEmail,
              formBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimens.seven),
              ),
              errorText: _controller.emailErrorText,
              onChange: _controller.checkIfEmailIsValid,
            ),
            Text(
              StringConstants.password,
              style: Styles.primaryText13,
            ),
            Dimens.boxHeight10,
            FormFieldWidget(
              contentPadding: Dimens.edgeInsets16,
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
              hintText: StringConstants.enterPassword,
              formBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimens.seven),
              ),
              errorText: _controller.passwordErrors,
              onChange: _controller.checkIfPasswordIsValid,
            ),
            GestureDetector(
              onTap: RouteManagement.goToForgotPassword,
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  StringConstants.forgotPassword,
                  textAlign: TextAlign.right,
                  style: Styles.primaryText13,
                ),
              ),
            ),
            _controller.loginWithEmail
                ? Dimens.boxHeight10
                : Dimens.boxHeight20,
            GlobalButton(
              title: StringConstants.login,
              isDisable: !_controller.isSubmitButtonEnable,
              titleStyle: Styles.primaryText15,
              height: Responsive.isWeb(context) || Responsive.isWeb(context)
                  ? 50
                  : Dimens.fourty,
              onTap: RouteManagement.goToSubscription,
            ),
          ],
        ),
      );
}
