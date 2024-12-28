import 'package:flutter/material.dart';
import 'package:shopster/common/styles/index.dart';
import 'package:shopster/common/widgets/image/icons.dart';
import 'package:shopster/common/widgets/image/image_circular.dart';
import 'package:shopster/common/widgets/rounded_container.dart';
import 'package:shopster/features/shop/models/brand.dart';
import 'package:shopster/l10n/app_l10n.dart';

class BrandCard extends StatelessWidget {
  final ShopBrand brand;
  final double? size;
  final bool withBorder;

  const BrandCard({
    super.key,
    required this.brand,
    this.size,
    this.withBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      width: size,
      radius: AppSize.productCardPadding,
      backgroundColor: Colors.transparent,
      borderColor:
          withBorder ? Theme.of(context).colorScheme.onPrimaryContainer : null,
      padding: EdgeInsets.all(AppSize.brandCardPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: AppSize.itemSpacing / 2,
        children: [
          image(context),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppSize.itemSpacing / 4,
              children: [
                brandName(context),
                description(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget image(BuildContext context) {
    final theme = Theme.of(context);
    final image = ImageCircular(
      size: AppSize.brandsImageHeightSmall,
      color: theme.colorScheme.onPrimaryContainer,
      imageUrl: brand.imageUrl,
    );
    if (brand.isVerified) {
      return Badge(
        backgroundColor: Colors.transparent,
        label: Icon(
          AppIcons.verifiedFilled,
          color: theme.primaryColor,
          size: AppSize.iconXs,
        ),
        child: image,
      );
    }
    return image;
  }

  Widget brandName(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      brand.name,
      style: theme.textTheme.labelMedium?.apply(color: theme.disabledColor),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.start,
    );
  }

  Widget description(BuildContext context) {
    return Text(
      AppL10n.of(context).shopStoreBrandProductsAmount(brand.productsAmount),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.labelMedium,
      textAlign: TextAlign.start,
    );
  }
}
