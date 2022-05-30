import 'dart:io';

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
        builder: (_controller) => GestureDetector(
          onTap: () {
            var currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Padding(
            key: loginViewWidget,
            padding: Dimens.edgeInsets16_0_16_0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Dimens.boxHeight40,
                Text(
                  'welcomeToOmfNetwork'.tr,
                  style: Styles.primaryText20,
                ),
                Dimens.boxHeight4,
                Padding(
                  padding: Dimens.edgeInsets0_0_52_0,
                  child: Text(
                    _controller.loginWithEmail
                        ? 'loginInfoWhenEmail'.tr
                        : 'loginInfoWhenMobileNumber'.tr,
                    style: Styles.secondaryText13,
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
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
                      Dimens.boxHeight20,
                      TextDevider(
                        text:'or'.tr.toUpperCase(),
                        textStyle: Styles.primaryText13,
                        color: ColorsValue.greyColor,
                        leftStartIndent: Dimens.one,
                        leftEndIndent: Dimens.twenty,
                        rightEndIndent: Dimens.one,
                        rightStartIndent: Dimens.twenty,
                      ),
                      Dimens.boxHeight20,
                      GlobalButton(
                        key: facebookLoginButtonKey,
                        title: 'loginWithFacebook'.tr,
                        buttonColor: ColorsValue.facebookButtonColor,
                        titleStyle: Styles.primaryText14,
                        prefixIcon: Image.asset(
                          AssetConstants.facebook,
                          width: Dimens.eight,
                          height: Dimens.seventeen,
                        ),
                        onTap: () {},
                      ),
                      Platform.isIOS ? Dimens.box0 : Dimens.boxHeight15,
                      Platform.isIOS
                          ? Dimens.box0
                          : GlobalButton(
                             title: 'loginWithGoogle'.tr,
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
                          ? 'loginWithPhone'.tr
                              : 'loginWithEmail'.tr,
                        buttonColor: ColorsValue.greyColor,
                        titleStyle: Styles.primaryText14,
                        prefixIcon: _controller.loginWithEmail
                            ? Icon(
                                Icons.call,
                                size: Dimens.eighteen,
                              )
                            : Image.asset(
                                AssetConstants.envelope,
                                width: Dimens.twenty,
                                height: Dimens.fifteen,
                              ),
                        onTap: _controller.swapLoginScreen,
                      ),
                      Platform.isAndroid ? Dimens.box0 : Dimens.boxHeight15,
                      Platform.isAndroid
                          ? Dimens.box0
                          : GlobalButton(
                              title: 'loginWithApple'.tr,
                              buttonColor: ColorsValue.greyColor,
                              titleStyle: Styles.primaryText14,
                              prefixIcon: Image.asset(
                                AssetConstants.appleLogo,
                                width: Dimens.twenty,
                                height: Dimens.twentyFour,
                              ),
                              onTap: () {},
                            ),

                    ],
                  ),
                ),
                _controller.keyboardBackWidget
                    ? Dimens.box0
                    : SafeArea(
                        child: GestureDetector(
                          key: createAccountButtonKey,
                          onTap: RouteManagement.goToSignup,
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                text:'dontHaveAnAccount'.tr,
                                style: Styles.primaryText14,
                                children: <TextSpan>[
                                  const TextSpan(text: '   '),
                                  TextSpan(
                                      text:'createAccount'.tr,
                                      style: Styles.primary14),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                _controller.keyboardBackWidget
                    ? Dimens.box0
                    : Dimens.boxHeight20
              ],
            ),
          ),
        ),
      );
}
