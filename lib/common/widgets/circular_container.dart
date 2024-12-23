import 'package:flutter/material.dart';
import 'package:shopster/common/styles/sizes.dart';

class CircularContainer extends StatelessWidget {
  final double width;
  final double height;
  final Color backgroundColor;
  final double? radius;

  const CircularContainer({
    super.key,
    this.width = AppSize.shopHeaderSize,
    this.height = AppSize.shopHeaderSize,
    required this.backgroundColor,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? width),
        color: backgroundColor,
      ),
    );
  }
}
