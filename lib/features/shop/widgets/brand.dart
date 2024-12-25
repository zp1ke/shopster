import 'package:flutter/material.dart';
import 'package:shopster/common/styles/sizes.dart';
import 'package:shopster/common/widgets/image/icons.dart';
import 'package:shopster/features/shop/models/brand.dart';

class BrandWidget extends StatelessWidget {
  final ShopBrand brand;
  final TextStyle? style;

  const BrandWidget({
    super.key,
    required this.brand,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = style ?? theme.textTheme.labelMedium;
    return Row(
      spacing: AppSize.productCardPadding,
      children: [
        Expanded(
          child: Text(
            brand.name,
            style: textStyle?.apply(color: theme.disabledColor),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
        ),
        if (brand.isVerified)
          Flexible(
            child: Icon(
              AppIcons.verifiedFilled,
              color: theme.primaryColor,
              size: AppSize.iconXs,
            ),
          ),
      ],
    );
  }
}
