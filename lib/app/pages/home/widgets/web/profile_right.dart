import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

class ProfileRight extends StatelessWidget {
  const ProfileRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (_controller) => SizedBox(
          width: _controller.webWidgetIndex == 5
              ? Responsive.isWeb(context)
                  ? Dimens.percentWidth(0.4)
                  : Dimens.percentWidth(0.5)
              : _controller.webWidgetIndex == 0
                  ? Responsive.isTablet(context)
                      ? Dimens.percentWidth(0.5)
                      : Dimens.percentWidth(0.4)
                  : _controller.webWidgetIndex == 3
                      ? Responsive.isTablet(context)
                          ? Dimens.percentWidth(0.5)
                          : Dimens.percentWidth(0.3)
                      : Responsive.isTablet(context)
                          ? Dimens.percentWidth(0.5)
                          : Dimens.percentWidth(0.65),
          child: _controller.webWidgetIndex == 3
              ? _controller.webWidgets[_controller.webWidgetIndex]
              : _controller.webWidgets[_controller.webWidgetIndex],
        ),
      );
}
