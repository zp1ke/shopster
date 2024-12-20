import 'package:flutter/material.dart';
import 'package:shopster/common/styles/sizes.dart';
import 'package:shopster/common/widgets/logo_hero.dart';

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
        LogoHero(height: logoSize),
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
