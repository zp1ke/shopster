import 'package:shopster/data/services/products.dart';
import 'package:shopster/features/shop/models/base_item.dart';
import 'package:shopster/features/shop/models/category.dart';

class ShopBrand extends BaseItem {
  final bool isVerified;
  final int productsAmount;

  ShopBrand({
    required super.name,
    required super.imageUrl,
    required this.isVerified,
    this.productsAmount = 0,
  });

  bool hasCategory(ShopCategory category) {
    final products = ShopProductService().popularProducts(this);
    return products.any((product) => product.hasCategory(category));
  }
}
