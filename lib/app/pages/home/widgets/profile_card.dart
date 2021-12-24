import 'package:flutter/material.dart';
import 'package:omf_netflix/app/app.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
    this.onTap,
    this.prefixIcon,
    this.title
  }) : super(key: key);
  final void Function()? onTap;
  final IconData? prefixIcon;
  final String? title;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: Dimens.fourtyEight,
          child: Card(
            elevation: Dimens.zero,
            color: ColorsValue.greyBoxColor,
            child: Row(
              children: [
                Padding(
                  padding: Dimens.edgeInsets5_0_5_0,
                  child: Icon(
                    prefixIcon,
                    color: ColorsValue.whiteColor,
                    size: Dimens.fourteen,
                  ),
                ),
                Dimens.boxWidth5,
                Text(
                  title!,
                  style: Styles.primaryText12,
                ),
                const Spacer(),
                Padding(
                  padding: Dimens.edgeInsets5_0_5_0,
                  child: const Icon(
                    Icons.keyboard_arrow_right,
                    color: ColorsValue.greyLightColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
