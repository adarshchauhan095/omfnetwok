import 'package:flutter/material.dart';
import 'package:omf_netflix/app/app.dart';

/// [IconButton] that is used to show the [Text] under [Icon]
class PlayListIconButton extends StatelessWidget {
  PlayListIconButton(
      {Key? key,
      required this.iconWidget,
      required this.title,
      this.onTap,
      this.fontSize = 14,
      this.textColor = Colors.white})
      : super(key: key);
  final Widget? iconWidget;
  final String? title;
  final void Function()? onTap;
  final double? fontSize;
  final Color? textColor;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            iconWidget!,
            Dimens.boxHeight4,
            Text(
              title!,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
              ),
            )
          ],
        ),
      );
}
