import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get I => Get.find();

  final _productsCarouselIndex = 0.obs;

  int get productsCarouselIndex {
    return _productsCarouselIndex.value;
  }

  set productsCarouselIndex(int index) {
    _productsCarouselIndex.value = index;
  }
}
