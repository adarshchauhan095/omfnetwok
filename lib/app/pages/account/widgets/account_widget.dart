import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:omf_netflix/app/app.dart';

/// A Widget for [AccountView]
class AccountWidget extends StatelessWidget {
  static const accountWidgetKey = Key('account-widget-key');
  static const constraintBoxKey = Key('constraint-box-key');

  @override
  Widget build(BuildContext context) => GetBuilder<AccountController>(
        builder: (_controller) => _controller.isLoading
            ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoadingAnimationWidget.discreteCircle(
                      color: ColorsValue.primaryColor,
                      size: 40,
                    )
                  ],
                ),
              )
            : SingleChildScrollView(
                child: GestureDetector(
                  onTap: () {
                    var currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                height: Dimens.twoHundred,
                                width: double.infinity,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      '${_controller.imageBaseUrl}/${_controller.profileResponse!.data!.bannerImage!}',
                                  placeholder: (context, url) => Image.network(
                                    'https://picsum.photos/200/300',
                                    height: Dimens.twoHundred,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  errorWidget: (context, url, dynamic test) =>
                                      CircleImageAvatar(
                                    borderRadius: Dimens.zero,
                                    color: ColorsValue.greyColor,
                                    borderColor: ColorsValue.greyColor,
                                    borderWidth: Dimens.zero,
                                    height: Dimens.twoHundred,
                                    width: double.infinity,
                                    child: Center(
                                      child: Image.asset(
                                        AssetConstants.greyOmfLogo,
                                        width: Dimens.twoHundred,
                                        height: Dimens.fourty,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                right: Dimens.fifteen,
                                top: Dimens.ten,
                                child: CircleImageAvatar(
                                  borderRadius: Dimens.fifty,
                                  borderColor: ColorsValue.primaryColor,
                                  color: ColorsValue.primaryColor,
                                  width: Dimens.thirty,
                                  height: Dimens.thirty,
                                  child: Center(
                                    child: Icon(
                                      Icons.edit_outlined,
                                      color: ColorsValue.whiteColor,
                                      size: Dimens.twenty,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: Dimens.edgeInsets12_0_12_0,
                        child: Column(
                          children: [
                            Dimens.boxHeight20,
                            Stack(
                              children: [
                                CircleImageAvatar(
                                  borderRadius: Dimens.fifty,
                                  width: Dimens.eightyFive,
                                  height: Dimens.eightyFive,
                                  color: ColorsValue.greyColor,
                                  borderColor: ColorsValue.primaryColor,
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        '${_controller.imageBaseUrl}/${_controller.profileResponse!.data!.profilePic!}',
                                    placeholder: (context, url) =>
                                        Utility.setUserDefaultImageSmall()!,
                                    errorWidget: (context, url, dynamic test) =>
                                        Utility.setUserDefaultImageSmall()!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  right: Dimens.zero,
                                  bottom: Dimens.zero,
                                  child: CircleImageAvatar(
                                    borderRadius: Dimens.fifty,
                                    borderColor: ColorsValue.primaryColor,
                                    color: ColorsValue.primaryColor,
                                    width: Dimens.thirty,
                                    height: Dimens.thirty,
                                    child: Center(
                                      child: Icon(
                                        Icons.edit_outlined,
                                        color: ColorsValue.whiteColor,
                                        size: Dimens.twenty,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Dimens.boxHeight20,
                      Padding(
                        padding: Dimens.edgeInsets12_0_12_0,
                        child: Text(
                          'firstName'.tr,
                          style: Styles.primaryText14,
                        ),
                      ),
                      Dimens.boxHeight10,
                      Padding(
                        padding: Dimens.edgeInsets12_0_12_0,
                        child: Obx(
                          () => GestureDetector(
                            onTap: RouteManagement.goToFirstAndLastnameEditView,
                            child: FormFieldWidget(
                              contentPadding: Dimens.edgeInsets16,
                              enabled: false,
                              onChange: _controller.enterFirstName,
                              errorText: _controller.firstNameError.value == ''
                                  ? null
                                  : _controller.firstNameError.value,
                              textEditingController: _controller.firstName,
                              textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.sentences,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp('[a-zA-Z]'))
                              ],
                              suffixIcon: Icon(
                                Icons.keyboard_arrow_right,
                                color: ColorsValue.greyLightColor,
                                size: Dimens.twentyFive,
                              ),
                              fillColor: ColorsValue.greyColor,
                              formStyle: Styles.primaryText14,
                              hintStyle: Styles.greyLight15,
                              hintText: 'enterFirstName'.tr,
                              textInputType: TextInputType.text,
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              formBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimens.seven),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Dimens.boxHeight10,
                      Padding(
                        padding: Dimens.edgeInsets12_0_12_0,
                        child: Text(
                          'lastName'.tr,
                          style: Styles.primaryText14,
                        ),
                      ),
                      Dimens.boxHeight10,
                      Padding(
                        padding: Dimens.edgeInsets12_0_12_0,
                        child: Obx(
                          () => GestureDetector(
                            onTap: RouteManagement.goToFirstAndLastnameEditView,
                            child: FormFieldWidget(
                              enabled: false,
                              contentPadding: Dimens.edgeInsets16,
                              onChange: _controller.enterLastName,
                              textEditingController: _controller.lastName,
                              textInputAction: TextInputAction.done,
                              textCapitalization: TextCapitalization.sentences,
                              errorText: _controller.lastNameError.value == ''
                                  ? null
                                  : _controller.lastNameError.value,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp('[a-zA-Z]'))
                              ],
                              suffixIcon: Icon(
                                Icons.keyboard_arrow_right,
                                color: ColorsValue.greyLightColor,
                                size: Dimens.twentyFive,
                              ),
                              fillColor: ColorsValue.greyColor,
                              hintStyle: Styles.greyLight15,
                              hintText: 'enterLastName'.tr,
                              formStyle: Styles.primaryText14,
                              textInputType: TextInputType.text,
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              formBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimens.seven),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Dimens.boxHeight10,

                      Padding(
                        padding: Dimens.edgeInsets12_0_12_0,
                        child: Text(
                          'username'.tr,
                          style: Styles.primaryText14,
                        ),
                      ),
                      Dimens.boxHeight10,
                      Padding(
                        padding: Dimens.edgeInsets12_0_12_0,
                        child: CircleImageAvatar(
                          borderRadius: Dimens.seven,
                          borderColor: ColorsValue.greyColor,
                          color: ColorsValue.greyColor,
                          width: double.infinity,
                          height: Dimens.fifty,
                          child: Padding(
                            padding: Dimens.edgeInsets15_0_15_0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _controller.profileResponse!.data!.username!
                                          .isNotEmpty
                                      ? _controller
                                          .profileResponse!.data!.username!
                                      : '',
                                  style: Styles.greyLight15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Dimens.boxHeight10,
                      // Padding(
                      //   padding: Dimens.edgeInsets12_0_12_0,
                      //   child: Obx(
                      //     () => FormFieldWidget(
                      //       contentPadding: Dimens.edgeInsets16,
                      //       onChange: (v) {
                      //         _controller.dObject.run(() {
                      //           _controller.enterUserName(v);
                      //         });
                      //       },
                      //       textEditingController: _controller.userName,
                      //       errorText: _controller.userNameError.value == ''
                      //           ? null
                      //           : _controller.userNameError.value,
                      //       textInputAction: TextInputAction.next,
                      //       inputFormatters: <TextInputFormatter>[
                      //         FilteringTextInputFormatter.allow(
                      //             RegExp(r'[A-Za-z0-9!@#$%^&*(),.?":{}|<>]'))
                      //       ],
                      //       fillColor: ColorsValue.greyColor,
                      //       formStyle: Styles.primaryText14,
                      //       textInputType: TextInputType.text,
                      //       hintStyle: Styles.greyLight15,
                      //       hintText: 'enterUsername'.tr,
                      //       suffixIcon: _controller.isUsernameChecking.value
                      //           ? Transform.scale(
                      //               scale: 0.4,
                      //               child: const CircularProgressIndicator(),
                      //             )
                      //           : _controller.isUsernameChecked.value
                      //               ? !_controller.isUsernameValid.value
                      //                   ? const Icon(
                      //                       Icons.check_circle,
                      //                       color: ColorsValue.greenColor,
                      //                     )
                      //                   : const Icon(
                      //                       Icons.cancel,
                      //                       color: ColorsValue.redColor,
                      //                     )
                      //               : Dimens.box0,
                      //       focusedBorder: const OutlineInputBorder(
                      //           borderSide: BorderSide.none),
                      //       formBorder: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(Dimens.seven),
                      //       ),
                      //       enabled: _controller.isReadOnly.value,
                      //     ),
                      //   ),
                      // ),
                      // Dimens.boxHeight10,
                      Padding(
                        padding: Dimens.edgeInsets12_0_12_0,
                        child: Text(
                          'phoneNumber'.tr,
                          style: Styles.primaryText14,
                        ),
                      ),
                      Dimens.boxHeight10,
                      Padding(
                        padding: Dimens.edgeInsets12_0_12_0,
                        child: CircleImageAvatar(
                          onTap: RouteManagement.goToPhonenumberEditView,
                          borderRadius: Dimens.seven,
                          borderColor: ColorsValue.greyColor,
                          color: ColorsValue.greyColor,
                          width: double.infinity,
                          height: Dimens.fifty,
                          child: Padding(
                            padding: Dimens.edgeInsets15_0_15_0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      _controller
                                          .profileResponse!.data!.countryCode!,
                                      style: Styles.primary14,
                                    ),
                                    Dimens.boxWidth20,
                                    Text(
                                      _controller.phoneNumber.text,
                                      style: Styles.primaryText14,
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  color: ColorsValue.greyLightColor,
                                  size: Dimens.twentyFive,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Padding(
                      //   padding: Dimens.edgeInsets12_0_12_0,
                      //   child: Obx(
                      //     () => GestureDetector(
                      //       onTap: RouteManagement.goToPhonenumberEditView,
                      //       child: Container(
                      //         constraints: BoxConstraints(maxHeight: Get.height),
                      //         decoration: BoxDecoration(
                      //             borderRadius:
                      //                 BorderRadius.circular(Dimens.seven),
                      //             color: ColorsValue.greyColor),
                      //         child: Padding(
                      //           padding: Dimens.edgeInsets15_0_0_0,
                      //           child: InternationalPhoneNumberInput(
                      //             onInputChanged: (PhoneNumber number) {
                      //               _controller.dObject.run(() {
                      //                 _controller.storePhoneNumber(number);
                      //               });
                      //             },
                      //             isEnabled: false,
                      //             onInputValidated: (v) {
                      //               _controller.checkPhoneNumberValidity(v);
                      //             },
                      //             cursorColor: ColorsValue.whiteColor,
                      //             inputDecoration: InputDecoration(
                      //               enabled: false,
                      //               border: InputBorder.none,
                      //               hintStyle: Styles.greyLight15,
                      //               hintText: 'enterYourPhoneNumber'.tr,
                      //               suffixIcon: Icon(
                      //                 Icons.keyboard_arrow_right,
                      //                 color: ColorsValue.greyLightColor,
                      //                 size: Dimens.twentyFive,
                      //               ),
                      //             ),
                      //             textStyle: Styles.white14,
                      //             validator: (s) {},
                      //             selectorConfig: const SelectorConfig(
                      //               trailingSpace: false,
                      //               selectorType: PhoneInputSelectorType.DIALOG,
                      //             ),
                      //             ignoreBlank: false,
                      //             autoValidateMode: AutovalidateMode.disabled,
                      //             selectorTextStyle: const TextStyle(
                      //                 color: ColorsValue.whiteColor),
                      //             initialValue: _controller.pPhoneNumber,
                      //             textFieldController: _controller.phoneNumber,
                      //             formatInput: false,
                      //             keyboardType: TextInputType.number,
                      //             inputBorder: InputBorder.none,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      Dimens.boxHeight10,
                      // Dimens.boxHeight10,
                      // Padding(
                      //   padding: Dimens.edgeInsets12_0_12_0,
                      //   child: Text(
                      //     'bio'.tr,
                      //     style: Styles.primaryText14,
                      //   ),
                      // ),
                      // Dimens.boxHeight10,
                      // Padding(
                      //   padding: Dimens.edgeInsets12_0_12_0,
                      //   child: FormFieldWidget(
                      //     contentPadding: Dimens.edgeInsets16,
                      //     onChange: (va) {},
                      //     fillColor: ColorsValue.greyColor,
                      //     formStyle: Styles.primaryText14,
                      //     textInputType: TextInputType.text,
                      //     hintStyle: Styles.greyLight15,
                      //     hintText: 'enterYourBio'.tr,
                      //     maxlines: 3,
                      //     initialValue:
                      //         _controller.profileResponse!.data!.bio != null ||
                      //                 _controller.profileResponse!.data!.bio!.isNotEmpty
                      //             ? _controller.profileResponse!.data!.bio
                      //             : '',
                      //     focusedBorder:
                      //         const OutlineInputBorder(borderSide: BorderSide.none),
                      //     formBorder: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(Dimens.seven),
                      //     ),
                      //   ),
                      // ),

                      Padding(
                        padding: Dimens.edgeInsets12_0_12_0,
                        child: Text(
                          'emailAddress'.tr,
                          style: Styles.primaryText14,
                        ),
                      ),
                      Dimens.boxHeight10,
                      GestureDetector(
                        onTap: RouteManagement.goToEmailEditView,
                        child: Padding(
                          padding: Dimens.edgeInsets12_0_12_0,
                          child: Obx(
                            () => FormFieldWidget(
                              contentPadding: Dimens.edgeInsets16,
                              enabled: false,
                              onChange: (v) {
                                _controller.dObject.run(() {
                                  _controller.checkIfEmailIsValid(v);
                                });
                              },
                              textInputAction: TextInputAction.next,
                              suffixIcon: Icon(
                                Icons.keyboard_arrow_right,
                                color: ColorsValue.greyLightColor,
                                size: Dimens.twentyFive,
                              ),
                              textEditingController: _controller.emailId,
                              errorText: _controller.emailErrorText.value == ''
                                  ? null
                                  : _controller.emailErrorText.value,
                              fillColor: ColorsValue.greyColor,
                              formStyle: Styles.primaryText14,
                              textInputType: TextInputType.emailAddress,
                              hintStyle: Styles.greyLight15,
                              hintText: 'emailAddress'.tr,
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              formBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimens.seven),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Dimens.boxHeight10,

                      // Padding(
                      //   padding: Dimens.edgeInsets12_0_12_0,
                      //   child: Text(
                      //     'gender'.tr,
                      //     style: Styles.primaryText14,
                      //   ),
                      // ),
                      // Dimens.boxHeight10,
                      // Padding(
                      //   padding: Dimens.edgeInsets12_0_12_0,
                      //   child: GlobalButton(
                      //     onTap: () {},
                      //     alignment: WrapAlignment.start,
                      //     title: _controller.profileResponse!.data!.gender != null ||
                      //             _controller.profileResponse!.data!.gender!.isNotEmpty
                      //         ? _controller.profileResponse!.data!.gender
                      //         : '',
                      //     buttonColor: ColorsValue.greyColor,
                      //     titleStyle: Styles.primaryText14,
                      //   ),
                      // ),
                      // Dimens.boxHeight10,
                      // Padding(
                      //   padding: Dimens.edgeInsets12_0_12_0,
                      //   child: Text(
                      //     'birthdate'.tr,
                      //     style: Styles.primaryText14,
                      //   ),
                      // ),
                      // Dimens.boxHeight10,
                      // GestureDetector(
                      //   onTap: () {
                      //     _controller.selectDate(context);
                      //   },
                      //   child: Padding(
                      //     padding: Dimens.edgeInsets12_0_12_0,
                      //     child: CircleImageAvatar(
                      //       borderRadius: Dimens.seven,
                      //       color: ColorsValue.greyColor,
                      //       borderColor: ColorsValue.greyColor,
                      //       borderWidth: Dimens.zero,
                      //       width: double.infinity,
                      //       height: Dimens.fifty,
                      //       child: Padding(
                      //         padding: Dimens.edgeInsets15_0_15_0,
                      //         child: Row(
                      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //           children: [
                      //             _controller.isNewDate
                      //                 ? Text(
                      //                     _controller.dob.text.toString(),
                      //                     style: Styles.greyLight15,
                      //                   )
                      //                 : Text(
                      //                     _controller.profileResponse!.data!
                      //                             .dateOfBirth!.isNotEmpty
                      //                         ? Utility.getFormatedDate(_controller
                      //                             .profileResponse!.data!.dateOfBirth!)
                      //                         : 'dd-mm-yyyy',
                      //                     style: Styles.primaryText14,
                      //                   ),
                      //             const Icon(
                      //               Icons.date_range,
                      //               color: ColorsValue.greyLightColor,
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Dimens.boxHeight10,
                      // Padding(
                      //   padding: Dimens.edgeInsets12_0_12_0,
                      //   child: CircleImageAvatar(
                      //     borderRadius: Dimens.seven,
                      //     color: ColorsValue.greyColor,
                      //     borderColor: ColorsValue.greyColor,
                      //     borderWidth: Dimens.zero,
                      //     width: double.infinity,
                      //     height: Dimens.fifty,
                      //     child: Padding(
                      //       padding: Dimens.edgeInsets15_0_15_0,
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Row(
                      //             children: [
                      //               Text(
                      //                 'nsfwContent'.tr,
                      //                 style: Styles.primaryText14,
                      //               ),
                      //               Dimens.boxWidth5,
                      //               Icon(
                      //                 Icons.info,
                      //                 color: ColorsValue.whiteColor,
                      //                 size: Dimens.fifteen,
                      //               ),
                      //             ],
                      //           ),
                      //           Row(
                      //             children: [
                      //               CircleImageAvatar(
                      //                 borderRadius: Dimens.fifty,
                      //                 color: _controller
                      //                         .profileResponse!.data!.isNsfwAllow!
                      //                     ? ColorsValue.greenColor
                      //                     : ColorsValue.redColor,
                      //                 borderColor: _controller
                      //                         .profileResponse!.data!.isNsfwAllow!
                      //                     ? ColorsValue.greenColor
                      //                     : ColorsValue.redColor,
                      //                 borderWidth: Dimens.zero,
                      //                 width: Dimens.twenty,
                      //                 height: Dimens.twenty,
                      //                 child: Center(
                      //                   child: Icon(
                      //                     _controller
                      //                             .profileResponse!.data!.isNsfwAllow!
                      //                         ? Icons.check
                      //                         : Icons.cancel_outlined,
                      //                     color: ColorsValue.whiteColor,
                      //                     size: Dimens.fifteen,
                      //                   ),
                      //                 ),
                      //               ),
                      //               Icon(
                      //                 Icons.keyboard_arrow_right_outlined,
                      //                 color: ColorsValue.whiteColor,
                      //                 size: Dimens.twentyFive,
                      //               ),
                      //             ],
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Dimens.boxHeight10,
                      // Padding(
                      //   padding: Dimens.edgeInsets12_0_12_0,
                      //   child: Text(
                      //     'socialMediaLink'.tr,
                      //     style: Styles.primaryText14,
                      //   ),
                      // ),
                      // Dimens.boxHeight10,
                      // Padding(
                      //   padding: Dimens.edgeInsets12_0_12_0,
                      //   child: CircleImageAvatar(
                      //     borderRadius: Dimens.seven,
                      //     color: ColorsValue.transparent,
                      //     borderColor: ColorsValue.blackColor,
                      //     borderWidth: Dimens.zero,
                      //     width: double.infinity,
                      //     height: Dimens.fifty,
                      //     child: Padding(
                      //       padding: Dimens.edgeInsets15_0_0_5,
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Row(
                      //             children: [
                      //               CircleImageAvatar(
                      //                 borderRadius: Dimens.fifty,
                      //                 color: ColorsValue.greyColor,
                      //                 borderColor: ColorsValue.whiteColor,
                      //                 borderWidth: Dimens.zero,
                      //                 width: Dimens.twenty,
                      //                 height: Dimens.twenty,
                      //                 child: Center(
                      //                   child: Icon(
                      //                     Icons.check,
                      //                     color: ColorsValue.whiteColor,
                      //                     size: Dimens.fifteen,
                      //                   ),
                      //                 ),
                      //               ),
                      //               Dimens.boxWidth10,
                      //               CircleImageAvatar(
                      //                 borderRadius: Dimens.fifty,
                      //                 color: ColorsValue.greyColor,
                      //                 borderColor: ColorsValue.whiteColor,
                      //                 borderWidth: Dimens.zero,
                      //                 width: Dimens.twenty,
                      //                 height: Dimens.twenty,
                      //                 child: Center(
                      //                   child: Icon(
                      //                     Icons.check,
                      //                     color: ColorsValue.whiteColor,
                      //                     size: Dimens.fifteen,
                      //                   ),
                      //                 ),
                      //               ),
                      //               Dimens.boxWidth10,
                      //               CircleImageAvatar(
                      //                 borderRadius: Dimens.fifty,
                      //                 color: ColorsValue.greyColor,
                      //                 borderColor: ColorsValue.whiteColor,
                      //                 borderWidth: Dimens.zero,
                      //                 width: Dimens.twenty,
                      //                 height: Dimens.twenty,
                      //                 child: Center(
                      //                   child: Icon(
                      //                     Icons.check,
                      //                     color: ColorsValue.whiteColor,
                      //                     size: Dimens.fifteen,
                      //                   ),
                      //                 ),
                      //               ),
                      //               Dimens.boxWidth10,
                      //               CircleImageAvatar(
                      //                 borderRadius: Dimens.fifty,
                      //                 color: ColorsValue.greyColor,
                      //                 borderColor: ColorsValue.whiteColor,
                      //                 borderWidth: Dimens.zero,
                      //                 width: Dimens.twenty,
                      //                 height: Dimens.twenty,
                      //                 child: Center(
                      //                   child: Icon(
                      //                     Icons.check,
                      //                     color: ColorsValue.whiteColor,
                      //                     size: Dimens.fifteen,
                      //                   ),
                      //                 ),
                      //               ),
                      //               Dimens.boxWidth10,
                      //               CircleImageAvatar(
                      //                 borderRadius: Dimens.fifty,
                      //                 color: ColorsValue.greyColor,
                      //                 borderColor: ColorsValue.whiteColor,
                      //                 borderWidth: Dimens.zero,
                      //                 width: Dimens.twenty,
                      //                 height: Dimens.twenty,
                      //                 child: Center(
                      //                   child: Icon(
                      //                     Icons.check,
                      //                     color: ColorsValue.whiteColor,
                      //                     size: Dimens.fifteen,
                      //                   ),
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //           Icon(
                      //             Icons.keyboard_arrow_right_outlined,
                      //             color: ColorsValue.whiteColor,
                      //             size: Dimens.twentyFive,
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Dimens.boxHeight20,
                      // Padding(
                      //   padding: Dimens.edgeInsets12_0_12_0,
                      //   child: Row(
                      //     children: [
                      //       Text(
                      //         'idVerificationDocument'.tr,
                      //         style: Styles.primaryText14,
                      //       ),
                      //       Dimens.boxWidth5,
                      //       Icon(
                      //         Icons.warning_outlined,
                      //         color: ColorsValue.whiteColor,
                      //         size: Dimens.fifteen,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Dimens.boxHeight10,
                      // Padding(
                      //   padding: Dimens.edgeInsets12_0_12_0,
                      //   child: Text(
                      //     _controller.profileResponse!.data!.document!.name!,
                      //     style: Styles.primaryText16,
                      //   ),
                      // ),
                      // Dimens.boxHeight10,
                      // Padding(
                      //   padding: Dimens.edgeInsets12_0_12_0,
                      //   child: Row(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       CircleImageAvatar(
                      //         borderRadius: Dimens.zero,
                      //         width: Dimens.ninty,
                      //         height: Dimens.ninty,
                      //         borderColor: ColorsValue.blackColor,
                      //         borderWidth: Dimens.zero,
                      //         child: Image.network(
                      //           '${_controller.imageBaseUrl}/${_controller.profileResponse!.data!.document!.frontImage}',
                      //           fit: BoxFit.fill,
                      //         ),
                      //       ),
                      //       Dimens.boxWidth5,
                      //       CircleImageAvatar(
                      //         borderRadius: Dimens.zero,
                      //         width: Dimens.ninty,
                      //         height: Dimens.ninty,
                      //         borderColor: ColorsValue.blackColor,
                      //         borderWidth: Dimens.zero,
                      //         child: Image.network(
                      //           '${_controller.imageBaseUrl}/${_controller.profileResponse!.data!.document!.backImage}',
                      //           fit: BoxFit.fill,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Dimens.boxHeight20,
                      GestureDetector(
                        onTap: RouteManagement.goToChangePassword,
                        child: Padding(
                          padding: Dimens.edgeInsets12_0_12_0,
                          child: Text(
                            'changePassword'.tr,
                            style: Styles.primaryBold16,
                          ),
                        ),
                      ),
                      Dimens.boxHeight20,
                    ],
                  ),
                ),
              ),
      );
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
