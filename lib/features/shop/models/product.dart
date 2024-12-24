class ShopProduct {
  final String name;
  final String brand;
  final bool brandVerified;
  final String imageUrl;
  final bool isFav;
  final double price;
  final String? promoImageUrl;
  final int? discountPercent;

  ShopProduct({
    required this.name,
    required this.brand,
    required this.brandVerified,
    required this.imageUrl,
    required this.isFav,
    required this.price,
    this.promoImageUrl,
    this.discountPercent,
  });
}
