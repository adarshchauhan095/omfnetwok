import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omf_netflix/app/app.dart';

/// Global Button is a Custom Buttom UI.
///
/// Which will Handel Prefix Icon, Suffix Icon, And Title of the Button
/// [title] : Takes the Button title
/// [onTap] : Method to be action
/// [prefixIcon] : Icon Before the label
///
class GlobalButton extends StatelessWidget {
  GlobalButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.titleStyle,
    this.buttonColor = ColorsValue.primaryColor,
    this.isTransparent = false,
    this.height,
    this.width,
    this.prefixIcon,
    this.isDisable = false,
  }) : super(key: key);

  final String? title;
  final TextStyle? titleStyle;
  final Color? buttonColor;
  final bool? isTransparent;
  final void Function()? onTap;
  final double? width;
  final double? height;
  final Widget? prefixIcon;
  final bool isDisable;

  @override
  Widget build(BuildContext context) => Opacity(
        key: key,
        opacity: isDisable ? 0.5 : 1,
        child: Container(
          key: key,
          height: height == null ? Dimens.fifty : height,
          constraints: BoxConstraints(
              maxWidth: width == null ? Get.width : width ?? Dimens.zero),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              Dimens.seven,
            ),
            child: Container(
              decoration: isTransparent!
                  ? BoxDecoration(
                      border: Border.all(
                          width: Dimens.one, color: ColorsValue.whiteColor),
                      borderRadius: BorderRadius.circular(Dimens.seven))
                  : const BoxDecoration(),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: isTransparent!
                      ? ColorsValue.primaryColor.withOpacity(0)
                      : buttonColor,
                ),
                onPressed: () {
                  if (isDisable) {
                  } else {
                    onTap!();
                  }
                },
                child: Wrap(
                  alignment: WrapAlignment.center,

                  children: [
                    Padding(
                      padding: prefixIcon != null
                          ? Dimens.edgeInsets0_0_10_0
                          : Dimens.edgeInsets0,
                      child: prefixIcon != null ? prefixIcon : Container(),
                    ),
                    Text(
                      title!,
                      overflow: TextOverflow.ellipsis,
                      style: titleStyle,
                    ),
                  ],
                  // ),
                ),
              ),
            ),
          ),
        ),
      );
}
