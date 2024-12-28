import 'package:flutter/material.dart';
import 'package:shopster/common/styles/index.dart';

class RoundedContainer extends StatelessWidget {
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final double? radius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? borderColor;
  final Widget? child;

  const RoundedContainer({
    super.key,
    this.backgroundColor,
    this.width,
    this.height,
    this.radius,
    this.padding,
    this.margin,
    this.borderColor,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theRadius = radius ?? width ?? AppSize.buttonRadius;
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(theRadius),
        border: Border.all(color: borderColor ?? Colors.transparent),
      ),
      child: child,
    );
  }
}
