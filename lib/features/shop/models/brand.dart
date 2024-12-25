import 'package:shopster/features/shop/models/base_item.dart';

class ShopBrand extends BaseItem {
  final bool isVerified;
  final int productsAmount;

  ShopBrand({
    required super.name,
    required super.imageUrl,
    required this.isVerified,
    this.productsAmount = 0,
  });
}
