import 'package:flutter/material.dart';
import 'package:omf_netflix/app/app.dart';

class SocialIcon extends StatelessWidget {
  SocialIcon({
    Key? key,
    this.onTap,
    required this.icon,
  }) : super(key: key);
  final void Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Icon(icon,
            color: ColorsValue.footerContentColor, size: Dimens.thirty),
      );
}
