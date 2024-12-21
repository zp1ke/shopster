import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopster/features/shop/controllers/shop.dart';

class ShopScreen extends StatelessWidget {
  static const path = '/shop';

  static GetPage route() {
    return GetPage(name: path, page: () => ShopScreen());
  }

  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ShopController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          selectedIndex: controller.pageIndex,
          onDestinationSelected: (index) {
            controller.pageIndex = index;
          },
          destinations: controller.menu(context),
        ),
      ),
      body: Obx(() => controller.page),
    );
  }
}
