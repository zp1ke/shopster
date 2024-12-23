import 'package:flutter/material.dart';
import 'package:shopster/common/styles/sizes.dart';
import 'package:shopster/common/widgets/image/image.dart';

class ImageTextWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final EdgeInsets? padding;
  final TextStyle? subtitleStyle;

  const ImageTextWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    this.padding,
    this.subtitleStyle,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final imageSize = MediaQuery.of(context).size.height * 0.5;
    return Padding(
      padding: padding ?? const EdgeInsets.all(AppSize.defaultSpacing),
      child: Column(
        spacing: AppSize.itemSpacing,
        children: [
          ImageWidget(image, height: imageSize, fit: BoxFit.scaleDown),
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
}
