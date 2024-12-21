import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopster/common/widgets/icons.dart';
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
          destinations: [
            NavigationDestination(
              icon: const Icon(AppIcons.homeOutline),
              selectedIcon: const Icon(AppIcons.homeFilled),
              label: 'HOME TODO',
            ),
            NavigationDestination(
              icon: const Icon(AppIcons.storeOutline),
              selectedIcon: const Icon(AppIcons.storeFilled),
              label: 'STORE TODO',
            ),
            NavigationDestination(
              icon: const Icon(AppIcons.heartOutline),
              selectedIcon: const Icon(AppIcons.heartFilled),
              label: 'WISH TODO',
            ),
            NavigationDestination(
              icon: const Icon(AppIcons.userOutline),
              selectedIcon: const Icon(AppIcons.userFilled),
              label: 'PROFILE TODO',
            ),
          ],
        ),
      ),
      body: Obx(() => controller.page),
    );
  }
}
