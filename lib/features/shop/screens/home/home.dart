import 'package:flutter/material.dart';
import 'package:shopster/common/images.dart';
import 'package:shopster/common/styles/sizes.dart';
import 'package:shopster/common/styles/theme.dart';
import 'package:shopster/common/widgets/image/icons.dart';
import 'package:shopster/common/widgets/image/image_rounded.dart';
import 'package:shopster/features/shop/controllers/shop.dart';
import 'package:shopster/features/shop/models/category.dart';
import 'package:shopster/features/shop/models/page.dart';
import 'package:shopster/features/shop/screens/home/app_bar.dart';
import 'package:shopster/features/shop/screens/home/products_carousel.dart';
import 'package:shopster/features/shop/screens/store/store.dart';
import 'package:shopster/features/shop/screens/wish/wish.dart';
import 'package:shopster/features/shop/widgets/shop_categories.dart';
import 'package:shopster/features/shop/widgets/shop_header.dart';
import 'package:shopster/features/shop/widgets/shop_search_bar.dart';
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
      imageUrl: AppImage.fakeImageUrl(64, text: 'CAT-${index + 1}'),
    );
  });

  List<ImageRounded> highlightProducts(BuildContext context) {
    final width =
        MediaQuery.of(context).size.width - (AppSize.defaultSpacing * 2);
    final imagesUrl = List<String>.generate(
      5,
      (index) {
        return AppImage.fakeImageUrl(350,
            height: 200, text: 'HIGHLIGHT-${index + 1}');
      },
    );
    return imagesUrl.map(
      (image) {
        return ImageRounded(
          image,
          backgroundColor: Theme.of(context).highlightColor,
          width: width,
          onPressed: () {
            ShopController.I.navToPage(StorePage.pageId);
          },
        );
      },
    ).toList(growable: false);
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
          ProductsCarousel(
            products: highlightProducts(context),
          ),
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
}
