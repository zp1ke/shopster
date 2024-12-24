import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shopster/common/styles/sizes.dart';
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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemUiOverlayStyle(context),
      child: Scaffold(
        bottomNavigationBar: Obx(
          () => NavigationBar(
            selectedIndex: controller.pageIndex,
            indicatorShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(AppSize.buttonRadius),
              ),
            ),
            onDestinationSelected: (index) {
              controller.pageIndex = index;
            },
            destinations: controller.menu(context),
          ),
        ),
        body: Obx(() => controller.page),
      ),
    );
  }

  SystemUiOverlayStyle systemUiOverlayStyle(BuildContext context) {
    final theme = Theme.of(context);
    return SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: theme.colorScheme.surface,
      statusBarBrightness: theme.brightness,
      statusBarIconBrightness: theme.brightness,
      systemNavigationBarIconBrightness: theme.brightness,
      systemNavigationBarContrastEnforced: true,
      systemStatusBarContrastEnforced: true,
    );
  }
}
