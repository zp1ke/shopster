import 'package:flutter/material.dart';
import 'package:shopster/common/styles/sizes.dart';

class CircularContainer extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final Color? backgroundColor;

  const CircularContainer({
    super.key,
    this.width = AppSize.shopHeaderSize,
    this.height = AppSize.shopHeaderSize,
    this.radius = AppSize.shopHeaderSize,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: (backgroundColor ?? Theme.of(context).canvasColor)
            .withValues(alpha: 0.1),
      ),
    );
  }
}
