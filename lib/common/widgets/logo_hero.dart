import 'package:flutter/material.dart';
import 'package:shopster/common/images.dart';
import 'package:shopster/common/styles/sizes.dart';

class LogoHero extends StatelessWidget {
  static const tag = 'logo-header';

  final double? height;

  const LogoHero({
    super.key,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Image(
        height: height ?? AppSize.logoSize,
        image: AssetImage(AppImage.logo(context)),
      ),
    );
  }
}
