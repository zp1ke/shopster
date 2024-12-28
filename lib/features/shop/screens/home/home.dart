import 'package:flutter/material.dart';
import 'package:shopster/common/styles/index.dart';
import 'package:shopster/common/widgets/image/icons.dart';
import 'package:shopster/common/widgets/image/image_rounded.dart';
import 'package:shopster/data/services/categories.dart';
import 'package:shopster/data/services/products.dart';
import 'package:shopster/features/shop/controllers/shop.dart';
import 'package:shopster/features/shop/models/page.dart';
import 'package:shopster/features/shop/screens/home/app_bar.dart';
import 'package:shopster/features/shop/screens/home/products_carousel.dart';
import 'package:shopster/features/shop/screens/store/store.dart';
import 'package:shopster/features/shop/screens/wish/wish.dart';
import 'package:shopster/features/shop/widgets/index.dart';
import 'package:shopster/features/shop/widgets/products_grid.dart';
import 'package:shopster/l10n/app_l10n.dart';

class HomePage extends ShopPage {
  @override
  String get id => 'home';

  @override
  NavigationDestination buildNavigationMenu(BuildContext context) {
    return NavigationDestination(
      icon: const Icon(AppIcons.homeOutline),
      selectedIcon: const Icon(AppIcons.homeFilled),
      label: AppL10n.of(context).shopHome,
    );
  }

  @override
  Widget buildWidget() {
    return _HomeScreen();
  }
}

class _HomeScreen extends StatelessWidget {
  List<Widget> highlightProducts(BuildContext context) {
    final width =
        MediaQuery.of(context).size.width - (AppSize.defaultSpacing * 2);
    return ShopProductService().promoProducts.map((product) {
      return AspectRatio(
        aspectRatio: 1.75,
        child: ImageRounded(
          product.promoImageUrl!,
          backgroundColor: Theme.of(context).highlightColor,
          width: width,
          onPressed: () {
            ShopController.I.navToPage(StorePage.pageId);
          },
        ),
      );
    }).toList(growable: false);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ShopHeaderWidget(
            child: Column(
              spacing: AppSize.itemSpacing / 2,
              children: [
                HomeAppBar(subtitle: 'TODO NAME'),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: AppSize.defaultSpacing),
                  child: ShopSearchBar(
                      hintText: AppL10n.of(context).shopHomeSearchHint),
                ),
                categoriesWidget(context),
              ],
            ),
          ),
          productsWidget(context),
        ],
      ),
    );
  }

  Widget categoriesWidget(BuildContext context) {
    final appL10n = AppL10n.of(context);
    return ShopCategoriesWidget(
      title: appL10n.shopHomePopularCategories,
      categories: ShopCategoryService().allCategories,
      foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      actionTitle: appL10n.shopHomeViewAllCategories,
      onAction: () {
        ShopController.I.navToPage(StorePage.pageId);
      },
      onCategory: (_) {
        ShopController.I.navToPage(WishPage.pageId);
      },
    );
  }

  Widget productsWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSize.itemSpacing / 2),
      child: Column(
        spacing: AppSize.itemSpacing,
        children: [
          ProductsCarousel(
            items: highlightProducts(context),
          ),
          ProductsGrid(products: ShopProductService().allProducts),
        ],
      ),
    );
  }
}
