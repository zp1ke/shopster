import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shopster/common/images.dart';
import 'package:shopster/common/styles/index.dart';
import 'package:shopster/common/widgets/image/icons.dart';
import 'package:shopster/common/widgets/image/image_rounded.dart';
import 'package:shopster/features/shop/controllers/shop.dart';
import 'package:shopster/features/shop/models/category.dart';
import 'package:shopster/features/shop/models/page.dart';
import 'package:shopster/features/shop/models/product.dart';
import 'package:shopster/features/shop/screens/home/app_bar.dart';
import 'package:shopster/features/shop/screens/home/products_carousel.dart';
import 'package:shopster/features/shop/screens/store/store.dart';
import 'package:shopster/features/shop/screens/wish/wish.dart';
import 'package:shopster/features/shop/widgets/index.dart';
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
  final categories = List<ShopCategory>.generate(10, (index) {
    return ShopCategory(
      name: 'Category ${index + 1}',
      imageUrl: AppImage.fakeImageUrl(width: 64, text: 'CAT-${index + 1}'),
    );
  });

  final products = List<ShopProduct>.generate(10, (index) {
    final verified = index > 0 && index % 2 == 0;
    return ShopProduct(
      name: 'Product ${index + 1}',
      brand: 'Brand',
      brandVerified: verified,
      imageUrl: AppImage.fakeImageUrl(
        width: 200,
        height: 200,
        text: 'PRODUCT-${index + 1}',
      ),
      isFav: index % 2 != 0,
      price: 10 + index * 5.34,
      discountPercent: verified ? index * 5 : null,
      promoImageUrl: verified
          ? AppImage.fakeImageUrl(
              width: 350,
              height: 200,
              text: 'PROMO-${index + 1}',
            )
          : null,
    );
  });

  List<Widget> highlightProducts(BuildContext context) {
    final width =
        MediaQuery.of(context).size.width - (AppSize.defaultSpacing * 2);
    return products
        .where((product) => product.promoImageUrl != null)
        .map((product) {
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
                ShopSearchBar(hintText: AppL10n.of(context).shopHomeSearchHint),
                categoriesWidget(context, categories),
              ],
            ),
          ),
          productsWidget(context),
        ],
      ),
    );
  }

  Widget categoriesWidget(BuildContext context, List<ShopCategory> categories) {
    final appL10n = AppL10n.of(context);
    return ShopCategoriesWidget(
      title: appL10n.shopHomePopularCategories,
      categories: categories,
      foregroundColor: Theme.of(context).colorScheme.app.shopHeaderForeground,
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
          productsGrid(context),
        ],
      ),
    );
  }

  Widget productsGrid(BuildContext context) {
    var cardWidth = AppSize.productCardWidth;
    final screenWidth =
        MediaQuery.of(context).size.width - AppSize.itemSpacing * 2;
    if (screenWidth / cardWidth < 2) {
      cardWidth = max(screenWidth / 2, AppSize.productCardMinWidth);
    }
    return Wrap(
      spacing: AppSize.itemSpacing,
      runSpacing: AppSize.itemSpacing,
      children: products
          .map((product) => ProductCardVertical(
                product: product,
                size: cardWidth,
              ))
          .toList(growable: false),
    );
  }
}
