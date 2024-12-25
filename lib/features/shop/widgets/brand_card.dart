import 'package:flutter/material.dart';
import 'package:shopster/common/styles/index.dart';
import 'package:shopster/common/widgets/image/image_circular.dart';
import 'package:shopster/common/widgets/rounded_container.dart';
import 'package:shopster/features/shop/models/brand.dart';
import 'package:shopster/features/shop/widgets/brand.dart';
import 'package:shopster/l10n/app_l10n.dart';

class BrandCard extends StatelessWidget {
  final ShopBrand brand;
  final double size;

  const BrandCard({
    super.key,
    required this.brand,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RoundedContainer(
      width: size,
      radius: AppSize.productCardPadding,
      backgroundColor: Colors.transparent,
      borderColor: theme.colorScheme.onPrimaryContainer,
      padding: EdgeInsets.all(AppSize.brandCardPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: AppSize.itemSpacing,
        children: [
          Flexible(
            child: ImageCircular(
              size: AppSize.categoriesImageHeightSmall,
              color: theme.colorScheme.onPrimaryContainer,
              imageUrl: brand.imageUrl,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppSize.itemSpacing / 4,
              children: [
                BrandWidget(brand: brand),
                Text(
                  AppL10n.of(context)
                      .shopStoreBrandProductsAmount(brand.productsAmount),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
