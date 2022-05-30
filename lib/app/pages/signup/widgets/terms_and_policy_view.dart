import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

class TermsAndPolicyView extends StatelessWidget {
  const TermsAndPolicyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<SignupController>(
      builder: (_controller) => Scaffold(
            backgroundColor: ColorsValue.scaffoldBackgroundColor,
            appBar: AppBar(
              backgroundColor: ColorsValue.scaffoldBackgroundColor,
              title: Obx(
                () => Text(
                  _controller.termsPageType.value == 2
                      ? 'Terms & Conditions'
                      : 'Privacy Policy',
                  style: Styles.white14,
                ),
              ),
              elevation: Dimens.zero,
            ),
            body: Padding(
              padding: Dimens.edgeInsets15_11_15_11,
              child: ListView(
                children: [
                  Html(
                    data: _controller.termsPageContent.value,
                    style: {'body': Style(textDecorationColor: Colors.white)},
                  ),
                ],
              ),
            ),
          ));
}
