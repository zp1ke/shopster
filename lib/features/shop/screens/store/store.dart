import 'package:flutter/material.dart';
import 'package:shopster/common/styles/index.dart';
import 'package:shopster/common/widgets/image/icons.dart';
import 'package:shopster/common/widgets/section_heading.dart';
import 'package:shopster/data/services/brands.dart';
import 'package:shopster/data/services/categories.dart';
import 'package:shopster/features/shop/models/page.dart';
import 'package:shopster/features/shop/widgets/brand_card.dart';
import 'package:shopster/features/shop/widgets/cards_grid.dart';
import 'package:shopster/features/shop/widgets/category_view.dart';
import 'package:shopster/features/shop/widgets/index.dart';
import 'package:shopster/features/shop/widgets/tab_bar.dart';
import 'package:shopster/l10n/app_l10n.dart';

class StorePage extends ShopPage {
  static const pageId = 'store';

  @override
  String get id => pageId;

  @override
  NavigationDestination buildNavigationMenu(BuildContext context) {
    return NavigationDestination(
      icon: const Icon(AppIcons.storeOutline),
      selectedIcon: const Icon(AppIcons.storeFilled),
      label: AppL10n.of(context).shopStore,
    );
  }

  @override
  Widget buildWidget() {
    return _StoreScreen();
  }
}

class _StoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: ShopCategoryService().allCategories.length,
      child: Scaffold(
        appBar: appBar(context),
        body: body(context),
      ),
    );
  }

  PreferredSizeWidget appBar(BuildContext context) {
    return ShopAppBar(
      titleText: AppL10n.of(context).shopStore,
      backgroundColor: Theme.of(context).canvasColor,
      actions: [
        ShopCartButton(),
      ],
    );
  }

  Widget body(BuildContext context) {
    final categories = ShopCategoryService().allCategories;
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            floating: true,
            backgroundColor: Theme.of(context).canvasColor,
            expandedHeight: AppSize.storeAppBarHeight,
            flexibleSpace: header(context),
            bottom: ShopTabBar(
              tabs: categories
                  .map((category) => Tab(child: Text(category.name)))
                  .toList(growable: false),
            ),
          ),
        ];
      },
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: AppSize.itemSpacing),
        child: TabBarView(
          children: categories.map((category) {
            return CategoryView(category: category);
          }).toList(growable: false),
        ),
      ),
    );
  }

  Widget header(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: AppSize.itemSpacing / 2,
        left: AppSize.defaultSpacing,
        right: AppSize.defaultSpacing,
      ),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          ShopSearchBar(hintText: AppL10n.of(context).shopStoreSearchHint),
          featuresBrandsHeader(context),
          featuresBrands(context),
        ],
      ),
    );
  }

  Widget featuresBrandsHeader(BuildContext context) {
    return SectionHeadingWidget(
      title: AppL10n.of(context).shopStoreFeaturedBrands,
      foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      actionTitle: AppL10n.of(context).shopStoreViewAllCategories,
      onAction: () {},
    );
  }

  Widget featuresBrands(BuildContext context) {
    final brands = ShopBrandService().popularBrands();
    return CardsGrid(
      itemsCount: brands.length,
      itemBuilder: (context, index, cardWidth) {
        final brand = brands[index];
        return BrandCard(
          brand: brand,
          size: cardWidth - AppSize.itemSpacing,
        );
      },
    );
  }
}
