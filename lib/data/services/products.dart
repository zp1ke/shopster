import 'dart:math';

import 'package:shopster/common/images.dart';
import 'package:shopster/data/services/brands.dart';
import 'package:shopster/data/services/categories.dart';
import 'package:shopster/features/shop/models/brand.dart';
import 'package:shopster/features/shop/models/category.dart';
import 'package:shopster/features/shop/models/product.dart';

class ShopProductService {
  static ShopProductService? _instance;

  factory ShopProductService() {
    _instance ??= ShopProductService._();
    return _instance!;
  }

  final _products = List<ShopProduct>.generate(10, (index) {
    final hasPromo = index > 0 && index % 2 == 0;
    final brands = ShopBrandService().popularBrands();
    final categories = _chunkCategories(2);
    return ShopProduct(
      name: 'Product ${index + 1}',
      brand: brands[Random().nextInt(brands.length)],
      categories: categories[Random().nextInt(categories.length)],
      imageUrl: AppImage.fakeImageUrl(
        width: 200,
        height: 200,
        text: 'PRODUCT-${index + 1}',
      ),
      isFav: index % 2 != 0,
      price: 10 + index * 5.34,
      discountPercent: hasPromo ? index * 5 : null,
      promoImageUrl: hasPromo
          ? AppImage.fakeImageUrl(
              width: 350,
              height: 200,
              text: 'PROMO-${index + 1}',
            )
          : null,
    );
  });

  ShopProductService._();

  List<ShopProduct> get promoProducts {
    final products =
        _products.where((product) => product.hasPromo).toList(growable: false);
    return List.unmodifiable(products);
  }

  List<ShopProduct> popularProducts(
    ShopBrand brand, {
    ShopCategory? category,
    int limit = 3,
  }) {
    final products = productsOf([brand], category: category);
    return List.unmodifiable(products.sublist(0, min(limit, products.length)));
  }

  List<ShopProduct> productsOf(
    List<ShopBrand> brands, {
    ShopCategory? category,
  }) {
    assert(brands.isNotEmpty);
    final products = _products
        .where((product) =>
            brands.contains(product.brand) &&
            (category == null || product.hasCategory(category)))
        .toList(growable: false);
    return List.unmodifiable(products);
  }

  List<ShopProduct> get allProducts {
    final products = _products.sublist(0);
    products.sort((product1, product2) {
      if (product1.hasPromo == product2.hasPromo) {
        return product1.price.compareTo(product2.price);
      }
      return product1.hasPromo ? -1 : 1;
    });
    return List.unmodifiable(products);
  }

  static List<List<ShopCategory>> _chunkCategories(int chunkSize) {
    final categories = ShopCategoryService().allCategories;
    final chunks = <List<ShopCategory>>[];
    for (var i = 0; i < categories.length; i += chunkSize) {
      chunks.add(categories.sublist(
          i,
          i + chunkSize > categories.length
              ? categories.length
              : i + chunkSize));
    }
    return chunks;
  }
}
