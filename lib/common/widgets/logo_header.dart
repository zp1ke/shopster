import 'package:flutter/material.dart';
import 'package:shopster/common/images.dart';
import 'package:shopster/common/styles/sizes.dart';

class LogoHeaderWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const LogoHeaderWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      spacing: AppSize.itemSpacing,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Image(
          height: AppSize.logoSize,
          image: AssetImage(AppImage.logo(context)),
        ),
        Text(
          title,
          style: textTheme.headlineMedium,
        ),
        Text(
          subtitle,
          style: textTheme.bodyMedium,
        ),
      ],
    );
  }
}
