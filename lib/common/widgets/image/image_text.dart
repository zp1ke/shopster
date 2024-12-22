import 'package:flutter/material.dart';
import 'package:shopster/common/styles/sizes.dart';
import 'package:shopster/common/widgets/image/asset_animation.dart';

class ImageTextWidget extends StatelessWidget {
  final String? image;
  final String? animation;
  final String title;
  final String subtitle;
  final EdgeInsets? padding;
  final TextStyle? subtitleStyle;

  const ImageTextWidget({
    super.key,
    this.image,
    this.animation,
    required this.title,
    required this.subtitle,
    this.padding,
    this.subtitleStyle,
  }) : assert(image != null || animation != null);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: padding ?? const EdgeInsets.all(AppSize.defaultSpacing),
      child: Column(
        spacing: AppSize.itemSpacing,
        children: [
          imageWidget(context),
          Text(
            title,
            style: textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          Text(
            subtitle,
            style: subtitleStyle ?? textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget imageWidget(BuildContext context) {
    final size = MediaQuery.of(context).size.height * 0.5;
    if (animation != null) {
      return AssetAnimation(
        animation!,
        height: size,
        fit: BoxFit.scaleDown,
      );
    }
    return Image(
      image: AssetImage(image!),
      height: size,
      fit: BoxFit.scaleDown,
    );
  }
}
