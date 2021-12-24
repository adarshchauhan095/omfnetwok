import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:readmore/readmore.dart';

/// Widget for [CommentView]
class CommentWidget extends StatelessWidget {
  static const commentWidgetKey = Key('comment-widget-key');
  @override
  Widget build(BuildContext context) => GetBuilder<CommentController>(
        builder: (_controller) => Padding(
          key: commentWidgetKey,
          padding: Dimens.edgeInsets16_0_16_0,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) => Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: ColorsValue.greyBorderColor),
                      ),
                    ),
                    constraints:
                        const BoxConstraints(maxHeight: double.infinity),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: Dimens.fifty,
                              width: Dimens.fifty,
                              child: CircularProfileAvatar(
                                AssetConstants.avatarProfile,
                                cacheImage: true,
                                imageFit: BoxFit.cover,
                                backgroundColor: ColorsValue.greyColor,
                                initialsText: Text(
                                  'AD',
                                  style: Styles.primaryText16,
                                ),
                              ),
                            ),
                            Dimens.boxWidth10,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  StringConstants.testOne,
                                  style: Styles.primaryText17,
                                ),
                                Text(
                                  'November 2021',
                                  style: Styles.secondaryText13,
                                ),
                              ],
                            )
                          ],
                        ),
                        Dimens.boxHeight10,
                        ReadMoreText(
                          StringConstants.loremIpsum +
                              StringConstants.loremIpsum,
                          trimLines: 4,
                          colorClickableText: Colors.pink,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: StringConstants.readMore,
                          trimExpandedText: StringConstants.showLess,
                          style: Styles.primaryText13,
                          lessStyle: Styles.primary13,
                          moreStyle: Styles.primary13,
                        ),
                        Dimens.boxHeight15,
                      ],
                    ),
                  ),
                  separatorBuilder: (context, index) => Dimens.boxHeight15,
                ),
              ),
              Dimens.boxHeight10,
              SizedBox(
                height: Dimens.sixty,
                width: double.infinity,
                child: FormFieldWidget(
                  contentPadding: Dimens.edgeInsets16,
                  onChange: _controller.commentAndSend,
                  fillColor: ColorsValue.greyBoxColor,
                  formStyle: Styles.primaryText14,
                  textInputType: TextInputType.text,
                  hintStyle: Styles.grey13,
                  suffixIcon: _controller.isSend
                      ? GestureDetector(
                          onTap: () {
                            Get.snackbar(
                                'Your comment', _controller.commentText,
                                colorText: ColorsValue.whiteColor);
                          },
                          child: const Icon(
                            Icons.send,
                            color: ColorsValue.whiteColor,
                          ),
                        )
                      : Dimens.box0,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      Dimens.twenty,
                    ),
                  ),
                  hintText: StringConstants.enterAComment,
                  formBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      Dimens.twenty,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
