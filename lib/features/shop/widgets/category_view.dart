import 'package:flutter/material.dart';
import 'package:shopster/common/styles/index.dart';
import 'package:shopster/common/widgets/section_heading.dart';
import 'package:shopster/data/services/brands.dart';
import 'package:shopster/data/services/products.dart';
import 'package:shopster/features/shop/models/category.dart';
import 'package:shopster/features/shop/widgets/brand_show_case.dart';
import 'package:shopster/features/shop/widgets/products_grid.dart';
import 'package:shopster/l10n/app_l10n.dart';

class CategoryView extends StatelessWidget {
  final ShopCategory category;

  const CategoryView({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final brands = ShopBrandService().brandsOf(category);
    final products = ShopProductService().productsOf(brands);
    return SingleChildScrollView(
      child: Column(
        spacing: AppSize.itemSpacing / 2,
        children: [
          ...brands.map(
            (brand) => Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.itemSpacing),
              child: BrandShowCase(brand: brand),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.itemSpacing),
            child: SectionHeadingWidget(
              title: AppL10n.of(context).shopStoreFeaturedProducts,
              foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
              actionTitle: AppL10n.of(context).shopStoreViewAllProducts,
              onAction: () {},
            ),
          ),
          ProductsGrid(products: products),
        ],
      ),
    );
  }
}
