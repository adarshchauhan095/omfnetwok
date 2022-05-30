import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// [CommentView] Screen shows all the comments for particular Product or Video.
/// 
/// And can be comment for some video or gives the review
class CommentView extends StatelessWidget {
  static const commentViewKey = Key('comment-view-key');
  @override
  Widget build(BuildContext context) => Scaffold(
        key: commentViewKey,
        backgroundColor: ColorsValue.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: ColorsValue.scaffoldBackgroundColor,
          leading: IconButton(
            onPressed: () {
              Get.back<void>();
            },
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: ColorsValue.whiteColor,
              size: Dimens.thirty,
            ),
          ),
          centerTitle: true,
          title: Text(
            'comments'.tr,
            style: Styles.primaryText20,
          ),
        ),
        body: CommentWidget(),
      );
}
