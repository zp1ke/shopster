import 'package:flutter/material.dart';
import 'package:shopster/common/styles/sizes.dart';
import 'package:shopster/common/widgets/image/image.dart';

class ImageRounded extends StatelessWidget {
  final String image;
  final double? width;
  final double? height;
  final double? borderRadius;
  final BoxFit? fit;
  final BoxBorder? border;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  const ImageRounded(
    this.image, {
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.fit,
    this.border,
    this.backgroundColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theBorderRadius =
        BorderRadius.circular(borderRadius ?? AppSize.buttonRadius);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: theBorderRadius,
        ),
        child: ClipRRect(
          borderRadius: theBorderRadius,
          child: ImageWidget(
            image,
            width: width,
            height: height,
            fit: fit ?? BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
