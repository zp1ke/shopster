import 'dart:math';

import 'package:shopster/common/images.dart';
import 'package:shopster/features/shop/models/brand.dart';
import 'package:shopster/features/shop/models/category.dart';

class ShopBrandService {
  static ShopBrandService? _instance;

  factory ShopBrandService() {
    _instance ??= ShopBrandService._();
    return _instance!;
  }

  final _brands = List<ShopBrand>.generate(10, (index) {
    return ShopBrand(
      name: 'Brand ${index + 1}',
      imageUrl: AppImage.fakeImageUrl(width: 64, text: 'BRAND-${index + 1}'),
      isVerified: index % 3 == 0,
      productsAmount: 10 + index * 3,
    );
  });

  ShopBrandService._();

  List<ShopBrand> popularBrands({int limit = 4}) {
    return List.unmodifiable(_brands.sublist(0, limit));
  }

  List<ShopBrand> brandsOf(ShopCategory category, {int limit = 2}) {
    final brands = _brands
        .where((brand) => brand.hasCategory(category))
        .toList(growable: false);
    return List.unmodifiable(brands.sublist(0, min(limit, brands.length)));
  }

  List<ShopBrand> get allBrands {
    return List.unmodifiable(_brands);
  }
}
