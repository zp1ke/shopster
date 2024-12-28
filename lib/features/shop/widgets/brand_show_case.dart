import 'package:flutter/material.dart';
import 'package:shopster/common/styles/index.dart';
import 'package:shopster/common/widgets/image/image.dart';
import 'package:shopster/common/widgets/rounded_container.dart';
import 'package:shopster/data/services/products.dart';
import 'package:shopster/features/shop/models/brand.dart';
import 'package:shopster/features/shop/models/product.dart';
import 'package:shopster/features/shop/widgets/brand_card.dart';

class BrandShowCase extends StatelessWidget {
  final ShopBrand brand;

  const BrandShowCase({
    super.key,
    required this.brand,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      borderColor: Theme.of(context).dividerColor,
      padding: EdgeInsets.all(AppSize.itemSpacing / 2),
      child: Column(
        spacing: AppSize.itemSpacing,
        children: [
          BrandCard(brand: brand, withBorder: false),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ShopProductService()
                .popularProducts(brand)
                .map((product) => brandProduct(context, product))
                .toList(growable: false),
          ),
        ],
      ),
    );
  }

  Widget brandProduct(BuildContext context, ShopProduct product) {
    return RoundedContainer(
      height: AppSize.productBrandCardHeight,
      backgroundColor: Theme.of(context).cardColor,
      padding: EdgeInsets.all(AppSize.productCardPadding),
      child: ImageWidget(product.imageUrl),
    );
  }
}
