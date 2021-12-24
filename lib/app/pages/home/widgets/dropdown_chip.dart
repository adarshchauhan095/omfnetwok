import 'package:flutter/material.dart';
import 'package:omf_netflix/app/app.dart';

/// [DropdownChip] is a widget where dropdown icon with a text title.
class DropdownChip extends StatelessWidget {
  const DropdownChip({Key? key, required this.title}) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) => Container(
        color: ColorsValue.greyBoxColor,
        height: Dimens.thirty,
        width: Dimens.percentWidth(Dimens.pointTwo),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              title!,
              style: Styles.primaryText14,
            ),
            Icon(
              Icons.arrow_drop_down,
              color: ColorsValue.whiteColor,
              size: Dimens.twenty,
            )
          ],
        ),
      );
}
