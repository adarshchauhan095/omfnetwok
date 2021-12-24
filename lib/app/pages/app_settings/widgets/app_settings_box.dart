import 'package:flutter/material.dart';
import 'package:omf_netflix/app/app.dart';

/// Widget that takes [title], [subTitle], [isLongText], [suffixIcon]
class AppSettingsBox extends StatelessWidget {
  const AppSettingsBox({
    Key? key,
    this.title,
    this.subTitle = '',
    this.isLongText = false,
    this.suffixIcon,
  }) : super(key: key);
  final String? title;
  final String? subTitle;
  final bool? isLongText;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) => Container(
        padding: isLongText! ? Dimens.edgeInsets0_10_0_10 : Dimens.edgeInsets0,
        color: ColorsValue.greyBoxColor,
        constraints: BoxConstraints(
          maxHeight: isLongText! ? double.infinity : Dimens.fiftyFive,
        ),
        child: Padding(
          padding: Dimens.edgeInsets24_0_24_0,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      style: Styles.primaryText14,
                    ),
                    subTitle!.isEmpty
                        ? Dimens.boxHeight0
                        : Text(
                            subTitle!,
                            style: Styles.secondaryText12,
                          ),
                  ],
                ),
              ),
              Icon(
                suffixIcon,
                color: ColorsValue.whiteColor,
                size: Dimens.twentyFive,
              ),
            ],
          ),
        ),
      );
}
