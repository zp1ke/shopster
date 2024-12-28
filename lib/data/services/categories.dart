import 'package:shopster/common/images.dart';
import 'package:shopster/features/shop/models/category.dart';

class ShopCategoryService {
  static ShopCategoryService? _instance;

  factory ShopCategoryService() {
    _instance ??= ShopCategoryService._();
    return _instance!;
  }

  final _categories = List<ShopCategory>.generate(10, (index) {
    return ShopCategory(
      name: 'Category ${index + 1}',
      imageUrl: AppImage.fakeImageUrl(width: 64, text: 'CAT-${index + 1}'),
    );
  });

  ShopCategoryService._();

  List<ShopCategory> get allCategories {
    return List.unmodifiable(_categories);
  }
}
