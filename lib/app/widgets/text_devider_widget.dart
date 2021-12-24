import 'package:flutter/material.dart';
import 'package:omf_netflix/app/app.dart';

/// [TextDevider] is Custom [Divider] Which holds a [Text] in between.
///
/// Can be change the Left and Right indents of the [Divider] by:
///
/// [leftStartIndent],
///
/// [leftEndIndent],
///
/// [rightEndIndent],
///
/// [rightStartIndent]
class TextDevider extends StatelessWidget {
  TextDevider({
    Key? key,
    required this.text,
    
    this.color = ColorsValue.blackColor,
    required this.leftStartIndent,
    required this.leftEndIndent,
    required this.rightEndIndent,
    required this.rightStartIndent,
    this.textStyle,
  }) : super(key: key);
  final String? text;
  
  final Color? color;
  final double? leftStartIndent;
  final double? leftEndIndent;
  final double? rightStartIndent;
  final double? rightEndIndent;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) =>
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Expanded(
            child: Divider(
          thickness: Dimens.one,
          indent: leftStartIndent,
          endIndent: leftEndIndent,
          color: color,
        )),
        Text(
          text!,
          style: textStyle,
        ),
        Expanded(
            child: Divider(
          indent: rightStartIndent,
          endIndent: rightEndIndent,
          thickness: Dimens.one,
          color: color,
        )),
      ]);
}
