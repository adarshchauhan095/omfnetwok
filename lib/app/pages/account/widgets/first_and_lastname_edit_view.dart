import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// A Widget for [FirstAndLastnameEditView]
class FirstAndLastnameEditView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetBuilder<AccountController>(
        builder: (_controller) => Scaffold(
          backgroundColor: ColorsValue.scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: ColorsValue.scaffoldBackgroundColor,
            leading: IconButton(
              icon: Icon(
                Icons.keyboard_arrow_left,
                color: ColorsValue.whiteColor,
                size: Dimens.thirty,
              ),
              onPressed: () {
                Get.back<void>();
              },
            ),
            centerTitle: true,
            title: Text(
              'changeName'.tr,
              style: Styles.primaryText20,
            ),
          ),
          body: GestureDetector(
            onTap: () {
              var currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Dimens.boxHeight10,
                      Padding(
                        padding: Dimens.edgeInsets12_0_12_0,
                        child: Obx(
                          () => FormFieldWidget(
                            contentPadding: Dimens.edgeInsets16,
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
                            fillColor: ColorsValue.greyColor,
                            formStyle: Styles.primaryText14,
                            hintStyle: Styles.greyLight15,
                            hintText: 'enterFirstName'.tr,
                            textInputType: TextInputType.text,
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            formBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(Dimens.seven),
                            ),
                          ),
                        ),
                      ),
                      Dimens.boxHeight10,
                      Padding(
                        padding: Dimens.edgeInsets12_0_12_0,
                        child: Obx(
                          () => FormFieldWidget(
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
                            fillColor: ColorsValue.greyColor,
                            hintStyle: Styles.greyLight15,
                            hintText: 'enterLastName'.tr,
                            formStyle: Styles.primaryText14,
                            textInputType: TextInputType.text,
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            formBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(Dimens.seven),
                            ),
                          ),
                        ),
                      ),
                      Dimens.boxHeight10,
                    ],
                  ),
                ),
                Padding(
                  padding: Dimens.edgeInsets12_0_12_0,
                  child: GlobalButton(
                      title: 'save'.tr,
                      onTap: () {
                        if (_controller.firstName.text.isNotEmpty &&
                            _controller.lastName.text.isNotEmpty) {
                          Get.back<void>();
                        }
                      }),
                ),
                Dimens.boxHeight20
              ],
            ),
          ),
        ),
      );
}
