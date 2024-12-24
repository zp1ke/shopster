import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopster/common/styles/index.dart';
import 'package:shopster/common/widgets/circular_container.dart';
import 'package:shopster/common/widgets/image/image_rounded.dart';
import 'package:shopster/features/shop/controllers/home.dart';

class ProductsCarousel extends StatelessWidget {
  final List<ImageRounded> products;

  const ProductsCarousel({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final theme = Theme.of(context);
    return Column(
      spacing: AppSize.itemSpacing,
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppSize.defaultSpacing),
          child: CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) {
                controller.productsCarouselIndex = index;
              },
            ),
            items: products,
          ),
        ),
        Obx(() => Row(
              mainAxisSize: MainAxisSize.min,
              spacing: AppSize.itemSpacing / 2,
              children: List<Widget>.generate(products.length, (index) {
                final selected = index == controller.productsCarouselIndex;
                return RoundedContainer(
                  width: AppSize.iconXs * 1.5,
                  height: AppSize.iconXs / 1.5,
                  backgroundColor: selected
                      ? theme.indicatorColor
                      : theme.disabledColor,
                );
              }),
            )),
      ],
    );
  }
}
