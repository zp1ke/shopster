import 'package:shopster/features/shop/models/base_item.dart';
import 'package:shopster/features/shop/models/brand.dart';
import 'package:shopster/features/shop/models/category.dart';

class ShopProduct extends BaseItem {
  final ShopBrand brand;
  final List<ShopCategory> categories;
  final bool isFav;
  final double price;
  final String? promoImageUrl;
  final int? discountPercent;

  ShopProduct({
    required super.name,
    required super.imageUrl,
    required this.brand,
    required this.categories,
    required this.isFav,
    required this.price,
    this.promoImageUrl,
    this.discountPercent,
  });

  bool get hasPromo => promoImageUrl != null;

  bool hasCategory(ShopCategory category) {
    return categories.any((cat) => cat.name == category.name);
  }
}
