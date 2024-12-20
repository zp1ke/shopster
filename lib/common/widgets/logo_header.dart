import 'package:flutter/material.dart';
import 'package:shopster/common/images.dart';
import 'package:shopster/common/styles/sizes.dart';

class LogoHeaderWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final double? logoSize;

  const LogoHeaderWidget({
    super.key,
    required this.title,
    this.subtitle,
    this.logoSize,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      spacing: AppSize.itemSpacing,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Hero(
          tag: 'logo-header',
          child: Image(
            height: logoSize ?? AppSize.logoSize,
            image: AssetImage(AppImage.logo(context)),
          ),
        ),
        Text(
          title,
          style: textTheme.headlineMedium,
          textAlign: TextAlign.end,
        ),
        if (subtitle != null)
          Text(
            subtitle!,
            style: textTheme.bodyMedium,
            textAlign: TextAlign.end,
          ),
      ],
    );
  }
}
