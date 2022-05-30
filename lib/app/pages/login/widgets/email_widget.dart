import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:omf_netflix/domain/domain.dart';

/// Widget will active when user wants to Login using Email and Password.
class EmailWidget extends StatelessWidget {
  const EmailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<LoginController>(
        builder: (_controller) => GestureDetector(
          onTap: () {
            var currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Text(
                'emailAddress'.tr,
                style: Styles.primaryText13,
              ),
              Dimens.boxHeight10,
              FormFieldWidget(
                  contentPadding: Dimens.edgeInsets16,
                  fillColor: ColorsValue.whiteColor,
                  textInputType: TextInputType.emailAddress,
                  suffixIcon: _controller.isEmailChecking.value
                      ? Transform.scale(
                          scale: 0.4,
                          child: const CircularProgressIndicator(),
                        )
                      : _controller.isEmailIdChecked.value
                          ? !_controller.isEmailValid
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
                  textInputAction: TextInputAction.next,
                  cursorColor: ColorsValue.blackColor,
                  focusedBorder:
                      const OutlineInputBorder(borderSide: BorderSide.none),
                  hintStyle: Styles.greyLight15,
                  hintText: StringConstants.enterEmail,
                  formBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Dimens.seven),
                  ),
                  errorText: _controller.emailErrorText,
                  textEditingController: _controller.emailId,
                  onChange: (v) {
                    _controller.dObject.run(() {
                      _controller.checkIfEmailIsValid(v);
                    });
                  }),
              Obx(
                () => Column(
                  children: [
                    !_controller.isEmailIdChecked.value
                        ? Dimens.box0
                        : !_controller.isEmailValid
                            ? Dimens.box0
                            : _controller.isEmailIdTaken.value
                                ? Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Not registered'.tr,
                                      style: Styles.red12,
                                    ),
                                  )
                                : Dimens.box0,
                  ],
                ),
              ),
              Dimens.boxHeight10,
              Text(
                'password'.tr,
                style: Styles.primaryText13,
              ),
              Dimens.boxHeight10,
              FormFieldWidget(
                contentPadding: Dimens.edgeInsets16,
                fillColor: ColorsValue.whiteColor,
                cursorColor: ColorsValue.blackColor,
                suffixIcon: !_controller.passwordListner
                    ? Dimens.box0
                    : GestureDetector(
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
                textEditingController: _controller.password,
                onChange: _controller.checkIfPasswordIsEntered,
              ),
              Dimens.boxHeight3,
              GestureDetector(
                onTap: () {
                  if (kIsWeb) {
                    if (Responsive.isWeb(context) ||
                        Responsive.isTablet(context) ||
                        Responsive.isMobile(context)) {
                      Get.back<void>();
                      forgotPasswordDialog(context);
                    } else {
                      RouteManagement.goToForgotPassword();
                    }
                  } else {
                    RouteManagement.goToForgotPassword();
                  }
                },
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    StringConstants.forgotPassword,
                    textAlign: TextAlign.right,
                    style: Styles.primaryText13,
                  ),
                ),
              ),
              Dimens.boxHeight20,
              GlobalButton(
                title: 'login'.tr,
                isDisable: !_controller.isSubmitButtonEnable,
                titleStyle: Styles.primaryText15,
                height: kIsWeb
                    ? Responsive.isWeb(context) || Responsive.isWeb(context)
                        ? 50
                        : Dimens.fourty
                    : Dimens.fifty,
                onTap: () async {
                  await _controller.loginUser(loginType: LoginType.email);
                },
              ),
            ],
          ),
        ),
      );

  void forgotPasswordDialog(
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
          child: ForgotPasswordWidget(),
        ),
      ),
    );
  }
}
