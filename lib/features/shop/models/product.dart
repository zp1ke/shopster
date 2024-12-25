import 'package:shopster/features/shop/models/base_item.dart';
import 'package:shopster/features/shop/models/brand.dart';

class ShopProduct extends BaseItem {
  final ShopBrand brand;
  final bool isFav;
  final double price;
  final String? promoImageUrl;
  final int? discountPercent;

  ShopProduct({
    required super.name,
    required super.imageUrl,
    required this.brand,
    required this.isFav,
    required this.price,
    this.promoImageUrl,
    this.discountPercent,
  });
}
