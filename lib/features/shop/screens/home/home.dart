import 'package:flutter/material.dart';
import 'package:shopster/common/styles/sizes.dart';
import 'package:shopster/common/styles/theme.dart';
import 'package:shopster/common/widgets/image/icons.dart';
import 'package:shopster/features/shop/controllers/shop.dart';
import 'package:shopster/features/shop/models/category.dart';
import 'package:shopster/features/shop/models/page.dart';
import 'package:shopster/features/shop/screens/home/app_bar.dart';
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
  @override
  Widget build(BuildContext context) {
    final appL10n = AppL10n.of(context);
    final categories = List<ShopCategory>.generate(10, (index) {
      return ShopCategory(
        name: 'Category ${index + 1}',
        imageUrl: 'https://api.iconify.design/ion/cube.svg',
      );
    });
    return Column(
      children: [
        ShopHeaderWidget(
          child: Column(
            spacing: AppSize.itemSpacing / 2,
            children: [
              HomeAppBar(subtitle: 'TODO NAME'),
              ShopSearchBar(hintText: appL10n.shopHomeSearchHint),
              ShopPopularCategoriesWidget(
                title: appL10n.shopHomePopularCategories,
                categories: categories,
                foregroundColor:
                    Theme.of(context).colorScheme.app.shopHeaderForeground,
                actionTitle: appL10n.shopHomeViewAllCategories,
                onAction: () {
                  ShopController.I.navToPage(StorePage.pageId);
                },
                onCategory: (_) {
                  ShopController.I.navToPage(WishPage.pageId);
                },
              ),
            ],
          ),
        ),
        Center(
          child: Text('HOME TODO'),
        ),
      ],
    );
  }
}
