import 'package:flutter/material.dart';
import 'package:omf_netflix/app/app.dart';

/// CircleImageAvatar is Circular Image/Icon container
///
/// [borderRadius] is required
///
/// [child] : Icon or Image or any Widget
///
class CircleImageAvatar extends StatelessWidget {
  const CircleImageAvatar({
    Key? key,
    required this.borderRadius,
    this.borderWidth = 1.0,
    this.borderColor = ColorsValue.blackColor,
    this.width = 10.0,
    this.height = 10.0,
    this.color,
    required this.child,
    this.onTap,
  }) : super(key: key);

  final double? borderRadius;
  final double? borderWidth;
  final Color? borderColor;
  final double? width;
  final double? height;
  final Widget? child;
  final Color? color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius!),
            border: Border.all(
              width: borderWidth!,
              color: borderColor!,
            ),
            color: color,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius!),
            child: child,
          ),
        ),
      );
}
