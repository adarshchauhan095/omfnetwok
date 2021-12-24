import 'package:flutter/material.dart';
import 'package:omf_netflix/app/app.dart';
import 'package:omf_netflix/domain/domain.dart';

class CircularIndicatorButton extends StatelessWidget {
  CircularIndicatorButton({Key? key, required this.buttonIndicator, this.onTap})
      : super(key: key);

  final ButtonIndicator buttonIndicator;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          width: Dimens.thirtyTwo,
          height: Dimens.thirtyTwo,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.fifty),
            color: ColorsValue.whiteColor,
          ),
          child: Center(
            child: Icon(
              (ButtonIndicator.left == buttonIndicator)
                  ? Icons.keyboard_arrow_left
                  : Icons.keyboard_arrow_right,
              color: ColorsValue.blackColor,
              size: Dimens.thirty,
            ),
          ),
        ),
      );
}
