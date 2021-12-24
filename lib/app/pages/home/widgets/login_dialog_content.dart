import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

class LoginDialogContent extends StatefulWidget {
  LoginDialogContent({
    Key? key,
    // required this.controller,
  }) : super(key: key);
  // final LoginController controller;

  @override
  _LoginDialogContentState createState() => _LoginDialogContentState();
}

class _LoginDialogContentState extends State<LoginDialogContent> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<LoginController>();
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: Responsive.isWeb(context)
            ? Dimens.percentWidth(.55)
            : Responsive.isTablet(context)
                ? Dimens.percentWidth(.70)
                : Dimens.percentWidth(.90),
        height: Responsive.isWeb(context)
            ? Dimens.percentHeight(.80)
            : Responsive.isTablet(context)
                ? Dimens.percentHeight(.80)
                : Dimens.percentHeight(.90),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.ten),
          color: ColorsValue.whiteColor,
        ),
        child: Row(
          children: [
            Container(
              width: Responsive.isWeb(context)
                  ? Dimens.percentWidth(0.275)
                  : Responsive.isTablet(context)
                      ? Dimens.percentWidth(0.35)
                      : Dimens.percentWidth(0.9),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimens.ten),
                    bottomLeft: Radius.circular(Dimens.ten)),
                color: ColorsValue.scaffoldBackgroundColor,
              ),
              child: Padding(
                padding: Responsive.isWeb(context)
                    ? Dimens.edgeInsets16
                    : Responsive.isTablet(context)
                        ? Dimens.edgeInsets10
                        : Dimens.edgeInsets20,
                child: ListView(
                  children: [
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
                    Dimens.boxHeight20,
                    Text(
                      StringConstants.welcomeToOmfNetwork,
                      textAlign: TextAlign.center,
                      style: Responsive.isWeb(context)
                          ? Styles.primaryText17
                          : Styles.primaryText16,
                    ),
                    Dimens.boxHeight4,
                    Text(
                      controller.loginWithEmail
                          ? StringConstants.loginInfoWhenEmail
                          : StringConstants.loginInfoWhenMobileNumber,
                      textAlign: TextAlign.center,
                      style: Responsive.isWeb(context)
                          ? Styles.grey13
                          : Styles.grey13,
                    ),
                    controller.loginWithEmail
                        ? Dimens.boxHeight15
                        : Dimens.boxHeight20,
                    controller.loginWithEmail
                        ? const EmailWidget()
                        : const PhoneNumberWidget(),
                    controller.loginWithEmail
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
                    controller.loginWithEmail
                        ? Dimens.boxHeight10
                        : Dimens.boxHeight20,
                    GridView.custom(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: Responsive.isWeb(context) ? 2 : 1,
                          childAspectRatio: 5,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          mainAxisExtent: 50),
                      childrenDelegate: SliverChildListDelegate(
                        [
                          GlobalButton(
                            title: StringConstants.loginWithFacebook,
                            buttonColor: ColorsValue.facebookButtonColor,
                            titleStyle: Styles.primaryText12,
                            prefixIcon: Image.asset(
                              AssetConstants.facebook,
                              width: Dimens.six,
                              height: Dimens.fifteen,
                            ),
                            height: Dimens.five,
                            onTap: () {
                              if (kIsWeb) {
                                if (Responsive.isWeb(context) ||
                                    Responsive.isTablet(context) ||
                                    Responsive.isMobile(context)) {
                                  Get.back<void>();
                                  verificationDialog(context);
                                }
                              } else {
                                RouteManagement.goToHome();
                              }
                            },
                          ),
                          GlobalButton(
                            title: StringConstants.loginWithGoogle,
                            buttonColor: ColorsValue.whiteColor,
                            titleStyle: Styles.black12,
                            prefixIcon: Image.asset(
                              AssetConstants.google,
                              width: Dimens.sixteen,
                              height: Dimens.sixteen,
                            ),
                            onTap: () {},
                          ),
                          GlobalButton(
                            title: controller.loginWithEmail
                                ? StringConstants.loginWithPhone
                                : StringConstants.loginWithEmail,
                            buttonColor: ColorsValue.greyColor,
                            titleStyle: Styles.primaryText12,
                            prefixIcon: controller.loginWithEmail
                                ? Icon(
                                    Icons.call,
                                    size: Dimens.fifteen,
                                  )
                                : Image.asset(
                                    AssetConstants.envelope,
                                    width: Dimens.eighteen,
                                    height: Dimens.fourteen,
                                  ),
                            onTap: controller.swapLoginScreen,
                          ),
                          GlobalButton(
                            title: StringConstants.loginWithApple,
                            buttonColor: ColorsValue.greyColor,
                            titleStyle: Styles.primaryText12,
                            prefixIcon: Image.asset(
                              AssetConstants.appleLogo,
                              width: Dimens.sixteen,
                              height: Dimens.twenty,
                            ),
                            onTap: () {
                              if (kIsWeb) {
                                if (Responsive.isWeb(context) ||
                                    Responsive.isTablet(context) ||
                                    Responsive.isMobile(context)) {
                                  Get.back<void>();
                                  subscriptionDialog(context);
                                } else {}
                              } else {}
                            },
                          ),
                        ],
                      ),
                    ),
                    Dimens.boxHeight40,
                    GestureDetector(
                      onTap: () {
                        if (kIsWeb) {
                          if (Responsive.isWeb(context) ||
                              Responsive.isTablet(context) ||
                              Responsive.isMobile(context)) {
                            Get.back<void>();
                            createAccountDialog(context);
                          } else {}
                        } else {
                          RouteManagement.goToSignup();
                        }
                      },
                      child: Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: StringConstants.dontHaveAnAccount,
                            style: Responsive.isWeb(context)
                                ? Styles.primaryText12
                                : Styles.primaryText11,
                            children: <TextSpan>[
                              const TextSpan(text: '   '),
                              TextSpan(
                                  text: StringConstants.createAccount,
                                  style: Responsive.isWeb(context)
                                      ? Styles.primary12
                                      : Styles.primary11),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Responsive.isMobile(context)
                ? Container()
                : Stack(
                    children: [
                      Container(
                        width: Responsive.isWeb(context)
                            ? Dimens.percentWidth(0.275)
                            : Responsive.isMobile(context)
                                ? Dimens.percentWidth(0)
                                : Dimens.percentWidth(0.35),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimens.ten),
                              bottomRight: Radius.circular(Dimens.ten)),
                          color: ColorsValue.redColor,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimens.ten),
                              bottomRight: Radius.circular(Dimens.ten)),
                          child: Image.asset(
                            AssetConstants.webloginshoebanner,
                            height: Get.height,
                            width: Get.width,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Responsive.isWeb(context) || Responsive.isTablet(context)
                          ? Positioned(
                              top: Dimens.twelve,
                              right: Dimens.twelve,
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
                      Responsive.isWeb(context) || Responsive.isTablet(context)
                          ? Positioned(
                              top: Dimens.hundred,
                              left: Dimens.fifty,
                              child: SizedBox(
                                width: Dimens.percentWidth(0.200),
                                child: Text(
                                    StringConstants.loremIpsumSmall +
                                        StringConstants.loremIpsumSmall +
                                        StringConstants.loremIpsumSmall,
                                    style: Styles.primaryText23,
                                    textAlign: TextAlign.center),
                              ),
                            )
                          : Dimens.box0,
                    ],
                  ),
          ],
        ),
      ),
    );
  }

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

  void createAccountDialog(
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
              ? Dimens.percentWidth(.35)
              : Responsive.isTablet(context)
                  ? Dimens.percentWidth(.70)
                  : Dimens.percentWidth(.90),
          height: Responsive.isWeb(context)
              ? Dimens.percentHeight(.90)
              : Responsive.isTablet(context)
                  ? Dimens.percentHeight(.80)
                  : Dimens.percentHeight(.90),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.ten),
            color: ColorsValue.scaffoldBackgroundColor,
          ),
          child: const SignupWidget(),
        ),
      ),
    );
  }

  void subscriptionDialog(
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
          width: Responsive.isWeb(context)
              ? Dimens.percentWidth(.30)
              : Responsive.isTablet(context)
                  ? Dimens.percentWidth(.50)
                  : Dimens.percentWidth(.90),
          height: Responsive.isWeb(context)
              ? Dimens.percentHeight(.70)
              : Responsive.isTablet(context)
                  ? Dimens.percentHeight(.60)
                  : Dimens.percentHeight(.90),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.ten),
            color: ColorsValue.scaffoldBackgroundColor,
          ),
          child: SubscriptionWidget(),
        ),
      ),
    );
  }
}
