import 'package:flutter/material.dart';
import 'package:shopster/features/shop/models/product.dart';
import 'package:shopster/features/shop/widgets/cards_grid.dart';
import 'package:shopster/features/shop/widgets/index.dart';

class ProductsGrid extends StatelessWidget {
  final List<ShopProduct> products;

  const ProductsGrid({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return CardsGrid(
      itemsCount: products.length,
      itemBuilder: (context, index, cardWidth) {
        final product = products[index];
        return ProductCardVertical(
          product: product,
          size: cardWidth,
        );
      },
    );
  }
}
