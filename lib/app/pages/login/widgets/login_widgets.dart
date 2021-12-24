import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// Contains Login Screen Widgets for the [LoginView]
class LoginViewWidget extends StatelessWidget {
  static const loginViewWidget = Key('login-view-widget-key');
  static const emailWidgetKey = Key('email-widget-key');
  static const phoneNumberWidgetKey = Key('phone-number-widget-key');
  static const facebookLoginButtonKey = Key('facebook-login-button-key');
  static const createAccountButtonKey = Key('create-account-button-key');

  @override
  Widget build(BuildContext context) => GetBuilder<LoginController>(
        builder: (_controller) => Padding(
          key: loginViewWidget,
          padding: Dimens.edgeInsets16_0_16_0,
          child: ListView(
            children: [
              Dimens.boxHeight40,
              Text(
                StringConstants.welcomeToOmfNetwork,
                style: Styles.primaryText20,
              ),
              Dimens.boxHeight4,
              Padding(
                padding: Dimens.edgeInsets0_0_52_0,
                child: Text(
                  _controller.loginWithEmail
                      ? StringConstants.loginInfoWhenEmail
                      : StringConstants.loginInfoWhenMobileNumber,
                  style: Styles.secondaryText13,
                ),
              ),
              _controller.loginWithEmail
                  ? Dimens.boxHeight15
                  : Dimens.boxHeight20,
              _controller.loginWithEmail
                  ? const EmailWidget(
                      key: emailWidgetKey,
                    )
                  : const PhoneNumberWidget(
                      key: phoneNumberWidgetKey,
                    ),
              _controller.loginWithEmail
                  ? Dimens.boxHeight10
                  : Dimens.boxHeight20,
              TextDevider(
                text: StringConstants.or.toUpperCase(),
                textStyle: Styles.primaryText13,
                color: ColorsValue.greyColor,
                leftStartIndent: Dimens.one,
                leftEndIndent: Dimens.twenty,
                rightEndIndent: Dimens.one,
                rightStartIndent: Dimens.twenty,
              ),
              _controller.loginWithEmail
                  ? Dimens.boxHeight10
                  : Dimens.boxHeight20,
              GlobalButton(
                key: facebookLoginButtonKey,
                title: StringConstants.loginWithFacebook,
                buttonColor: ColorsValue.facebookButtonColor,
                titleStyle: Styles.primaryText14,
                prefixIcon: Image.asset(
                  AssetConstants.facebook,
                  width: Dimens.eight,
                  height: Dimens.seventeen,
                ),
                onTap: RouteManagement.goToHome,
              ),
              Dimens.boxHeight15,
              GlobalButton(
                title: StringConstants.loginWithGoogle,
                buttonColor: ColorsValue.whiteColor,
                titleStyle: Styles.black14,
                prefixIcon: Image.asset(
                  AssetConstants.google,
                  width: Dimens.eighteen,
                  height: Dimens.eighteen,
                ),
                onTap: () {},
              ),
              Dimens.boxHeight15,
              GlobalButton(
                title: _controller.loginWithEmail
                    ? StringConstants.loginWithPhone
                    : StringConstants.loginWithEmail,
                buttonColor: ColorsValue.greyColor,
                titleStyle: Styles.primaryText14,
                prefixIcon: _controller.loginWithEmail
                    ? Icon(
                        Icons.call,
                        size: Dimens.fifteen,
                      )
                    : Image.asset(
                        AssetConstants.envelope,
                        width: Dimens.twenty,
                        height: Dimens.fifteen,
                      ),
                onTap: _controller.swapLoginScreen,
              ),
              Dimens.boxHeight15,
              GlobalButton(
                title: StringConstants.loginWithApple,
                buttonColor: ColorsValue.greyColor,
                titleStyle: Styles.primaryText14,
                prefixIcon: Image.asset(
                  AssetConstants.appleLogo,
                  width: Dimens.twenty,
                  height: Dimens.twentyFour,
                ),
                onTap: () {},
              ),
              _controller.loginWithEmail
                  ? Dimens.boxHeight30
                  : Dimens.boxHeight90,
              GestureDetector(
                key: createAccountButtonKey,
                onTap: RouteManagement.goToSignup,
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: StringConstants.dontHaveAnAccount,
                      style: Styles.primaryText14,
                      children: <TextSpan>[
                        const TextSpan(text: '   '),
                        TextSpan(
                            text: StringConstants.createAccount,
                            style: Styles.primary14),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
